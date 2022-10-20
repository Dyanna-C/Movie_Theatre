-- Syntax:
-- CREATE TABLE table_name( col_name DATA_TYPE, ...)
-- table_name - all lowercase in singular form

-- Create the movie table
CREATE TABLE movie(
	-- column_name DATATYPE <CONSTRAINTS>,
	movie_id SERIAL PRIMARY KEY, -- PRIMARY KEY specifies BOTH UNIQUE AND NOT NULL
	movie_name VARCHAR(100) NOT NULL, -- NOT NULL means that this COLUMN cannot be EMPTY
	genre VARCHAR(50) NOT NULL,
	mpc_rating VARCHAR(100),
	rt_rating VARCHAR(5)
);

CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	price NUMERIC(5,2) NOT NULL,
	show_id VARCHAR(100) NOT NULL,
	show_date VARCHAR(50) NOT NULL,
	tickets_sold INTEGER(10),
	movie_id INTEGER(10), 
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id)

);
-- cant create ticket table,
-- i keep getting erro SQL Error [42601]: ERROR: syntax error at or near "("Position: 169
-- i then remove the (10) from INTEGER which gives me this error 
--SQL Error [42703]: ERROR: column "movie_id" referenced in foreign key constraint does not existError position:
-- I then change INTEGER to VARCHAR and get this error 
--SQL Error [42703]: ERROR: column "movie_id" referenced in foreign key constraint does not exist Error position:
-- I am not sure whats going on. I am not even changing anything in the movie TABLE 
-- yet i keep getting erros that the column movie_id does not exist due to me chnaging the variable type
-- in another table

-- Eventually was able to get the table created after adding the movie_id variable before the Foreign Key

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(10) NOT NULL,
	phone_num VARCHAR(15) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100),
	vip_member BOOLEAN, 
	ticket_id INTEGER,
	FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id)

);