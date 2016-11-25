-- If you want to run this schema repeatedly you'll need to drop
-- the table before re-creating it. Note that you'll lose any
-- data if you drop and add a table:

-- DROP TABLE IF EXISTS articles;

-- Define your schema here:

-- CREATE TABLE articles (
--   <column definitions go here>
-- );
DROP TABLE IF EXISTS articles;

CREATE TABLE articles (
  id serial PRIMARY KEY,
  title varchar(500) UNIQUE NOT NULL,
  url varchar(500) UNIQUE NOT NULL,
  description varchar(500) UNIQUE,
  dateCreated timestamp DEFAULT current_timestamp
);