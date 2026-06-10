-- Gold: tabla de hechos de pedidos, lista para consumo de BI.
-- En el ejercicio B4 la convertirás en incremental.

{{ config(
    materialized='incremental',
    unique_key='order_id',
    incremental_strategy='merge',
    on_schema_change='append_new_columns'
) }}

select
    order_id,
    customer_id,
    order_date,
    status,
    amount
from {{ ref('slv_orders') }}

{% if is_incremental() %}
    where order_date > (select max(order_date) from {{ this }})
{% endif %}
