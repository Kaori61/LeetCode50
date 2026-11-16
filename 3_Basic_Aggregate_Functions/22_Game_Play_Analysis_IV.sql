WITH Login1 AS (
    SELECT
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
    ),
Login2 AS (
    SELECT
        a.player_id
    FROM Activity AS a
    JOIN Login1 AS l
    ON a.player_id = l.player_id
    AND a.event_date = DATE_ADD(first_login, INTERVAL 1 DAY)
)
SELECT 
    ROUND(
        COUNT(l2.player_id) 
        / COUNT(l1.player_id)
        ,2) AS fraction
FROM Login1 AS l1
LEFT JOIN Login2 AS l2
    ON l1.player_id = l2.player_id;