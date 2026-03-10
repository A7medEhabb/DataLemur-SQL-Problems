WITH cte AS (
  SELECT 
    c.customer_id,
    count(DISTINCT  p.product_category) AS product_count
  FROM customer_contracts c
  JOIN products p 
    ON c.product_id = p.product_id 
  GROUP BY c.customer_id
)
SELECT
  customer_id
FROM cte 
WHERE product_count = (SELECT COUNT(DISTINCT product_category) FROM products)
