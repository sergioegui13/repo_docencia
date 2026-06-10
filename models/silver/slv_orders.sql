-- Silver de pedidos: deduplicación. Nos quedamos con el registro más reciente
-- por order_id (patrón row_number() = 1, la deduplicación canónica de Silver).
with deduplicado as (
    select
        *,
        row_number() over (
            partition by order_id
            order by order_date desc
        ) as rn
    from {{ ref('stg_orders') }}
)
select
    order_id,
    customer_id,
    order_date,
    status,
    amount
from deduplicado
where rn = 1
