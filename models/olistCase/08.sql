WITH marketing AS (
    SELECT 
        q.mql_id,
        q.first_contact_date,
        q.landing_page_id,
        q.origin,
        c.lead_type
    FROM {{ ref('stg_olist_db__leads_qualified') }} q
    LEFT JOIN {{ ref('stg_olist_db__leads_closed') }} c ON q.mql_id = c.mql_id
)
SELECT * FROM marketing
