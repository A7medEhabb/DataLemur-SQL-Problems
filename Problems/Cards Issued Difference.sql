SELECT 
  card_name,
  MAX(issued_amount) - MIN(issued_amount) AS difference
FROM 
  monthly_cards_issued 
group by 
 card_name
ORDER BY 
  difference DESC;
