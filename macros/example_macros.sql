{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

        {#-- dbt defaults to concatenating the custom schema to the target schema --#}
        {{ default_schema + "_" + custom_schema_name  }}
        --or
        -- {{ custom_schema_name  }}


    {%- endif -%}

{%- endmacro %}

-- in dbt_project, change the intermediate schema name and
--  intermediate:
--       +schema: inter
--       +materialized: table

to 

--  intermediate:
--       +schema: new_inter
--       +materialized: table