WITH order_items AS (
    SELECT 
        order_id,
        order_item_id,
        product_id,
        seller_id,
        price,
        freight_value
    FROM {{ ref('stg_olist_db__order_items') }}
),
products AS (
    SELECT 
        product_id,
        product_category_name,
        product_weight_g,
        product_length_cm,
        product_height_cm,
        product_width_cm
    FROM {{ ref('stg_olist_db__products') }}
)
SELECT 
    i.order_id,
    i.order_item_id,
    i.product_id,
    i.seller_id,
    i.price,
    i.freight_value,
    p.product_category_name,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm
FROM order_items i
LEFT JOIN products p ON i.product_id = p.product_id



