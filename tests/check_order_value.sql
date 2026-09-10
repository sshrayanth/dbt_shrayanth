{{ config(store_failures=true) }}

SELECT *
FROM {{ ref('stg_orders') }}
WHERE total_price <= 880
