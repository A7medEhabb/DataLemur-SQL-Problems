WITH cte AS (
SELECT 
  *,
  ROW_NUMBER()OVER(PARTITION BY card_name ORDER BY issue_year,issue_month ASC) as RN 
FROM 
  monthly_cards_issued 
)
select card_name, issued_amount
from  cte 
WHERE RN=1
ORDER BY issued_amount DESC
