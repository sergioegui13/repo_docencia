-- Test singular de ejemplo: ningún pedido debería tener fecha futura.
-- Devuelve filas que NO deberían existir; 0 filas = pasa.
select order_id, amount
from {{ ref('fct_orders') }}
where amount <= 0
