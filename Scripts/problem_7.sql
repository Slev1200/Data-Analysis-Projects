-- Which item was purchased just before the customer became a member?

SELECT 
	DISTINCT s.customer_id,
	FIRST_VALUE(product_name) OVER (PARTITION BY s.customer_id ORDER BY order_date DESC) AS last_purchase_before_member
FROM 
	menu AS m
INNER JOIN 
	sales AS s ON m.product_id = s.product_id
INNER JOIN 
	members AS mem ON mem.customer_id = s.customer_id
WHERE 
	order_date < join_date
ORDER BY 
	s.customer_id;