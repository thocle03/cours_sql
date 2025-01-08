SELECT 
    COUNT(*) AS saturday_deals
FROM {{ ref('stg_olist_db__leads_closed') }}
WHERE EXTRACT(DAYOFWEEK FROM won_date) = 7

-- 3 deals were closed on a Saturday