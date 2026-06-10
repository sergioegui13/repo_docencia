-- TODO (B4): convierte este modelo en incremental.
{{ config(
    materialized='table'   -- TODO: 'incremental'
    -- TODO: unique_key, incremental_strategy='merge', on_schema_change='append_new_columns'
) }}

select
    order_id,
    customer_id,
    order_date,
    status,
    amount
from {{ ref('slv_orders') }}

-- TODO: añade el guard incremental
-- {% if is_incremental() %}
--   where order_date > (select max(order_date) from {{ this }})
-- {% endif %}
