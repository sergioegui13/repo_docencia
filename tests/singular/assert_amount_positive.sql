-- Test singular de ejemplo: ningún pedido debería tener fecha futura.
-- Devuelve filas que NO deberían existir; 0 filas = pasa.
select order_id, order_date
from {{ ref('fct_orders') }}
where order_date > current_date