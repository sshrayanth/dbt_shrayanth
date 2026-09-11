-- {{ config(materialized='incremental', unique_key='supplier_id') }}

-- WITH supplier AS (

--     SELECT supplier_id,n.sname supplier_name, * exclude ( supplier_id, supplier_name)
--    FROM {{ ref('stg_suppliers') }} s
--     join supplier_names n on s.supplier_id = n.skey

--     {% if is_incremental() %}

--     WHERE updated_time > (
--         SELECT MAX(updated_time)
--         FROM {{ this }}
--     )

--     {% endif %}

-- )

-- SELECT *
-- FROM supplier

--------------------------------------------------------------------------------------------

-- {{ config(materialized='incremental', unique_key='supplier_id') }}

-- with supplier as (

--     select supplier_id, n.sname supplier_name, s.* exclude (supplier_id, supplier_name) 
--     from {{ ref('stg_suppliers') }} s
--     join supplier_name n on s.supplier_id = n.skey

--     {% if is_incremental() %}
--     where updated_time > (select max(updated_time) from {{ this }})
--     {% endif %} )

-- select * from supplier

 --------------------------------------------------------------------------------

 --------3

 {{ config(
    materialized='incremental',
    unique_key='supplier_id',
    incremental_strategy='merge'
) }}

with supplier as (

    select *
    from {{ ref('stg_suppliers') }}

    {% if is_incremental() %}

    where updated_time > (
        select max(updated_time)
        from {{ this }}
    )

    {% endif %}

)

select *
from supplier