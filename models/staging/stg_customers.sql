
WITH customers AS (

    SELECT
        c_custkey AS customer_id,
        c_nationkey AS nation_id,
        c_name AS name,
        c_address AS address,
        c_phone AS phone_number,
        c_acctbal AS account_balance,
        c_mktsegment AS market_segment,
        c_comment AS comment
    FROM {{ source('src', 'customers') }}

)

SELECT *
FROM customers;

