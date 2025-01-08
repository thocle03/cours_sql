SELECT 
    COUNT(DISTINCT c.mql_id) AS closed_deals,
    COUNT(DISTINCT q.mql_id) AS qualified_leads,
    (COUNT(DISTINCT c.mql_id) * 1.0 / COUNT(DISTINCT q.mql_id)) AS conversion_rate
FROM {{ ref('stg_olist_db__leads_qualified') }} q
LEFT JOIN {{ ref('stg_olist_db__leads_closed') }} c ON q.mql_id = c.mql_id

-- closed_deals 842, qualified_leads 8000, conversion_rate 0.10525