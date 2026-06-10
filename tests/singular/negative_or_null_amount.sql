-- Test singular de ejemplo: detectar importes negativos o cero en orders.
-- Devuelve filas que NO deberían existir; 0 filas = pasa.

select order_id,amount
from {{ ref('fct_orders') }}
where amount <= 0
