CREATE database mydb;

USE database mydb;

SELECT database();

CREATE
---------------------------------------------------------------
CREATE TABLE employees_pract (
    id INT NOT NULL AUTO_INCREMENT,
    last_name TEXT NOT NULL auto_i,
    first_name TEXT NOT NULL,
    middle_name TEXT,
    age intINT NOT NULL,
    current_status VARCHAR(50) NOT NULL default 'employed',
    PRIMARY KEY (id));

show tables;

DESC employees_pract;	
	
INSERT INTO employees_pract(last_name, first_name, middle_name, age)
VALUES ("May", "ka", "C", 23), ("App", "oor", "va", 30);
-----------------------------------------------------------------------

READ
-------------------------------------------------------------------------
CREATE Table cats (
    cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT
);

INSERT INTO cats(name, breed, age)
VALUES ('Ringo', 'Tabby', 4), 
    ('Condy', 'Maine Coon', 10), 
    ('Dumbledore', 'Maine Coon', 11), 
    ('Egg', 'Persian', 4),
    ('Misty', 'Tabby', 13),
    ('George Michael', 'Ragdoll', 9),
    ('Jackson', 'Sphynx', 7);

SELECT name FROM cats;
SELECT age FROM cats;
SELECT name, age FROM cats;
SELECT * FROM cats;

SELECT * FROM cats
WHERE age=4;

SELECT * FROM cats
WHERE name='Egg';

SELECT * FROM cats
WHERE name='EGG';

SELECT cat_id, age FROM cats
WHERE cat_id=age;

Aliases
------------------------------------------
SELECT cat_id AS id, name FROM cats;


UPDATE
-----------------------------------------------------------------
UPDATE cats
SET breed='Shothair'
WHERE breed='Tabby';

UPDATE cats
SET age=15
WHERE name='Misty';

UPDATE cats
SET name='Jack'
WHERE name='Jackson';

UPDATE cats
SET breed='British Shorthair'
WHERE name='Ringo';

UPDATE cats
SET age=12
WHERE breed="Maine Coon";

DELETE
-----------------------------------------------------------------
DELETE FROM cats
WHERE name='Egg';

DELETE FROM cats; /* Delete everything */

DELETE FROM cats
WHERE cat_id=age;

