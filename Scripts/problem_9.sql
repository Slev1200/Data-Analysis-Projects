SELECT
    s.customer_id,
    SUM(
        CASE
            WHEN m.product_name = 'sushi' THEN 2 * m.price
            ELSE m.price
        END
    ) * 10 AS total_points
FROM
    sales s
INNER JOIN
    menu m ON s.product_id = m.product_id
GROUP BY
    s.customer_id
ORDER BY
	s.customer_id;