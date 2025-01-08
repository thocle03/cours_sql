SELECT declared_monthly_revenue,
    COUNT(*) AS total_customers
FROM {{ ref('stg_olist_db__leads_closed') }}
GROUP BY declared_monthly_revenue
ORDER BY declared_monthly_revenue DESC

-- there are a lot of declaration to 0 and without that, it is centered around 100000.0
