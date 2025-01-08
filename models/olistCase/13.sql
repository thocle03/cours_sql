SELECT 
    COUNT(*) AS cat_leads_signed
FROM {{ ref('stg_olist_db__leads_closed') }}
WHERE lead_behaviour_profile = 'cat'
  AND EXTRACT(MONTH FROM won_date) = 4


-- There have 138 cat lead behaviour leads were signed on April