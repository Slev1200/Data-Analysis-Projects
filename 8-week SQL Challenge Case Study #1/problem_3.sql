-- What was the first item from the menu purchased by each customer?
 
SELECT customer_id, product_name FROM (
	SELECT
	  customer_id,
	  product_name,
	  order_date,
	  ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS purchase_rank
	FROM menu AS m
	INNER JOIN sales AS s
	ON m.product_id = s.product_id
	GROUP BY customer_id, product_name, order_date
) AS ranked_products
WHERE purchase_rank = 1;