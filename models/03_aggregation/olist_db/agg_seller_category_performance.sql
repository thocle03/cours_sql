WITH seller_product_performance AS (
    SELECT * FROM {{ ref('int_seller_product_performance') }}
)
SELECT 
    seller_id,
    product_category_name,
    SUM(total_items_sold) AS total_items_sold,
    SUM(total_sales) AS total_sales,
    AVG(avg_price) AS avg_price
FROM seller_product_performance
GROUP BY seller_id, product_category_name
