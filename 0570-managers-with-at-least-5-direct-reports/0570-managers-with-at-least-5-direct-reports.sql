# Write your MySQL query statement below
SELECT e.name
FROM Employee e
JOIN (
    SELECT managerId, COUNT(*) AS num_direct_reports
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
) AS sub
ON e.id = sub.managerId
WHERE sub.num_direct_reports >= 5;
