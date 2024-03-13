-- How many days has each customer visited the restaurant?
 
SELECT 
	customer_id, 
	COUNT(DISTINCT EXTRACT(DAY FROM order_date)) AS days_visited_restaurant
FROM menu AS m
INNER JOIN sales AS s
ON m.product_id = s.product_id
GROUP BY customer_id
ORDER BY customer_id;