WITH monthly_active AS (
  SELECT
    DISTINCT user_id,
    EXTRACT(Month from event_date) as Month,
    EXTRACT(YEAR FROM event_date) as Year
  FROM
    user_actions
),
CTE AS (
  SELECT 
    user_id,
    month,
    year,
    LAG(month) OVER(PARTITION BY user_id ORDER BY year,month) AS prev_month
  FROM 
    monthly_active
)
SELECT 
  7 as month,
  COUNT(*) as monthly_active_users
FROM
  CTE 
WHERE 
  month=7
  AND 
  year=2022
  AND 
  prev_month = 6
