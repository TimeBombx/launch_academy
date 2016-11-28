DROP TABLE IF EXISTS zoning_types CASCADE;

CREATE TABLE zoning_types (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE
);

DROP TABLE IF EXISTS construction_types CASCADE;

CREATE TABLE construction_types (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE
);

DROP TABLE IF EXISTS accounts CASCADE;

CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  zoning_type_id INT REFERENCES zoning_types(id),
  construction_type_id INT REFERENCES construction_types(id)
);
