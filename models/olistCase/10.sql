SELECT 
    MIN(c.won_date) AS first_deal_date,
    MAX(c.won_date) AS last_deal_date,
    DATE_DIFF(MAX(c.won_date), MIN(c.won_date), DAY) AS dataset_timelapse_days
FROM {{ ref('stg_olist_db__leads_closed') }} c

-- The first closed deal was at 2017-12-05T02:00:00 and the last closed deal was at 2018-11-14T18:04:19
-- The timelapse between those two is of 344
