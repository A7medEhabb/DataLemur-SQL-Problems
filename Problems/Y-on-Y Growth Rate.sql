WITH year_spendings AS (
  SELECT 
    product_id,
    EXTRACT(YEAR FROM transaction_date) as Year,
    SUM (spend) AS Year_spend
  FROM
    user_transactions 
  GROUP BY
    product_id, year
  ORDER BY 
    year
),
cte AS (
  SELECT 
    year,
    product_id,
    Year_spend AS curr_year_spend,
    LAG(Year_spend) OVER(PARTITION BY product_id ORDER BY year) AS prev_year_spend
  FROM 
    year_spendings
) 
SELECT 
  year,
  product_id,
  curr_year_spend,
  prev_year_spend,
  ROUND (((curr_year_spend -  prev_year_spend)*100/prev_year_spend ),2) AS yoy_rate
FROM 
  cte
