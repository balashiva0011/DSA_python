# Write your MySQL query statement below
WITH FirstLogin AS (
    SELECT 
        player_id,
        MIN(event_date) AS first_login_date
    FROM 
        Activity
    GROUP BY 
        player_id
),
NextDayLogin AS (
    SELECT 
        f.player_id
    FROM 
        FirstLogin f
    JOIN 
        Activity a ON f.player_id = a.player_id
    WHERE 
        a.event_date = DATE_ADD(f.first_login_date, INTERVAL 1 DAY)
)

SELECT 
    ROUND(COALESCE(COUNT(n.player_id), 0) / COUNT(DISTINCT f.player_id), 2) AS fraction
FROM 
    FirstLogin f
LEFT JOIN 
    NextDayLogin n ON f.player_id = n.player_id;