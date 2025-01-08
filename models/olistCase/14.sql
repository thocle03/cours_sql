SELECT 
    business_segment,
    COUNT(*) AS total_closed_deals
FROM {{ ref('stg_olist_db__leads_closed') }}
GROUP BY business_segment
ORDER BY total_closed_deals DESC
