-- Which item was the most popular for each customer?

SELECT 
    customer_id, 
    product_name
FROM (
    SELECT
        customer_id,
        product_name,
        COUNT(product_name) AS product_count,
        RANK() OVER (PARTITION BY customer_id ORDER BY COUNT(product_name) DESC) AS food_rank
    FROM 
        menu AS m
    INNER JOIN 
    	sales AS s ON m.product_id = s.product_id
    GROUP BY 
        customer_id, product_name
) AS food_rankings
WHERE 
    food_rank = 1;
