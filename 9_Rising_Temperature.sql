SELECT t.id
FROM Weather as t
JOIN Weather as y
    ON DATEDIFF(t.recordDate, y.recordDate) = 1
WHERE t.temperature > y.temperature;