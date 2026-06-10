-- Gold: tabla de hechos de pedidos, lista para consumo de BI.
-- En el ejercicio B4 la convertirás en incremental.
select
    order_id,
    customer_id,
    order_date,
    status,
    amount
from {{ ref('slv_orders') }}
