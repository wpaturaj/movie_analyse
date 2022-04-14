-- Load ratings

DROP TABLE IF EXISTS ratings;
CREATE TABLE ratings ( userId INT, movieId INT, rating NUMERIC(2, 1), TIMESTAMP INT );

COPY ratings 
FROM
   '/var/lib/postgresql/data/ratings.csv' DELIMITER ',' CSV HEADER;

SET
   TIMEZONE TO 'UTC';


-- Create a temporary TIMESTAMP column
ALTER TABLE ratings ADD COLUMN timestamp_holder TIMESTAMPTZ;
-- Copy casted value over to the temporary column
UPDATE
   ratings 
SET
   timestamp_holder = to_timestamp(TIMESTAMP) ;

-- Modify original column using the temporary column
ALTER TABLE ratings ALTER COLUMN TIMESTAMP TYPE TIMESTAMPTZ USING timestamp_holder;

-- Drop the temporary column (after examining altered column values)
ALTER TABLE ratings DROP COLUMN timestamp_holder;


-- Load movies
DROP TABLE IF EXISTS movies;
CREATE TABLE movies ( movieId INT PRIMARY KEY, title TEXT, genres TEXT );

COPY movies 
FROM
   '/var/lib/postgresql/data/movies.csv' DELIMITER ',' CSV HEADER;


-- Load tags
DROP TABLE IF EXISTS tags;
CREATE TABLE tags ( userId INT, movieId INT, tag TEXT, TIMESTAMP INT );

COPY tags 
FROM
   '/var/lib/postgresql/data/tags.csv' DELIMITER ',' CSV HEADER;

-- Create a temporary TIMESTAMP column
ALTER TABLE tags ADD COLUMN timestamp_holder TIMESTAMPTZ;

-- Copy casted value over to the temporary column
UPDATE
   tags 
SET
   timestamp_holder = to_timestamp(TIMESTAMP) ;

-- Modify original column using the temporary column
ALTER TABLE tags ALTER COLUMN TIMESTAMP TYPE TIMESTAMPTZ USING timestamp_holder;

-- Drop the temporary column (after examining altered column values)
ALTER TABLE tags DROP COLUMN timestamp_holder;


-- Load links
DROP TABLE IF EXISTS links;
CREATE TABLE links ( movieId INT, imdbId TEXT, tmdbId INT );

COPY links 
FROM
   '/var/lib/postgresql/data/links.csv' DELIMITER ',' CSV HEADER;