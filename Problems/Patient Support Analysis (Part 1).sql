WITH cte AS (
  SELECT 
    policy_holder_id,
    COUNT(case_id)
  FROM  
    callers
  GROUP BY 
    policy_holder_id
  HAVING 
    count(case_id) >= 3
)
SELECT
  COUNT(policy_holder_id) AS policy_holder_count
FROM 
  cte 
