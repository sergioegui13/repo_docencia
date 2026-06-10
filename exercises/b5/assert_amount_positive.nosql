-- TODO (B5): test singular. Devuelve los pedidos con importe <= 0
-- (filas que NO deberían existir; 0 filas = pasa).
select order_id, amount
from {{ ref('fct_orders') }}
-- TODO: where ...
