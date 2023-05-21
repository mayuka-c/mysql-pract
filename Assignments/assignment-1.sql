-- create database shirts db
CREATE DATABASE shirts_db;

-- create table shirts
CREATE TABLE shirts (
    shirt_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    article VARCHAR(255),
    color VARCHAR(50),
    shirt_size VARCHAR(5),
    last_worn INT
);

-- add multiple records into shirts table
INSERT INTO shirts(article, color, shirt_size, last_worn)
VALUES ('t-shirt', 'white', 'S', 10), 
    ('t-shirt', 'green', 'S', 200), 
    ('polo shirt', 'black', 'M', 10), 
    ('tank top', 'blue', 'S', 50),
    ('t-shirt', 'pink', 'S', 0),
    ('polo shirt', 'red', 'M', 5),
    ('tank top', 'white', 'S', 200),
    ('tank top', 'blue', 'M',15);

-- add a single record into shirts table but in different order
INSERT INTO shirts(color, article, shirt_size, last_worn)
VALUES ('purple', 'polo shirt', 'M', 50);

-- Select all shirts but print only artice and color
SELECT article, color FROM shirts;

-- Select all medium shirts but print everything except shirt_id
SELECT article, color, shirt_size, last_worn FROM shirts
WHERE shirt_size='M';

-- update all polo shirts by changing their size to L
UPDATE shirts
SET shirt_size='L'
WHERE article='polo shirt';

-- update thw shirt last worn 15 days ago by changing last_worn to 0
UPDATE shirts
SET last_worn=0
WHERE last_worn=15;

-- update all white shirts -> change size to XS and color to off-white
UPDATE shirts
SET shirt_size='XS', color='off white'
WHERE color='white';

-- Delete all old shirts => last worn 200 days ago
DELETE FROM shirts
WHERE last_worn=200;

-- Delete shirts where article is tank-top
DELETE FROM shirts
WHERE article='tank top';

-- Delete everything
DELETE FROM shirts;

-- Delete shirts table
DROP TABLE shirts;

-- Delete database shirts_db
DROP DATABASE shirts_db;