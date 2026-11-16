SELECT e.name
FROM Employee e
JOIN Employee a
    ON e.id = a.managerId
GROUP BY e.id, e.name
HAVING COUNT(a.name) >= 5;