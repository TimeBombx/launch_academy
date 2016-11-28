# Use this file to import the sales information into the
# the database.

require "pg"
require "csv"
require "pry"

def db_connection
  begin
    connection = PG.connect(dbname: "korning")
    yield(connection)
  ensure
    connection.close
  end
end

# employee,
# customer_and_account_no,
# product_name,
# sale_date,
# sale_amount,
# units_sold,
# invoice_no,
# invoice_frequency
#
# Clancy Wiggum (clancy.wiggum@korning.com),
# Motorola (MT928534),
# Chimp Glass,
# 11/13/2012,
# $795219.34,
# 956306,
# 82547,
# Monthly

def create_or_find_employee(employee)
  db_connection do |conn|
    select_sql = %q( SELECT * FROM employees WHERE first_name=$1 AND last_name=$2 AND email=$3 )
    exists = conn.exec_params(select_sql, employee)

    if exists.ntuples == 0
      sql = %q( INSERT INTO employees (first_name, last_name, email) VALUES($1, $2, $3) RETURNING id )
      conn.exec_params(sql, employee)
    else
      exists
    end
  end
end

def create_or_find_customer(customer)
  db_connection do |conn|
    select_sql = %q( SELECT * FROM customers WHERE name=$1 AND account_number=$2 )
    exists = conn.exec_params(select_sql, customer)

    if exists.ntuples == 0
      sql = %q( INSERT INTO customers (name, account_number) VALUES($1, $2) RETURNING id )
      conn.exec_params(sql, customer)
    else
      exists
    end
  end
end

def create_or_find_product(product)
  db_connection do |conn|
    select_sql = %q( SELECT * FROM products WHERE name=$1 )
    exists = conn.exec_params(select_sql, [product])

    if exists.ntuples == 0
      sql = %q( INSERT INTO products (name) VALUES($1) RETURNING id )
      conn.exec_params(sql, [product])
    else
      exists
    end
  end
end

def create_sale(params)
  sql = %q( INSERT INTO sales
    (employee, customer, product, sale_date, sale_amount, units_sold, invoice_no, invoice_frequency)
    VALUES($1, $2, $3, $4, $5, $6, $7, $8)
  )
  db_connection { |conn| conn.exec_params(sql, params) }
end

def import
  CSV.foreach("sales.csv", headers: true) do |row|
    employee = row[0].gsub(/[()]/,"").split(" ")
    customer = row[1].gsub(/[()]/,"").split(" ")
    product_name = row[2]
    sale_date = row[3]
    sale_amount = row[4]
    units_sold = row[5]
    invoice_no = row[6]
    invoice_frequency = row[7]

    employee_id = create_or_find_employee(employee).getvalue(0, 0)
    customer_id = create_or_find_customer(customer).getvalue(0, 0)
    product_id = create_or_find_product(customer).getvalue(0, 0)

    create_sale([
      employee_id,
      customer_id,
      product_id,
      sale_date,
      sale_amount.to_i,
      units_sold,
      invoice_no,
      invoice_frequency
    ])
  end
end

import