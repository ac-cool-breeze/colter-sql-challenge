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
INSERT INTO airlines ( name ) VALUES ( 'Spirit' );
INSERT INTO airlines ( name ) VALUES ( 'Lufthansa' );
INSERT INTO airlines ( name ) VALUES ( 'Delta' );
INSERT INTO airlines ( name ) VALUES ( 'Southwest' );
INSERT INTO destinations ( name, average_temp, has_beaches, has_mountains, cost_of_flight) VALUES ( 'Thailand', 82, true, true, 765);
INSERT INTO destinations ( name, average_temp, has_beaches, has_mountains, cost_of_flight) VALUES ( 'Minnesota', 41, false, false, 235);
INSERT INTO destinations ( name, average_temp, has_beaches, has_mountains, cost_of_flight) VALUES ( 'New Zealand', 66, true, true, 433);
INSERT INTO destinations ( name, average_temp, has_beaches, has_mountains, cost_of_flight) VALUES ( 'England', 45, false, false, 290);
INSERT INTO destinations ( name, average_temp, has_beaches, has_mountains, cost_of_flight) VALUES ( 'Tristan da Cunha', 59, true, true, 1304);

INSERT INTO destinations ( name, average_temp, has_beaches, has_mountains, cost_of_flight) VALUES ( 'The Bahamas', 78, true, false, 345);

UPDATE destinations SET cost_of_flight = '1000' WHERE name = 'New Zealand';

DELETE FROM destinations WHERE name = 'Minnesota';

UPDATE destinations SET name = 'Scotland' WHERE name = 'England';

CREATE TABLE airlines_destinations ( id SERIAL, airlines_id INTEGER, destinations_id INTEGER);
INSERT INTO airlines_destinations ( airlines_id, destinations_id ) SELECT airlines.id, destinations.id FROM airlines,destinations WHERE airlines.name ='Spirit' AND destinations.name ='New Zealand';
INSERT INTO airlines_destinations ( airlines_id, destinations_id ) SELECT airlines.id, destinations.id FROM airlines,destinations WHERE airlines.name ='Spirit' AND destinations.name ='Scotland';
INSERT INTO airlines_destinations ( airlines_id, destinations_id ) SELECT airlines.id, destinations.id FROM airlines,destinations WHERE airlines.name ='Lufthansa' AND destinations.name ='Tristan da Cunha';
INSERT INTO airlines_destinations ( airlines_id, destinations_id ) SELECT airlines.id, destinations.id FROM airlines,destinations WHERE airlines.name ='Lufthansa' AND destinations.name ='Scotland';
INSERT INTO airlines_destinations ( airlines_id, destinations_id ) SELECT airlines.id, destinations.id FROM airlines,destinations WHERE airlines.name ='Lufthansa' AND destinations.name ='Thailand';
INSERT INTO airlines_destinations ( airlines_id, destinations_id ) SELECT airlines.id, destinations.id FROM airlines,destinations WHERE airlines.name ='Delta' AND destinations.name ='Thailand';
INSERT INTO airlines_destinations ( airlines_id, destinations_id ) SELECT airlines.id, destinations.id FROM airlines,destinations WHERE airlines.name ='Delta' AND destinations.name ='Scotland';
INSERT INTO airlines_destinations ( airlines_id, destinations_id ) SELECT airlines.id, destinations.id FROM airlines,destinations WHERE airlines.name ='Southwest' AND destinations.name ='New Zealand';
INSERT INTO airlines_destinations ( airlines_id, destinations_id ) SELECT airlines.id, destinations.id FROM airlines,destinations WHERE airlines.name ='Southwest' AND destinations.name ='Tristan da Cunha';