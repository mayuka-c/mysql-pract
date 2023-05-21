-- Verify condition in SQL
SELECT 99 > 1;

-- +--------+
-- | 99 > 1 |
-- +--------+
-- |      1 |
-- +--------+
-- 1 row in set (0.00 sec)

SELECT 44 < 1;

-- +--------+
-- | 44 < 1 |
-- +--------+
-- |      0 |
-- +--------+
-- 1 row in set (0.00 sec)

SELECT 'A' = 'a';

-- +-----------+
-- | 'A' = 'a' |
-- +-----------+
-- |         1 |
-- +-----------+
-- 1 row in set (0.00 sec)


-- Convert date to dateTime
SELECT CAST(CURDATE() AS DATETIME);

-- +-----------------------------+
-- | CAST(CURDATE() AS DATETIME) |
-- +-----------------------------+
-- | 2023-05-21 00:00:00         |
-- +-----------------------------+
-- 1 row in set (0.00 sec)


-- Create a new genre column in books table using case statement based on below condt
SELECT title, released_year,
    CASE
        WHEN released_year >= 2000 THEN 'Modern Lit'
        ELSE '20th Century Lit'
    END AS genre
FROM books;

-- +-----------------------------------------------------+---------------+------------------+
-- | title                                               | released_year | genre            |
-- +-----------------------------------------------------+---------------+------------------+
-- | The Namesake                                        |          2003 | Modern Lit       |
-- | Norse Mythology                                     |          2016 | Modern Lit       |
-- | American Gods                                       |          2001 | Modern Lit       |
-- | Interpreter of Maldives                             |          1996 | 20th Century Lit |
-- | A Hologram for the King: A Novel                    |          2012 | Modern Lit       |
-- | The Circle                                          |          2013 | Modern Lit       |
-- | The Amazing Adventures of Kavalier & Clay           |          2000 | Modern Lit       |
-- | Just Kids                                           |          2010 | Modern Lit       |
-- | A Heartbreaking Work of Staggering Genius           |          2001 | Modern Lit       |
-- | Coraline                                            |          2003 | Modern Lit       |
-- | What We Talk About When We Talk About Love: Stories |          1981 | 20th Century Lit |
-- | Where I'm Calling From: Selected Stories            |          1989 | 20th Century Lit |
-- | White Noise                                         |          1985 | 20th Century Lit |
-- | Cannery Row                                         |          1945 | 20th Century Lit |
-- | Oblivion: Stories                                   |          2004 | Modern Lit       |
-- | Consider the Lobster                                |          2004 | Modern Lit       |
-- | 10% Happier                                         |          2014 | Modern Lit       |
-- | fake_book                                           |          2001 | Modern Lit       |
-- | Lincoln In The Bardo                                |          2017 | Modern Lit       |
-- +-----------------------------------------------------+---------------+------------------+
-- 19 rows in set (0.01 sec)


-- Create a new stock column in books table using case statement based on below condt
SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS stock
FROM books;

-- +-----------------------------------------------------+----------------+-------+
-- | title                                               | stock_quantity | stock |
-- +-----------------------------------------------------+----------------+-------+
-- | The Namesake                                        |             32 | *     |
-- | Norse Mythology                                     |             43 | *     |
-- | American Gods                                       |             12 | *     |
-- | Interpreter of Maldives                             |             97 | **    |
-- | A Hologram for the King: A Novel                    |            154 | ***   |
-- | The Circle                                          |             26 | *     |
-- | The Amazing Adventures of Kavalier & Clay           |             68 | **    |
-- | Just Kids                                           |             55 | **    |
-- | A Heartbreaking Work of Staggering Genius           |            104 | ***   |
-- | Coraline                                            |            100 | **    |
-- | What We Talk About When We Talk About Love: Stories |             23 | *     |
-- | Where I'm Calling From: Selected Stories            |             12 | *     |
-- | White Noise                                         |             49 | *     |
-- | Cannery Row                                         |             95 | **    |
-- | Oblivion: Stories                                   |            172 | ***   |
-- | Consider the Lobster                                |             92 | **    |
-- | 10% Happier                                         |             29 | *     |
-- | fake_book                                           |            287 | ***   |
-- | Lincoln In The Bardo                                |           1000 | ***   |
-- +-----------------------------------------------------+----------------+-------+
-- 19 rows in set (0.00 sec)


-- Select all books written before 1980
SELECT title, released_year
FROM books
WHERE released_year < 1980;

-- +-------------+---------------+
-- | title       | released_year |
-- +-------------+---------------+
-- | Cannery Row |          1945 |
-- +-------------+---------------+
-- 1 row in set (0.00 sec)


-- Select all books written by Eggers or Chabon
SELECT title, author_lname
FROM books
WHERE author_lname IN ('Eggers', 'Chabon');

-- +-------------------------------------------+--------------+
-- | title                                     | author_lname |
-- +-------------------------------------------+--------------+
-- | A Hologram for the King: A Novel          | Eggers       |
-- | The Circle                                | Eggers       |
-- | The Amazing Adventures of Kavalier & Clay | Chabon       |
-- | A Heartbreaking Work of Staggering Genius | Eggers       |
-- +-------------------------------------------+--------------+
-- 4 rows in set (0.00 sec)


