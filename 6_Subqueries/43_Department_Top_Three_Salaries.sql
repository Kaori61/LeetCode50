SELECT 
    Department,
    Employee,
    Salary
FROM (
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER (
            PARTITION BY e.departmentId
            ORDER BY e.salary DESC) AS ranking
    FROM Employee AS e
    JOIN Department AS d
        ON e.departmentId = d.id
    ) AS ranked_salary 
WHERE ranking <=3;


