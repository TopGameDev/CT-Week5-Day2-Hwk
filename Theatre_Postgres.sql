CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	card_number NUMERIC(16)	
);

CREATE TABLE ticket (
	ticket_id SERIAL PRIMARY KEY,
	seat_number NUMERIC,
	price NUMERIC(2,2),
	discount_points NUMERIC(5),
	customer_id INTEGER,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

ALTER TABLE customer
ADD COLUMN discount_points INTEGER

ALTER TABLE customer
DROP COLUMN discount_points

ALTER TABLE ticket 
ALTER COLUMN price TYPE NUMERIC(4,2);

CREATE TABLE movie (
	movie_id SERIAL PRIMARY KEY,
	movie_name VARCHAR(50),
	movie_duration NUMERIC(3,0),
	ticket_id INTEGER,
	FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id)
);

CREATE TABLE theatre (
	theatre_id SERIAL PRIMARY KEY,
	name_id VARCHAR(50),
	movie_id INTEGER,
	FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

ALTER TABLE ticket
ADD COLUMN theatre_id INTEGER;

ALTER TABLE ticket 
ADD FOREIGN KEY (theatre_id) REFERENCES theatre(theatre_id);

ALTER TABLE ticket
ADD COLUMN movie_id INTEGER;

ALTER TABLE ticket  
ADD FOREIGN KEY (movie_id) REFERENCES movie(movie_id);

SELECT *
FROM ticket
