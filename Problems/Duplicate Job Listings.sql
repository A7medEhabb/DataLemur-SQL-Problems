WITH cte AS (
  SELECT
    company_id,
    title,
    description,
    COUNT(job_id) AS job_count
  FROM 
    job_listings
  GROUP BY 
    company_id,
    title,
    description
)
SELECT 
  COUNT(DISTINCT company_id) AS duplicates_compaines
FROM 
  cte 
WHERE job_count >= 2 
