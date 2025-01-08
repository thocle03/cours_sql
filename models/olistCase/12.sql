SELECT 
    sdr_id AS sales_representative,
    COUNT(*) AS total_closed_deals
FROM {{ ref('stg_olist_db__leads_closed') }}
GROUP BY sdr_id
ORDER BY total_closed_deals DESC

-- It's 4b339f9567d060bcea4f5136b9f5949e who are the Sales Representative Development who closed the more deals
