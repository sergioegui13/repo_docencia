-- Test singular de ejemplo: ningún importe ngativo o cero.
-- Devuelve filas que NO deberían existir; 0 filas = pasa.
select order_id
from {{ ref('fct_orders') }}
where amount <= 0
