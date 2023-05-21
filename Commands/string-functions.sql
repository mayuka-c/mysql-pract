CREATE TABLE books (
	book_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT
)

INSERT INTO books(title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
    ('Norse Mythology', 'Neil', 'Gaiman', 2016, 43, 304),
    ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
    ('Interpreter of Maldives', 'Jhumpa', 'Lahiri', 1996, 97, 198),
    ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
    ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
    ('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
    ('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
    ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
    ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
    ('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
    ("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
    ('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
    ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
    ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
    ('Consider the Lobster', 'David', 'Foster Wallace', 2004, 92, 343);


CONCAT
----------------------------------
SELECT CONCAT('Hello', '....', 'World!');

SELECT CONCAT(author_fname, ' ', author_lname) AS 'author_fullname'
FROM books;

SELECT author_fname, author_lname, CONCAT(author_fname, ' ', author_lname) AS 'author_fullname'
FROM books;


CONCAT_WS
----------------------------------
SELECT CONCAT_WS('-', title, author_fname, author_lname) AS title_author
FROM books;


SUBSTRING
----------------------------------
SELECT SUBSTRING('Hello World', 1, 4); -- Hell

SELECT SUBSTRING('Hello World', -3); --rld

SELECT title, SUBSTRING(title, 1, 10) AS short_title
FROM books;


REPLACE
It is case sensitive
-----------------------------------
SELECT REPLACE('Hello World', 'Hell', '&^%$'); -- &^%$o World

SELECT REPLACE('Hello World', 'l', '7'); -- He77o Wor7d

SELECT REPLACE('Hello World', 'o', '0'); -- Hell0 W0rld

SELECT REPLACE('cheese bread coffee milk', ' ', '-'); -- cheese-bread-coffee-milk

SELECT REPLACE(title, 'e', 'E')
FROM books;


REVERSE
-----------------------------------
SELECT REVERSE('Hello World!'); -- !dlroW olleH

SELECT title, REVERSE(title) AS reverse_title
FROM books;


CHAR_LENGTH
-----------------------------------
SELECT CHAR_LENGTH('Hello World!'); -- 12

SELECT title, CHAR_LENGTH(title) AS title_length
FROM books;


Example
Getting the output as "Eggers is 6 characters long"

SELECT CONCAT(title, ' is ', CHAR_LENGTH(title), ' characters long')
FROM books;


UPPER() And LOWER()
--------------------------------------
SELECT UPPER('Hello World'); -- HELLO WORLD

SELECT LOWER('Hello World'); -- hello world

SELECT title, UPPER(title) AS title_upper
FROM books;