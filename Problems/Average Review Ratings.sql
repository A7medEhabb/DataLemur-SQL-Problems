SELECT 
  DATE_PART('MONTH',submit_date ) as mth,
  product_id,
  ROUND(AVG(stars) ,2 )
FROM 
  reviews 
GROUP BY 
  mth, product_id
ORDER BY 
  mth, product_id
