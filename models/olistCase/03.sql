WITH city_category_summary AS (
    SELECT 
        c.customer_city,
        pc.product_category_name,
        COUNT(DISTINCT o.order_id) AS total_orders,
        COUNT(DISTINCT c.customer_unique_id) AS total_customers,
        SUM(oi.price) AS total_turnover
    FROM {{ ref('stg_olist_db__orders') }} o
    JOIN {{ ref('stg_olist_db__order_items') }} oi ON o.order_id = oi.order_id
    JOIN {{ ref('stg_olist_db__products') }} pc ON oi.product_id = pc.product_id
    JOIN {{ ref('stg_olist_db__customers') }} c ON o.customer_id = c.customer_id
    GROUP BY c.customer_city, pc.product_category_name
)
SELECT * FROM city_category_summary
ORDER BY total_turnover DESC
