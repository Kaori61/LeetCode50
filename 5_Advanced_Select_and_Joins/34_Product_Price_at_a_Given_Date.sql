WITH original AS (
    SELECT DISTINCT
        product_id,
        10 AS original_price
    FROM Products
),
new AS (
    SELECT
        product_id,
        MAX(change_date) AS latest_date
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

SELECT
    o.product_id,
    COALESCE(p.new_price, o.original_price) AS price
FROM original AS o
LEFT JOIN new AS n
    ON o.product_id = n.product_id
LEFT JOIN Products AS p
    ON p.product_id = n.product_id
    AND p.change_date = n.latest_date;