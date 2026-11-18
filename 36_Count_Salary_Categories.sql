WITH salary_count AS (
SELECT
    CASE
        WHEN income < 20000 THEN 'Low Salary'
        WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
        ELSE 'High Salary'
    END AS category,
    COUNT(account_id) as accounts_count
FROM Accounts
GROUP BY category
),
categories AS (
    SELECT 'High Salary' AS category
    UNION ALL
    SELECT 'Low Salary' 
    UNION ALL
    SELECT 'Average Salary'
)
SELECT
    c.category,
    COALESCE(s.accounts_count, 0) as accounts_count
FROM categories AS c
LEFT JOIN salary_count AS s
    ON c.category = s.category;