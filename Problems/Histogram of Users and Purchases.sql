WITH cte AS (
  SELECT product_id,	user_id,	transaction_date,
         RANK() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) AS RN
  FROM 
    user_transactions
)

SELECT 
  user_id,
  transaction_date, 
  count(product_id) as purchase_count
FROM 
  cte 
WHERE RN =1 
GROUP BY 
  user_id,	
  transaction_date
ORDER BY 
  transaction_date
