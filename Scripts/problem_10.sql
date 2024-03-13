-- In the first week after a customer joins the program (including their join date) 
-- they earn 2x points on all items, not just sushi. How many points do customers A and B have at the end of January?

SELECT
    customer_id,
    SUM(
        CASE
      		WHEN product_name = 'sushi' THEN 2 * 10 * price
    		WHEN order_date BETWEEN join_date AND join_date + 6 THEN 2 * 10 * price
           -- WHEN order_date >= join_date AND order_date <= join_date + 6 THEN 20 * price
        	ELSE 10 * price
        END
    ) AS total_points
FROM (
	SELECT
  		s.customer_id,
        m.product_name,
        m.price,
        s.order_date,
        mem.join_date
    FROM
  		sales s
    INNER JOIN
        members mem ON s.customer_id = mem.customer_id
  	INNER JOIN
  		menu m on s.product_id = m.product_id 
    WHERE 
        s.order_date <= '2021-01-31'
) AS subquery
WHERE
	customer_id IN('A', 'B')
GROUP BY
    customer_id;