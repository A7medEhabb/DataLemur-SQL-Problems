WITH cte AS (
  SELECT 
    category,
    product,
    SUM(spend) as total_spend,
    RANK() OVER(PARTITION BY category order by SUM(spend) DESC) as Rank
  FROM
    product_spend
  WHERE 
    DATE_PART('YEAR',transaction_date ) = 2022
  group by category, product
)
SELECT 
  category, product, total_spend
FROM cte 
WHERE Rank < 3

