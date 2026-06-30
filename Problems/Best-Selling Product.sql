WITH cte AS (
  SELECT 
    p.product_id , product_name, category_name, sales_quantity,
    ROW_NUMBER() OVER(PARTITION BY category_name ORDER BY sales_quantity DESC, rating DESC) AS RN 
  FROM
    products p JOIN product_sales ps 
  ON p.product_id = ps.product_id
)
SELECT category_name, product_name
FROM cte 
WHERE rn =1
