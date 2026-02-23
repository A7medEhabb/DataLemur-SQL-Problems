WITH cte AS (
    SELECT candidate_id,
    SUM(
      CASE 
        WHEN skill = 'Python' OR skill='Tableau' OR skill = 'PostgreSQL' THEN 1
        ELSE 0
      END
    )  as number
    FROM candidates
    group by candidate_id

)

SELECT candidate_id
FROM cte 
WHERE number =3
