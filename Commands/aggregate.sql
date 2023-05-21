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
    ('Consider the Lobster', 'David', 'Foster Wallace', 2004, 92, 343),
    ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
    ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
    ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

------------------------------------------------------------------------------------------------

COUNT
--------------------------
SELECT COUNT(*) AS total_books
FROM books;

-- +-------------+
-- | total_books |
-- +-------------+
-- |          19 |
-- +-------------+

SELECT COUNT(DISTINCT author_lname)
FROM books;

-- +------------------------------+
-- | COUNT(DISTINCT author_lname) |
-- +------------------------------+
-- |                           11 |
-- +------------------------------+

SELECT COUNT(DISTINCT author_fname, author_lname)
FROM books;

-- +--------------------------------------------+
-- | COUNT(DISTINCT author_fname, author_lname) |
-- +--------------------------------------------+
-- |                                         12 |
-- +--------------------------------------------+

SELECT COUNT(title)
FROM books
WHERE title LIKE ('%the%');

-- +--------------+
-- | COUNT(title) |
-- +--------------+
-- |            6 |
-- +--------------+


GROUP BY
it summarizes or aggregates identical data into single rows
------------------------------

SELECT title, author_lname
FROM books
GROUP BY author_lname

-- Count how many books each author has written
-- count is doing count on the mega rows created by group by of author_lname
SELECT author_lname, COUNT(*)
FROM books
GROUP BY author_lname;

-- +----------------+----------+
-- | author_lname   | COUNT(*) |
-- +----------------+----------+
-- | Lahiri         |        2 |
-- | Gaiman         |        3 |
-- | Eggers         |        3 |
-- | Chabon         |        1 |
-- | Smith          |        1 |
-- | Carver         |        2 |
-- | DeLillo        |        1 |
-- | Steinbeck      |        1 |
-- | Foster Wallace |        2 |
-- | Harris         |        2 |
-- | Saunders       |        1 |
-- +----------------+----------+

SELECT author_lname, COUNT(*)
FROM books
GROUP BY author_fname, author_lname;

-- +----------------+----------+
-- | author_lname   | COUNT(*) |
-- +----------------+----------+
-- | Lahiri         |        2 |
-- | Gaiman         |        3 |
-- | Eggers         |        3 |
-- | Chabon         |        1 |
-- | Smith          |        1 |
-- | Carver         |        2 |
-- | DeLillo        |        1 |
-- | Steinbeck      |        1 |
-- | Foster Wallace |        2 |
-- | Harris         |        1 |
-- | Harris         |        1 |
-- | Saunders       |        1 |
-- +----------------+----------+

SELECT released_year, COUNT(*) AS no_books_released
FROM books
GROUP BY released_year;

-- +---------------+-------------------+
-- | released_year | no_books_released |
-- +---------------+-------------------+
-- |          2003 |                 2 |
-- |          2016 |                 1 |
-- |          2001 |                 3 |
-- |          1996 |                 1 |
-- |          2012 |                 1 |
-- |          2013 |                 1 |
-- |          2000 |                 1 |
-- |          2010 |                 1 |
-- |          1981 |                 1 |
-- |          1989 |                 1 |
-- |          1985 |                 1 |
-- |          1945 |                 1 |
-- |          2004 |                 2 |
-- |          2014 |                 1 |
-- |          2017 |                 1 |
-- +---------------+-------------------+


MIN & MAX
--------------------------------------
-- Find the minimum released_year
SELECT MIN(released_year)
FROM books;

-- +--------------------+
-- | MIN(released_year) |
-- +--------------------+
-- |               1945 |
-- +--------------------+

-- First year each author published their first book
SELECT CONCAT(author_fname, ' ', author_lname) AS fullname, MIN(released_year) AS min_released_year
FROM books
GROUP BY fullname;

-- +----------------------+-------------------+
-- | fullname             | min_released_year |
-- +----------------------+-------------------+
-- | Jhumpa Lahiri        |              1996 |
-- | Neil Gaiman          |              2001 |
-- | Dave Eggers          |              2001 |
-- | Michael Chabon       |              2000 |
-- | Patti Smith          |              2010 |
-- | Raymond Carver       |              1981 |
-- | Don DeLillo          |              1985 |
-- | John Steinbeck       |              1945 |
-- | David Foster Wallace |              2004 |
-- | Dan Harris           |              2014 |
-- | Freida Harris        |              2001 |
-- | George Saunders      |              2017 |
-- +----------------------+-------------------+

-- What is the longest page of the book
SELECT title, pages
FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

-- +-------------------------------------------+-------+
-- | title                                     | pages |
-- +-------------------------------------------+-------+
-- | The Amazing Adventures of Kavalier & Clay |   634 |
-- +-------------------------------------------+-------+

SELECT title, pages
FROM books
ORDER BY pages DESC
LIMIT 1;

-- Find the longest page count for each author
SELECT CONCAT(author_fname, ' ', author_lname) AS fullname, MAX(pages) AS max_page_count
FROM books
GROUP BY fullname;

-- +----------------------+----------------+
-- | fullname             | max_page_count |
-- +----------------------+----------------+
-- | Jhumpa Lahiri        |            291 |
-- | Neil Gaiman          |            465 |
-- | Dave Eggers          |            504 |
-- | Michael Chabon       |            634 |
-- | Patti Smith          |            304 |
-- | Raymond Carver       |            526 |
-- | Don DeLillo          |            320 |
-- | John Steinbeck       |            181 |
-- | David Foster Wallace |            343 |
-- | Dan Harris           |            256 |
-- | Freida Harris        |            428 |
-- | George Saunders      |            367 |
-- +----------------------+----------------+


SUM
---------------------------------------
SELECT SUM(pages)
FROM books;

-- +------------+
-- | SUM(pages) |
-- +------------+
-- |       6623 |
-- +------------+

-- Sum all pages each author has written
SELECT CONCAT(author_fname, ' ', author_lname) AS fullname, SUM(pages)
FROM books
GROUP BY fullname;

-- +----------------------+------------+
-- | fullname             | SUM(pages) |
-- +----------------------+------------+
-- | Jhumpa Lahiri        |        489 |
-- | Neil Gaiman          |        977 |
-- | Dave Eggers          |       1293 |
-- | Michael Chabon       |        634 |
-- | Patti Smith          |        304 |
-- | Raymond Carver       |        702 |
-- | Don DeLillo          |        320 |
-- | John Steinbeck       |        181 |
-- | David Foster Wallace |        672 |
-- | Dan Harris           |        256 |
-- | Freida Harris        |        428 |
-- | George Saunders      |        367 |
-- +----------------------+------------+


AVG
-------------------------------
SELECT CONCAT(author_fname, ' ', author_lname) AS fullname, AVG(pages)
FROM books
GROUP BY fullname;

-- +----------------------+------------+
-- | fullname             | AVG(pages) |
-- +----------------------+------------+
-- | Jhumpa Lahiri        |   244.5000 |
-- | Neil Gaiman          |   325.6667 |
-- | Dave Eggers          |   431.0000 |
-- | Michael Chabon       |   634.0000 |
-- | Patti Smith          |   304.0000 |
-- | Raymond Carver       |   351.0000 |
-- | Don DeLillo          |   320.0000 |
-- | John Steinbeck       |   181.0000 |
-- | David Foster Wallace |   336.0000 |
-- | Dan Harris           |   256.0000 |
-- | Freida Harris        |   428.0000 |
-- | George Saunders      |   367.0000 |
-- +----------------------+------------+