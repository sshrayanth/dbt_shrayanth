WITH regions AS (

    SELECT
        R_REGIONKEY AS region_id,
        R_NAME AS region_name,
        R_COMMENT AS comment
    FROM {{ source('src','regions') }}

)

SELECT * FROM regions