-- Select all books written by Lahiri published after 2000
SELECT title, author_lname, released_year
FROM books
WHERE author_lname='Lahiri' AND released_year > 2000;

-- +--------------+--------------+---------------+
-- | title        | author_lname | released_year |
-- +--------------+--------------+---------------+
-- | The Namesake | Lahiri       |          2003 |
-- +--------------+--------------+---------------+
-- 1 row in set (0.00 sec)


-- Select all books with page counts between 100 and 200
SELECT title, pages
FROM books
WHERE pages BETWEEN 100 and 200;

-- +-----------------------------------------------------+-------+
-- | title                                               | pages |
-- +-----------------------------------------------------+-------+
-- | Interpreter of Maldives                             |   198 |
-- | What We Talk About When We Talk About Love: Stories |   176 |
-- | Cannery Row                                         |   181 |
-- +-----------------------------------------------------+-------+
-- 3 rows in set (0.00 sec)


-- Select all books where author_lname starts with a 'C' or an 'S'
SELECT title, author_lname
FROM books
WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

-- +-----------------------------------------------------+--------------+
-- | title                                               | author_lname |
-- +-----------------------------------------------------+--------------+
-- | The Amazing Adventures of Kavalier & Clay           | Chabon       |
-- | Just Kids                                           | Smith        |
-- | What We Talk About When We Talk About Love: Stories | Carver       |
-- | Where I'm Calling From: Selected Stories            | Carver       |
-- | Cannery Row                                         | Steinbeck    |
-- | Lincoln In The Bardo                                | Saunders     |
-- +-----------------------------------------------------+--------------+
-- 6 rows in set (0.00 sec)


-- If title contains 'stories' -> Short stories
-- Just Kids and A Heartbreaking Work -> Memoir
-- Everything Else -> Novel
SELECT title, author_lname,
    CASE
        WHEN title LIKE ('%stories%') THEN 'Short stories'
        WHEN title LIKE ('%Just Kids%') OR title LIKE ('%A heartbreaking work%') THEN 'Memoir'
        ELSE 'NOVEL'
    END AS TYPE
FROM books;

-- +-----------------------------------------------------+----------------+---------------+
-- | title                                               | author_lname   | TYPE          |
-- +-----------------------------------------------------+----------------+---------------+
-- | The Namesake                                        | Lahiri         | NOVEL         |
-- | Norse Mythology                                     | Gaiman         | NOVEL         |
-- | American Gods                                       | Gaiman         | NOVEL         |
-- | Interpreter of Maldives                             | Lahiri         | NOVEL         |
-- | A Hologram for the King: A Novel                    | Eggers         | NOVEL         |
-- | The Circle                                          | Eggers         | NOVEL         |
-- | The Amazing Adventures of Kavalier & Clay           | Chabon         | NOVEL         |
-- | Just Kids                                           | Smith          | Memoir        |
-- | A Heartbreaking Work of Staggering Genius           | Eggers         | Memoir        |
-- | Coraline                                            | Gaiman         | NOVEL         |
-- | What We Talk About When We Talk About Love: Stories | Carver         | Short stories |
-- | Where I'm Calling From: Selected Stories            | Carver         | Short stories |
-- | White Noise                                         | DeLillo        | NOVEL         |
-- | Cannery Row                                         | Steinbeck      | NOVEL         |
-- | Oblivion: Stories                                   | Foster Wallace | Short stories |
-- | Consider the Lobster                                | Foster Wallace | NOVEL         |
-- | 10% Happier                                         | Harris         | NOVEL         |
-- | fake_book                                           | Harris         | NOVEL         |
-- | Lincoln In The Bardo                                | Saunders       | NOVEL         |
-- +-----------------------------------------------------+----------------+---------------+
-- 19 rows in set (0.00 sec)


-- Make the table happen
SELECT author_fname, author_lname, 
    CASE
        WHEN COUNT(*) > 1 THEN CONCAT(COUNT(*), ' ', 'books')
        ELSE CONCAT(COUNT(*), ' ', 'book')
    END AS COUNT
FROM books
GROUP BY author_lname, author_fname;

-- +--------------+----------------+---------+
-- | author_fname | author_lname   | COUNT   |
-- +--------------+----------------+---------+
-- | Jhumpa       | Lahiri         | 2 books |
-- | Neil         | Gaiman         | 3 books |
-- | Dave         | Eggers         | 3 books |
-- | Michael      | Chabon         | 1 book  |
-- | Patti        | Smith          | 1 book  |
-- | Raymond      | Carver         | 2 books |
-- | Don          | DeLillo        | 1 book  |
-- | John         | Steinbeck      | 1 book  |
-- | David        | Foster Wallace | 2 books |
-- | Dan          | Harris         | 1 book  |
-- | Freida       | Harris         | 1 book  |
-- | George       | Saunders       | 1 book  |
-- +--------------+----------------+---------+
-- 12 rows in set (0.00 sec)