WITH rank_measures AS (
  SELECT
    measurement_time::date,
    measurement_value,
    ROW_NUMBER() OVER(PARTITION BY measurement_time::date ORDER BY measurement_time) AS num 
  
  FROM 
    measurements

)
SELECT
  measurement_time::date,
  SUM(
    CASE WHEN num % 2 != 0 THEN measurement_value ELSE 0 END
  ) AS odd_sum,
  SUM(
    CASE WHEN num % 2 = 0 THEN measurement_value ELSE 0 END
  ) AS even_sum
FROM rank_measures 
GROUP BY measurement_time::date
ORDER BY measurement_time::date
