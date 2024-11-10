# Write your MySQL query statement below
SELECT 
    user_id, 
    name, 
    mail
FROM 
    Users
WHERE 
    -- Ensure email ends with @leetcode.com
    mail LIKE '%@leetcode.com' 
    -- Ensure the prefix starts with a letter (can use regular expressions if supported)
    AND mail REGEXP '^[A-Za-z][A-Za-z0-9._-]*@leetcode.com$';