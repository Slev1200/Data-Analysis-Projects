-- What is the most purchased item on the menu and how many times was it purchased by all customers?

SELECT 
	product_name, 
	COUNT(product_name)
FROM menu AS m
INNER JOIN sales AS s
ON m.product_id = s.product_id
GROUP BY product_name
ORDER BY COUNT(product_name) DESC
LIMIT 1;