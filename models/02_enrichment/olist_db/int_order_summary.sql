WITH orders AS (
    SELECT * FROM {{ ref('stg_olist_db__orders') }}
),
order_items_enriched AS (
    SELECT * FROM {{ ref('int_order_items_enriched') }}
)
SELECT 
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    COUNT(oi.order_item_id) AS total_items,
    SUM(oi.price) AS total_price,
    SUM(oi.freight_value) AS total_freight
FROM orders o
LEFT JOIN order_items_enriched oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.customer_id, o.order_status, o.order_purchase_timestamp
