-- Group by date and calculate avg orders
SELECT 
    ROUND(AVG(sum), 0) as avg_orders_per_day
FROM
    (SELECT 
        orders.order_date, SUM(order_details.quantity) AS sum
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) AS order_quantity;