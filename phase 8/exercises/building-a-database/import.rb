# Use this file to import data from the CSV and populate your database

require "pg"
require "csv"
require "pry"

def db_connection
  begin
    connection = PG.connect(dbname: "building-database")
    yield(connection)
  ensure
    connection.close
  end
end

def get_type_value(db, name)
  type = nil
  db_connection do |conn|
    type = conn.exec_params(
      "SELECT id FROM #{db} WHERE name=$1",
      [name]
    )
  end
  type
end

def find_or_create_type(db, name)
  type = nil
  db_connection do |conn|
    type = get_type_value(db, name)
    type = conn.exec_params(
      "INSERT INTO #{db} (name) VALUES($1)",
      [name]
    ) if type.ntuples == 0
  end
  type.getvalue(0, 0) if type.ntuples > 0
end

def import
  CSV.foreach("data.csv", headers: true) do |row|
    name = row['name']
    zoning_type = row['zoning_type']
    construction_type = row['construction_type']

    con_id = find_or_create_type('construction_types', construction_type)
    zoning_id = find_or_create_type('zoning_types', zoning_type)


    db_connection do |conn|
      conn.exec_params(
        'INSERT INTO accounts (name, zoning_type_id, construction_type_id) VALUES($1, $2, $3)',
        [name, zoning_id, con_id]
      )
    end
  end
end

import