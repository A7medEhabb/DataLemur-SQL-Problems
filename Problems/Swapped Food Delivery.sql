SELECT 
  o1.order_id AS corrected_order_id,
  COALESCE(o2.item, o1.item) AS item
FROM orders o1
LEFT JOIN orders o2
  ON o2.order_id = 
    CASE 
      WHEN o1.order_id %2 !=0 THEN o1.order_id + 1
      ELSE o1.order_id - 1
    END 
order by corrected_order_id
