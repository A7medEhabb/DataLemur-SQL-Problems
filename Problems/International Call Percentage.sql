WITH cte AS (
  SELECT 
    pi1.country_id as caller_country ,pi2.country_id as Reciever_country
  FROM
    phone_calls pc
  JOIN 
    phone_info pi1 
  ON 
    pc.caller_id= pi1.caller_id
  JOIN 
    phone_info pi2
  ON 
    pc.receiver_id = pi2.caller_id
)
SELECT 

  ROUND (100.0 *SUM(
    CASE WHEN caller_country <> Reciever_country THEN 1 ELSE 0 END  
  )/
  COUNT(*), 1 )AS international_calls_pct

FROM cte
