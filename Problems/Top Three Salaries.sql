WITH top3 AS (
  SELECT
    name,
    department_id,
    salary,
    DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) as RN
  FROM
    employee
)
SELECT 
  d.department_name,
  e.name,
  e.salary
FROM 
  top3 e
JOIN 
  department d 
  ON e.department_id = d.department_id
WHERE RN <=3
ORDER BY d.department_name, e.salary DESC, e.name
