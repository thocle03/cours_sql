WITH order_summary AS (
    SELECT * FROM {{ ref('int_order_summary') }}
)
SELECT 
    DATE(order_purchase_timestamp) AS sale_date,
    COUNT(order_id) AS total_orders,
    SUM(total_price) AS total_revenue,
    SUM(total_freight) AS total_freight
FROM order_summary
GROUP BY DATE(order_purchase_timestamp)
