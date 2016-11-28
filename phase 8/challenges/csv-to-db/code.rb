#YOUR CODE GOES HERE
require 'pg'
require 'csv'
require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: "ingredients")
    yield(connection)
  ensure
    connection.close
  end
end

def csv_to_db
  CSV.foreach("ingredients.csv") do |row|
    text = row[1]
    db_connection { |conn| conn.exec_params('INSERT INTO ingredient (text) VALUES($1)', [text]) }
  end
end

def read_db
  ingreds = db_connection { |conn| conn.exec_params('SELECT * FROM ingredient') }
  ingreds.ntuples.times do |i|
    puts "#{i+1}. #{ingreds.getvalue(i, 1)}"
  end
end

csv_to_db
read_db