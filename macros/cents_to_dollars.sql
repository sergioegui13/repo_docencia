-- Macro de utilidad de ejemplo: convierte céntimos a la unidad principal.
{% macro cents_to_dollars(column_name, scale=2) -%}
    round( {{ column_name }} / 100.0, {{ scale }} )
{%- endmacro %}
