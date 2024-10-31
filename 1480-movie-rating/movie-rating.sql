# Write your MySQL query statement below
WITH UserRatingCounts AS (
    SELECT u.name,
           COUNT(mr.movie_id) AS rating_count
    FROM Users u
    JOIN MovieRating mr ON u.user_id = mr.user_id
    GROUP BY u.user_id
),
TopUser AS (
    SELECT name
    FROM UserRatingCounts
    ORDER BY rating_count DESC, name
    LIMIT 1
),
MovieAverages AS (
    SELECT m.title,
           AVG(mr.rating) AS avg_rating
    FROM Movies m
    JOIN MovieRating mr ON m.movie_id = mr.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.movie_id
),
TopMovie AS (
    SELECT title
    FROM MovieAverages
    ORDER BY avg_rating DESC, title
    LIMIT 1
)
SELECT (SELECT name FROM TopUser) AS results
UNION ALL
SELECT (SELECT title FROM TopMovie) AS results;
