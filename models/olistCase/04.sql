WITH seller_city_summary AS (
    SELECT 
        s.seller_city,
        SUM(oi.price) AS total_turnover,
        SUM(oi.order_item_id) AS total_quantity
    FROM {{ ref('stg_olist_db__order_items') }} oi
    JOIN {{ ref('stg_olist_db__sellers') }} s ON oi.seller_id = s.seller_id
    GROUP BY s.seller_city
)
SELECT * FROM seller_city_summary
ORDER BY total_turnover DESC
