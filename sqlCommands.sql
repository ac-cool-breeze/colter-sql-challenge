CREATE DATABASE vacations;
\c vacations;
CREATE TABLE destinations (
    id SERIAL,
    name VARCHAR(255),
    average_temp REAL,
    has_beaches BOOLEAN,
    has_mountains BOOLEAN,
    cost_of_flight REAL
);

CREATE TABLE airlines (
    id SERIAL,
    name VARCHAR(255)
);