# Write your MySQL query statement below
SELECT 
    patient_id, 
    patient_name, 
    conditions
FROM 
    Patients
WHERE 
    conditions LIKE '% DIAB1%'    -- Check if the condition contains a code starting with DIAB1
    OR conditions LIKE 'DIAB1%'