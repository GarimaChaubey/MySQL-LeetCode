# Write your MySQL query statement below
WITH FirstLogin AS (
    SELECT 
        player_id,
        MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
)

SELECT
    ROUND(
        COUNT(DISTINCT a2.player_id) * 1.0 / COUNT(DISTINCT fl.player_id),
        2
    ) AS fraction
FROM 
    FirstLogin fl
LEFT JOIN Activity a2 ON fl.player_id = a2.player_id
    AND a2.event_date = DATE_ADD(fl.first_login_date, INTERVAL 1 DAY)
