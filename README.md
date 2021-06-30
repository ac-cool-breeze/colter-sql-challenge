CHALLENGE 1: All of the vacation destinations. (I went back, I think you wanted just the names.)
Query: SELECT name FROM destinations;
Results: 
        name
    ------------------
    Thailand
    Tristan da Cunha
    The Bahamas
    New Zealand
    Scotland

https://i.gyazo.com/c99bb0b0b340ed0749eb6f298daa080e.png



CHALLENGE 2: All destinations where you can swim at the beach.
Query: SELECT * FROM destinations WHERE has_beaches = true;
Results:
    id |       name       | average_temp | has_beaches | has_mountains | cost_of_flight
    ----+------------------+--------------+-------------+---------------+----------------
    1 | Thailand         |           82 | t           | t             |            765
    3 | New Zealand      |           66 | t           | t             |            433
    5 | Tristan da Cunha |           59 | t           | t             |           1304

    (https://i.gyazo.com/c3715bc3ee68e236484db163b3805a3d.png)



CHALLENGE 3: All destinations where the average temperature is over 60 degrees.
Query: SELECT * FROM destinations WHERE average_temp > 60;
Results:
    id |    name     | average_temp | has_beaches | has_mountains | cost_of_flight
    ----+-------------+--------------+-------------+---------------+----------------
    1 | Thailand    |           82 | t           | t             |            765
    3 | New Zealand |           66 | t           | t             |            433

    (https://i.gyazo.com/c917828d1f48de8ca021e0ab809313da.png)



CHALLENGE 4: All destinations where you can swim at the beach AND go to the mountains.
Query: SELECT * FROM destinations WHERE has_beaches = true AND has_mountains = true;
Results:
    id |       name       | average_temp | has_beaches | has_mountains | cost_of_flight
    ----+------------------+--------------+-------------+---------------+----------------
    1 | Thailand         |           82 | t           | t             |            765
    3 | New Zealand      |           66 | t           | t             |            433
    5 | Tristan da Cunha |           59 | t           | t             |           1304

    (https://i.gyazo.com/fe4a2a194646ba63b214146d0c3665e6.png)



CHALLENGE 5: All destinations where flights cost less than $500 and you can hike in the mountains.
Query: SELECT * FROM destinations WHERE cost_of_flight < 500 AND has_mountains = true;
Results:
    id |    name     | average_temp | has_beaches | has_mountains | cost_of_flight
    ----+-------------+--------------+-------------+---------------+----------------
    3 | New Zealand |           66 | t           | t             |            433

    (https://i.gyazo.com/6aae9dedc642bb32e8eb1c8384188ef9.png)



CHALLENGE 6: Add an entry for The Bahamas, where the average temperature is 78, it has beaches but no mountains, and the flights cost $345.
Query: INSERT INTO destinations ( name, average_temp, has_beaches, has_mountains, cost_of_flight) VALUES ( 'The Bahamas', 78, true, false, 345);
Results:
    INSERT 0 1

    id |       name       | average_temp | has_beaches | has_mountains | cost_of_flight
    ----+------------------+--------------+-------------+---------------+----------------
    1 | Thailand         |           82 | t           | t             |            765
    2 | Minnesota        |           41 | f           | f             |            235
    3 | New Zealand      |           66 | t           | t             |            433
    4 | England          |           45 | f           | f             |            290
    5 | Tristan da Cunha |           59 | t           | t             |           1304
    6 | The Bahamas      |           78 | t           | f             |            345


    (https://i.gyazo.com/1a42380f10ea95bed3690b7550be6004.png)



CHALLENGE 7: Turns out, the cost of flights to New Zealand has increased! Update New Zealand's entry for flight cost to $1000.
Query: UPDATE destinations SET cost_of_flight = '1000' WHERE name = 'New Zealand';
Results:
    UPDATE 1

    id |       name       | average_temp | has_beaches | has_mountains | cost_of_flight
    ----+------------------+--------------+-------------+---------------+----------------
    1 | Thailand         |           82 | t           | t             |            765
    2 | Minnesota        |           41 | f           | f             |            235
    4 | England          |           45 | f           | f             |            290
    5 | Tristan da Cunha |           59 | t           | t             |           1304
    6 | The Bahamas      |           78 | t           | f             |            345
    3 | New Zealand      |           66 | t           | t             |           1000

    (https://i.gyazo.com/efd52359a0d2181e5b98925fd5a73bed.png)



CHALLENGE 8: Turns out, Minnesota isn't a vacation destination. Please delete it from the database.
Query: DELETE FROM destinations WHERE name = 'Minnesota';
Results:
    DELETE 1

    id |       name       | average_temp | has_beaches | has_mountains | cost_of_flight
    ----+------------------+--------------+-------------+---------------+----------------
    1 | Thailand         |           82 | t           | t             |            765
    4 | England          |           45 | f           | f             |            290
    5 | Tristan da Cunha |           59 | t           | t             |           1304
    6 | The Bahamas      |           78 | t           | f             |            345
    3 | New Zealand      |           66 | t           | t             |           1000

    (https://i.gyazo.com/5d83c3496c1d818c695f714fe54f0f31.png)



CHALLENGE 9: When the data set was written, the author mistakently wrote "England" when they actually meant "Scotland". Please update that entry in the database.
Query: UPDATE destinations SET name = 'Scotland' WHERE name = 'England';
Results:
    UPDATE 1

    id |       name       | average_temp | has_beaches | has_mountains | cost_of_flight
    ----+------------------+--------------+-------------+---------------+----------------
    1 | Thailand         |           82 | t           | t             |            765
    5 | Tristan da Cunha |           59 | t           | t             |           1304
    6 | The Bahamas      |           78 | t           | f             |            345
    3 | New Zealand      |           66 | t           | t             |           1000
    4 | Scotland         |           45 | f           | f             |            290

    (https://i.gyazo.com/c5760c483570b97f4f12428cc3d3efd3.png)



CHALLENGE 10: Create a join table that joins the airlines and the destinations tables by correlating which airlines fly to which destinations.
Query: 

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

Results:
    id | airlines_id | destinations_id
    ----+-------------+-----------------
    1 |           1 |               3
    2 |           1 |               4
    3 |           2 |               5
    4 |           2 |               4
    5 |           2 |               1
    6 |           3 |               1
    7 |           3 |               4
    8 |           4 |               3
    9 |           4 |               5

    Testing SubQuery INSERT: (https://i.gyazo.com/b409942225aa540912ed2d0b600dcf99.png)
    Rest of the INSERTs: (https://i.gyazo.com/4baf3703974c3595f041fa0992859f53.png)



CHALLENGE 11: All airlines that fly to New Zealand.
Query: SELECT airlines.name FROM airlines WHERE airlines.id IN (SELECT airlines_id FROM airlines_destinations WHERE destinations_id = (SELECT destinations.id FROM destinations WHERE destinations.name = 'New Zealand'));
Results:
    name
    -----------
    Spirit
    Southwest
    (2 rows)

    (https://i.gyazo.com/3bbba5131ce30d44a068d2c4fb743a7b.png)



CHALLENGE 12: All airlines that do NOT fly to Scotland.
Query: 

    SELECT airlines.name FROM airlines WHERE airlines.id IN (SELECT DISTINCT airlines_id FROM airlines_destinations WHERE airlines_id NOT IN (SELECT airlines_id FROM airlines_destinations WHERE destinations_id =(SELECT destinations.id FROM destinations WHERE destinations.name = 'Scotland')));

Results:
    name
    -----------
    Southwest

    (https://i.gyazo.com/a680d7c7d566d684d5c97c0ab7737450.png)



CHALLENGE 13: All of the data for all vacation destinations.
Query: SELECT name, average_temp, has_beaches, has_mountains, cost_of_flight FROM destinations;
Results:
        name       | average_temp | has_beaches | has_mountains | cost_of_flight
    ------------------+--------------+-------------+---------------+----------------
    Thailand         |           82 | t           | t             |            765
    Tristan da Cunha |           59 | t           | t             |           1304
    The Bahamas      |           78 | t           | f             |            345
    New Zealand      |           66 | t           | t             |           1000
    Scotland         |           45 | f           | f             |            290

    (https://i.gyazo.com/636f7bc47b905a24b27587481409e323.png)
