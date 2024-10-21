# Write your MySQL query statement below

WITH UserRequests AS (
  SELECT
    s.user_id,
    COUNT(*) AS total_requests
  FROM
    Signups s
  LEFT JOIN
    Confirmations c ON s.user_id = c.user_id
  GROUP BY
    s.user_id
)

SELECT
  ur.user_id,
  ROUND(
    IFNULL(
      COUNT(CASE WHEN c.action = 'confirmed' THEN 1 END) / ur.total_requests,
      0
    ),
    2
  ) AS confirmation_rate
FROM
  UserRequests ur
LEFT JOIN
  Confirmations c ON ur.user_id = c.user_id
GROUP BY
  ur.user_id;