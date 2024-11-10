# Write your MySQL query statement below
DELETE p
FROM Person p
JOIN (
    SELECT MIN(id) AS id, email
    FROM Person
    GROUP BY email
) AS unique_emails
ON p.email = unique_emails.email
WHERE p.id > unique_emails.id;