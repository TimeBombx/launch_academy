-- If you want to run this schema repeatedly you'll need to drop
-- the table before re-creating it. Note that you'll lose any
-- data if you drop and add a table:

DROP TABLE IF EXISTS groceries;

CREATE TABLE groceries (
  id serial PRIMARY KEY,
  name varchar(200)
);

DROP TABLE IF EXISTS comments;

CREATE TABLE comments (
  id serial PRIMARY KEY,
  body varchar(200),
  grocery_id int
);