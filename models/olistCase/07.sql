SELECT 
    o.order_id,
    DATE_DIFF(o.order_delivered_customer_date, o.order_estimated_delivery_date, DAY) AS estimated_vs_actual_delivery,
    DATE_DIFF(o.order_delivered_customer_date, o.order_purchase_timestamp, DAY) AS purchase_to_delivery
FROM {{ ref('stg_olist_db__orders') }} o
WHERE o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL
