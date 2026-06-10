-- Override del naming de schema (convención Cívica):
--   - en desarrollo personal (dbt_desa): cada quien escribe en su schema dbt_<user>
--   - en despliegue (dev/pre/pro): se usa el schema de la capa, sin prefijo
{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- if target.name == 'dbt_desa' -%}
        {{ target.schema }}
    {%- elif custom_schema_name is none -%}
        {{ target.schema }}
    {%- else -%}
        {{ custom_schema_name | trim }}
    {%- endif -%}
{%- endmacro %}
