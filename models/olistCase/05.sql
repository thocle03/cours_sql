WITH basket_summary AS (
    SELECT 
        o.order_id,
        SUM(oi.price) AS total_basket_price
    FROM {{ ref('stg_olist_db__orders') }} o
    JOIN {{ ref('stg_olist_db__order_items') }} oi ON o.order_id = oi.order_id
    GROUP BY o.order_id
)
SELECT 
    AVG(total_basket_price) AS average_basket_size
FROM basket_summary
