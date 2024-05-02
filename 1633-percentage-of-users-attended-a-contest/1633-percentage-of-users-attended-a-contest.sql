# Write your MySQL query statement below
-- SQL query to compute the percentage of users who registered for each contest
SELECT
    contest_id,
    ROUND(COUNT(DISTINCT user_id) / total_users * 100.0, 2) AS percentage
FROM
    Register,
    (SELECT COUNT(DISTINCT user_id) AS total_users FROM Users) AS Total
GROUP BY
    contest_id
ORDER BY
    percentage DESC,
    contest_id ASC;
