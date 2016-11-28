-- DEFINE YOUR DATABASE SCHEMA HERE

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
  id serial PRIMARY KEY,
  first_name varchar(100),
  last_name varchar(100),
  email varchar(100)
);

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  id serial PRIMARY KEY,
  name varchar(100),
  account_number varchar(100)
);

DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id serial PRIMARY KEY,
  name varchar(100)
);

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
  id serial PRIMARY KEY,
  employee int REFERENCES employees(id),
  customer int REFERENCES customers(id),
  product int REFERENCES products(id),
  sale_date date,
  sale_amount int,
  units_sold int,
  invoice_no int,
  invoice_frequency varchar(100)
);