SELECT 
  ROUND(COUNT(t.email_id) :: DECIMAL / 
    COUNT(DISTINCT e.email_id), 2) AS activation_rate
from emails e
left join  texts t
  on e.email_id = t.email_id
  AND t.signup_action = 'Confirmed'
