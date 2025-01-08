WITH deal_timelapse AS (
    SELECT 
        DATE_DIFF(lc.won_date, lq.first_contact_date, DAY) AS timelapse_days,
        COUNT(*) AS total_deals
    FROM {{ ref('stg_olist_db__leads_closed') }} lc
    JOIN {{ ref('stg_olist_db__leads_qualified') }} lq ON lc.mql_id = lq.mql_id
    WHERE lq.first_contact_date IS NOT NULL
    GROUP BY timelapse_days
)
SELECT * FROM deal_timelapse
ORDER BY timelapse_days



-- We can observe that most of the deals are made on the first 15 days 