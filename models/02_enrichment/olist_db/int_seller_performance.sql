WITH orders AS (
    SELECT * FROM {{ ref('stg_olist_db__orders') }}
),
order_items AS (
    SELECT * FROM {{ ref('stg_olist_db__order_items') }}
)
SELECT 
    oi.seller_id,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(oi.price) AS total_sales,
    SUM(oi.freight_value) AS total_freight
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
GROUP BY oi.seller_id