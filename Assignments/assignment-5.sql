-- Print out the current time, date
SELECT CURTIME();
SELECT CURDATE();

-- Print out the Current day of the week
SELECT DAYOFWEEK(NOW());

-- +------------------+
-- | DAYOFWEEK(NOW()) |
-- +------------------+
-- |                1 |
-- +------------------+
-- 1 row in set (0.00 sec)

SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%W');

-- +----------------+
-- | DAYNAME(NOW()) |
-- +----------------+
-- | Sunday         |
-- +----------------+
-- 1 row in set (0.00 sec)


-- Print out the current day and time using mm/dd/yyyy format
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');

-- +------------------------------------+
-- | DATE_FORMAT(CURDATE(), '%m/%d/%Y') |
-- +------------------------------------+
-- | 05/21/2023                         |
-- +------------------------------------+
-- 1 row in set (0.00 sec)


-- Print out the current day and time using this format: January 2nd at 3:15
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

-- +--------------------------------------+
-- | DATE_FORMAT(NOW(), '%M %D at %h:%i') |
-- +--------------------------------------+
-- | May 21st at 11:49                    |
-- +--------------------------------------+
-- 1 row in set (0.00 sec)


CREATE TABLE tweets (
    tweet_content TEXT,
    user_name VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO tweets(tweet_content, user_name)
VALUES ('tweet-1', 'Mayuka');

-- +---------------+-----------+---------------------+---------------------+
-- | tweet_content | user_name | created_at          | updated_at          |
-- +---------------+-----------+---------------------+---------------------+
-- | tweet-1       | Mayuka    | 2023-05-21 11:42:45 | 2023-05-21 11:42:45 |
-- +---------------+-----------+---------------------+---------------------+
-- 1 row in set (0.00 sec)

UPDATE tweets
SET tweet_content='updated tweet-1'
WHERE user_name='Mayuka';

-- +-----------------+-----------+---------------------+---------------------+
-- | tweet_content   | user_name | created_at          | updated_at          |
-- +-----------------+-----------+---------------------+---------------------+
-- | updated tweet-1 | Mayuka    | 2023-05-21 11:42:45 | 2023-05-21 11:43:47 |
-- +-----------------+-----------+---------------------+---------------------+
-- 1 row in set (0.00 sec)