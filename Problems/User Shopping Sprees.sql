SELECT 
  user_id
FROM 
  transactions 
GROUP BY 
  user_id
HAVING COUNT(user_id) = 3
ORDER BY user_id ASC;
