with deduplicado as (
    select
        *,
        row_number() over (
            partition by customer_id
            order by created_at desc
        ) as rn
    from {{ ref('stg_customers') }}
)
select
    customer_id,
    first_name,
    last_name,
    email,
    country_code,
    created_at
from deduplicado
where rn = 1