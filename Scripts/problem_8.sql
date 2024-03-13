-- What is the total items and amount spent for each member before they became a member?

SELECT
	s.customer_id,
	COUNT(product_name),
	'$' || CAST(SUM(price) AS VARCHAR(15)) AS total_spent
FROM
	menu AS m
INNER JOIN 
	sales AS s ON m.product_id = s.product_id
INNER JOIN 
	members AS mem ON mem.customer_id = s.customer_id
WHERE
	order_date < join_date
GROUP BY
	s.customer_id
ORDER BY
	s.customer_id;