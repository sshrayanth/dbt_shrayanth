{{ config(materialized='incremental') }}

WITH supplier AS (

    SELECT *
    FROM {{ ref('stg_suppliers') }}

    {% if is_incremental() %}

    WHERE updated_time > (
        SELECT MAX(updated_time)
        FROM {{ this }}
    )

    {% endif %}

)

SELECT *
FROM supplier