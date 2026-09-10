
WITH nations AS (

    SELECT
        n_nationkey AS nation_id,
        n_name AS name,
        n_regionkey AS region_id,
        n_comment AS comment
    FROM {{ source('src', 'nations') }}

)

SELECT *
FROM nations

