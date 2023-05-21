CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50)
);

CREATE TABLE papers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(id) ON DELETE CASCADE
);

INSERT INTO students(first_name)
VALUES ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

-- +----+------------+
-- | id | first_name |
-- +----+------------+
-- |  1 | Caleb      |
-- |  2 | Samantha   |
-- |  3 | Raj        |
-- |  4 | Carlos     |
-- |  5 | Lisa       |
-- +----+------------+

INSERT INTO papers (student_id, title, grade) VALUES
    (1, 'My First Book Report', 60),
    (1, 'My Second Book Report', 75),
    (2, 'Russian Lit Through The Ages', 94),
    (2, 'De Montaigne and The ART of THE Essay', 98),
    (4, 'Borges and Magical Realism', 89);

-- +----+---------------------------------------+-------+------------+
-- | id | title                                 | grade | student_id |
-- +----+---------------------------------------+-------+------------+
-- |  1 | My First Book Report                  | 60    |          1 |
-- |  2 | My Second Book Report                 | 75    |          1 |
-- |  3 | Russian Lit Through The Ages          | 94    |          2 |
-- |  4 | De Montaigne and The ART of THE Essay | 98    |          2 |
-- |  5 | Borges and Magical Realism            | 89    |          4 |
-- +----+---------------------------------------+-------+------------+


-- Make the table happen
SELECT first_name, title, grades
FROM students
INNER JOIN papers
    ON students.id = papers.student_id
ORDER BY grade DESC;

-- +------------+---------------------------------------+-------+
-- | first_name | title                                 | grade |
-- +------------+---------------------------------------+-------+
-- | Samantha   | De Montaigne and The ART of THE Essay | 98    |
-- | Samantha   | Russian Lit Through The Ages          | 94    |
-- | Carlos     | Borges and Magical Realism            | 89    |
-- | Caleb      | My Second Book Report                 | 75    |
-- | Caleb      | My First Book Report                  | 60    |
-- +------------+---------------------------------------+-------+
-- 5 rows in set (0.01 sec)


-- Make the table happen
SELECT first_name, title, grade
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id;

-- +------------+---------------------------------------+-------+
-- | first_name | title                                 | grade |
-- +------------+---------------------------------------+-------+
-- | Caleb      | My First Book Report                  | 60    |
-- | Caleb      | My Second Book Report                 | 75    |
-- | Samantha   | Russian Lit Through The Ages          | 94    |
-- | Samantha   | De Montaigne and The ART of THE Essay | 98    |
-- | Raj        | NULL                                  | NULL  |
-- | Carlos     | Borges and Magical Realism            | 89    |
-- | Lisa       | NULL                                  | NULL  |
-- +------------+---------------------------------------+-------+
-- 7 rows in set (0.00 sec)


-- Make the table happen
SELECT first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0)
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id;

-- +------------+---------------------------------------+------------------+
-- | first_name | IFNULL(title, 'MISSING')              | IFNULL(grade, 0) |
-- +------------+---------------------------------------+------------------+
-- | Caleb      | My First Book Report                  | 60               |
-- | Caleb      | My Second Book Report                 | 75               |
-- | Samantha   | Russian Lit Through The Ages          | 94               |
-- | Samantha   | De Montaigne and The ART of THE Essay | 98               |
-- | Raj        | MISSING                               | 0                |
-- | Carlos     | Borges and Magical Realism            | 89               |
-- | Lisa       | MISSING                               | 0                |
-- +------------+---------------------------------------+------------------+
-- 7 rows in set (0.00 sec)


-- Make the table happen (avg of grades for each student)
SELECT first_name, AVG(IFNULL(grade, 0)) AS average
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average DESC;

-- +------------+---------+
-- | first_name | average |
-- +------------+---------+
-- | Samantha   |      96 |
-- | Carlos     |      89 |
-- | Caleb      |    67.5 |
-- | Raj        |       0 |
-- | Lisa       |       0 |
-- +------------+---------+
-- 5 rows in set (0.01 sec)


-- Add one more column passing_status
SELECT first_name, AVG(IFNULL(grade, 0)) AS average,
    CASE
        WHEN AVG(IFNULL(grade, 0)) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average DESC;

-- +------------+---------+----------------+
-- | first_name | average | passing_status |
-- +------------+---------+----------------+
-- | Samantha   | 96.0000 | PASSING        |
-- | Carlos     | 89.0000 | PASSING        |
-- | Caleb      | 67.5000 | FAILING        |
-- | Raj        |  0.0000 | FAILING        |
-- | Lisa       |  0.0000 | FAILING        |
-- +------------+---------+----------------+
-- 5 rows in set (0.00 sec)