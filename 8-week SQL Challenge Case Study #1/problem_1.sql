-- What is the total amount each customer spent at the restaurant?
 
SELECT 
	customer_id, 
	'$' || CAST(SUM(price) AS VARCHAR(15)) AS total_spent
FROM menu AS m
INNER JOIN sales AS s
ON m.product_id = s.product_id
GROUP BY customer_id
ORDER BY SUM(price) DESC;