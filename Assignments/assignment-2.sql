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


SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));

-- +----------------------------------------------------------------+
-- | REVERSE(UPPER('Why does my cat look at me with such hatred?')) |
-- +----------------------------------------------------------------+
-- | ?DERTAH HCUS HTIW EM TA KOOL TAC YM SEOD YHW                   |
-- +----------------------------------------------------------------+
-- 1 row in set (0.00 sec)


-- Replace spaces in titles with '->'
SELECT REPLACE(title, ' ', '->')
FROM books;

-- +--------------------------------------------------------------+
-- | REPLACE(title, ' ', '->')                                    |
-- +--------------------------------------------------------------+
-- | The->Namesake                                                |
-- | Norse->Mythology                                             |
-- | American->Gods                                               |
-- | Interpreter->of->Maldives                                    |
-- | A->Hologram->for->the->King:->A->Novel                       |
-- | The->Circle                                                  |
-- | The->Amazing->Adventures->of->Kavalier->&->Clay              |
-- | Just->Kids                                                   |
-- | A->Heartbreaking->Work->of->Staggering->Genius               |
-- | Coraline                                                     |
-- | What->We->Talk->About->When->We->Talk->About->Love:->Stories |
-- | Where->I'm->Calling->From:->Selected->Stories                |
-- | White->Noise                                                 |
-- | Cannery->Row                                                 |
-- | Oblivion:->Stories                                           |
-- | Consider->the->Lobster                                       |
-- +--------------------------------------------------------------+
-- 16 rows in set (0.00 sec)


-- Print forwards and backwards of author lname
SELECT author_lname AS forwards, REVERSE(author_lname) AS backwards
FROM books;

-- +----------------+----------------+
-- | forwards       | backwards      |
-- +----------------+----------------+
-- | Lahiri         | irihaL         |
-- | Gaiman         | namiaG         |
-- | Gaiman         | namiaG         |
-- | Lahiri         | irihaL         |
-- | Eggers         | sreggE         |
-- | Eggers         | sreggE         |
-- | Chabon         | nobahC         |
-- | Smith          | htimS          |
-- | Eggers         | sreggE         |
-- | Gaiman         | namiaG         |
-- | Carver         | revraC         |
-- | Carver         | revraC         |
-- | DeLillo        | olliLeD        |
-- | Steinbeck      | kcebnietS      |
-- | Foster Wallace | ecallaW retsoF |
-- | Foster Wallace | ecallaW retsoF |
-- +----------------+----------------+
-- 16 rows in set (0.00 sec)


-- fullname in caps
SELECT UPPER(
    CONCAT(author_fname, ' ', author_lname)
) AS 'full name in caps'
FROM books;

-- +----------------------+
-- | full name in caps    |
-- +----------------------+
-- | JHUMPA LAHIRI        |
-- | NEIL GAIMAN          |
-- | NEIL GAIMAN          |
-- | JHUMPA LAHIRI        |
-- | DAVE EGGERS          |
-- | DAVE EGGERS          |
-- | MICHAEL CHABON       |
-- | PATTI SMITH          |
-- | DAVE EGGERS          |
-- | NEIL GAIMAN          |
-- | RAYMOND CARVER       |
-- | RAYMOND CARVER       |
-- | DON DELILLO          |
-- | JOHN STEINBECK       |
-- | DAVID FOSTER WALLACE |
-- | DAVID FOSTER WALLACE |
-- +----------------------+
-- 16 rows in set (0.00 sec)



-- title released in which year
SELECT CONCAT(
    title, ' was released in ', released_year 
) AS 'blurb'
FROM books;

-- +--------------------------------------------------------------------------+
-- | blurb                                                                    |
-- +--------------------------------------------------------------------------+
-- | The Namesake was released in 2003                                        |
-- | Norse Mythology was released in 2016                                     |
-- | American Gods was released in 2001                                       |
-- | Interpreter of Maldives was released in 1996                             |
-- | A Hologram for the King: A Novel was released in 2012                    |
-- | The Circle was released in 2013                                          |
-- | The Amazing Adventures of Kavalier & Clay was released in 2000           |
-- | Just Kids was released in 2010                                           |
-- | A Heartbreaking Work of Staggering Genius was released in 2001           |
-- | Coraline was released in 2003                                            |
-- | What We Talk About When We Talk About Love: Stories was released in 1981 |
-- | Where I'm Calling From: Selected Stories was released in 1989            |
-- | White Noise was released in 1985                                         |
-- | Cannery Row was released in 1945                                         |
-- | Oblivion: Stories was released in 2004                                   |
-- | Consider the Lobster was released in 2004                                |
-- +--------------------------------------------------------------------------+
-- 16 rows in set (0.00 sec)


-- print book titles and the length of each title
SELECT title, CHAR_LENGTH(title) AS 'character count'
FROM books;

-- +-----------------------------------------------------+-----------------+
-- | title                                               | character count |
-- +-----------------------------------------------------+-----------------+
-- | The Namesake                                        |              12 |
-- | Norse Mythology                                     |              15 |
-- | American Gods                                       |              13 |
-- | Interpreter of Maldives                             |              23 |
-- | A Hologram for the King: A Novel                    |              32 |
-- | The Circle                                          |              10 |
-- | The Amazing Adventures of Kavalier & Clay           |              41 |
-- | Just Kids                                           |               9 |
-- | A Heartbreaking Work of Staggering Genius           |              41 |
-- | Coraline                                            |               8 |
-- | What We Talk About When We Talk About Love: Stories |              51 |
-- | Where I'm Calling From: Selected Stories            |              40 |
-- | White Noise                                         |              11 |
-- | Cannery Row                                         |              11 |
-- | Oblivion: Stories                                   |              17 |
-- | Consider the Lobster                                |              20 |
-- +-----------------------------------------------------+-----------------+
-- 16 rows in set (0.00 sec)


-- Get the bellow output format
SELECT
    CONCAT( SUBSTRING(title, 1, 10), '...' ) AS 'short title',
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM books;

-- +---------------+----------------------+--------------+
-- | short title   | author               | quantity     |
-- +---------------+----------------------+--------------+
-- | The Namesa... | Lahiri,Jhumpa        | 32 in stock  |
-- | Norse Myth... | Gaiman,Neil          | 43 in stock  |
-- | American G... | Gaiman,Neil          | 12 in stock  |
-- | Interprete... | Lahiri,Jhumpa        | 97 in stock  |
-- | A Hologram... | Eggers,Dave          | 154 in stock |
-- | The Circle... | Eggers,Dave          | 26 in stock  |
-- | The Amazin... | Chabon,Michael       | 68 in stock  |
-- | Just Kids...  | Smith,Patti          | 55 in stock  |
-- | A Heartbre... | Eggers,Dave          | 104 in stock |
-- | Coraline...   | Gaiman,Neil          | 100 in stock |
-- | What We Ta... | Carver,Raymond       | 23 in stock  |
-- | Where I'm ... | Carver,Raymond       | 12 in stock  |
-- | White Nois... | DeLillo,Don          | 49 in stock  |
-- | Cannery Ro... | Steinbeck,John       | 95 in stock  |
-- | Oblivion: ... | Foster Wallace,David | 172 in stock |
-- | Consider t... | Foster Wallace,David | 92 in stock  |
-- +---------------+----------------------+--------------+
-- 16 rows in set (0.00 sec)