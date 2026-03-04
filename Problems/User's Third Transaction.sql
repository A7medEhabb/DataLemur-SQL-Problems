WITH cte AS (
  SELECT 
    user_id,
    spend,
    transaction_date,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) as RN
  FROM
    transactions
)

select
  user_id,
  spend,
  transaction_date
from cte
WHERE RN=3;
