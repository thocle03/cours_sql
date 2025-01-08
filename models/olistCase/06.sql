WITH basket_reviews AS (
    SELECT 
        o.order_id,
        SUM(oi.price) AS total_basket_price,
        AVG(r.review_score) AS review_score
    FROM {{ ref('stg_olist_db__orders') }} o
    JOIN {{ ref('stg_olist_db__order_items') }} oi ON o.order_id = oi.order_id
    JOIN {{ ref('stg_olist_db__order_reviews') }} r ON o.order_id = r.order_id
    GROUP BY o.order_id
)
SELECT 
    AVG(total_basket_price / review_score) AS average_basket_per_review
FROM basket_reviews
