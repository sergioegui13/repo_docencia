-- TODO (B2): Silver de clientes (deduplicado por customer_id).
-- Quédate con el registro más reciente según created_at.

with deduplicado as (
    select
        *,
        -- TODO: row_number() particionado por customer_id, ordenado por created_at desc
        1 as rn
    from {{ ref('stg_customers') }}
)
select
    -- TODO: selecciona las columnas finales
    customer_id
from deduplicado
where rn = 1
