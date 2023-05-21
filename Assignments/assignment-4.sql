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

-- Print the number of books in database
SELECT COUNT(*)
FROM books;

-- +----------+
-- | COUNT(*) |
-- +----------+
-- |       19 |
-- +----------+
-- 1 row in set (0.00 sec)


-- Print out how many books were released in each year
SELECT released_year, COUNT(*)
FROM books
GROUP BY released_year;

-- +---------------+----------+
-- | released_year | COUNT(*) |
-- +---------------+----------+
-- |          2003 |        2 |
-- |          2016 |        1 |
-- |          2001 |        3 |
-- |          1996 |        1 |
-- |          2012 |        1 |
-- |          2013 |        1 |
-- |          2000 |        1 |
-- |          2010 |        1 |
-- |          1981 |        1 |
-- |          1989 |        1 |
-- |          1985 |        1 |
-- |          1945 |        1 |
-- |          2004 |        2 |
-- |          2014 |        1 |
-- |          2017 |        1 |
-- +---------------+----------+
-- 15 rows in set (0.00 sec)


-- Print out the total number of books in stock
SELECT stock_quantity, COUNT(*)
FROM books
GROUP BY stock_quantity;

-- +----------------+----------+
-- | stock_quantity | COUNT(*) |
-- +----------------+----------+
-- |             32 |        1 |
-- |             43 |        1 |
-- |             12 |        2 |
-- |             97 |        1 |
-- |            154 |        1 |
-- |             26 |        1 |
-- |             68 |        1 |
-- |             55 |        1 |
-- |            104 |        1 |
-- |            100 |        1 |
-- |             23 |        1 |
-- |             49 |        1 |
-- |             95 |        1 |
-- |            172 |        1 |
-- |             92 |        1 |
-- |             29 |        1 |
-- |            287 |        1 |
-- |           1000 |        1 |
-- +----------------+----------+
-- 18 rows in set (0.00 sec)


-- Find the average released_year for each author
SELECT CONCAT(author_fname, ' ', author_lname) AS fullname, AVG(released_year)
FROM books
GROUP BY fullname;

-- +----------------------+--------------------+
-- | fullname             | AVG(released_year) |
-- +----------------------+--------------------+
-- | Jhumpa Lahiri        |          1999.5000 |
-- | Neil Gaiman          |          2006.6667 |
-- | Dave Eggers          |          2008.6667 |
-- | Michael Chabon       |          2000.0000 |
-- | Patti Smith          |          2010.0000 |
-- | Raymond Carver       |          1985.0000 |
-- | Don DeLillo          |          1985.0000 |
-- | John Steinbeck       |          1945.0000 |
-- | David Foster Wallace |          2004.0000 |
-- | Dan Harris           |          2014.0000 |
-- | Freida Harris        |          2001.0000 |
-- | George Saunders      |          2017.0000 |
-- +----------------------+--------------------+
-- 12 rows in set (0.00 sec)


-- find the full name of the author who wrote the longest book
SELECT CONCAT(author_fname, ' ', author_lname) AS fullname, pages
FROM books
WHERE pages = (
    SELECT MAX(pages)
    FROM books
);

SELECT CONCAT(author_fname, ' ', author_lname) AS fullname, pages
FROM books
ORDER BY pages DESC
LIMIT 1;

-- +----------------+-------+
-- | fullname       | pages |
-- +----------------+-------+
-- | Michael Chabon |   634 |
-- +----------------+-------+
-- 1 row in set (0.00 sec)


-- Make the table happen
SELECT released_year AS year, COUNT(*) AS '# books', AVG(pages) AS 'avg pages'
FROM books
GROUP BY released_year
ORDER BY released_year;

-- +------+---------+-----------+
-- | year | # books | avg pages |
-- +------+---------+-----------+
-- | 1945 |       1 |  181.0000 |
-- | 1981 |       1 |  176.0000 |
-- | 1985 |       1 |  320.0000 |
-- | 1989 |       1 |  526.0000 |
-- | 1996 |       1 |  198.0000 |
-- | 2000 |       1 |  634.0000 |
-- | 2001 |       3 |  443.3333 |
-- | 2003 |       2 |  249.5000 |
-- | 2004 |       2 |  336.0000 |
-- | 2010 |       1 |  304.0000 |
-- | 2012 |       1 |  352.0000 |
-- | 2013 |       1 |  504.0000 |
-- | 2014 |       1 |  256.0000 |
-- | 2016 |       1 |  304.0000 |
-- | 2017 |       1 |  367.0000 |
-- +------+---------+-----------+
-- 15 rows in set (0.00 sec)