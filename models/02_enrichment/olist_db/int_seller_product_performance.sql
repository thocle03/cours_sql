WITH seller_performance AS (
    SELECT * FROM {{ ref('int_seller_performance') }}
),
order_items_enriched AS (
    SELECT * FROM {{ ref('int_order_items_enriched') }}
)
SELECT 
    oi.seller_id,
    oi.product_category_name,
    COUNT(oi.order_item_id) AS total_items_sold,
    SUM(oi.price) AS total_sales,
    AVG(oi.price) AS avg_price
FROM order_items_enriched oi
JOIN seller_performance sp ON oi.seller_id = sp.seller_id
GROUP BY oi.seller_id, oi.product_category_name
