WITH Total_weight AS (
    SELECT
        *,
        SUM(weight) OVER (ORDER BY turn) as total    
    FROM Queue
)
SELECT
    person_name
FROM Total_weight
WHERE total <= 1000
ORDER BY turn DESC
LIMIT 1;