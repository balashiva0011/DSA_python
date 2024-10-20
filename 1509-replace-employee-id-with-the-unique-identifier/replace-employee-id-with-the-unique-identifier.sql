# Write your MySQL query statement below
SELECT  unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI u ON e.id = u.id;