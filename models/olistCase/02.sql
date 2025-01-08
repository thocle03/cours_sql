SELECT 
    COUNT(DISTINCT customer_id) AS total_customer_ids,
    COUNT(DISTINCT customer_unique_id) AS total_unique_customers,
    (COUNT(DISTINCT customer_id) - COUNT(DISTINCT customer_unique_id)) AS difference
FROM {{ ref('stg_olist_db__customers') }}

-- customer_id est un identifiant unique pour chaque commande
-- customer_unique_id identifie chaque client unique dans la base de données