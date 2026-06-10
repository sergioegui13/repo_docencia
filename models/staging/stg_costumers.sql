-- Staging de pedidos: casting y renaming desde la source Bronze.
-- No deduplica todavía; eso es trabajo de la capa Silver.
select
    cast(customer_id    as integer)   as customer_id,
    first_name,
    last_name,
    lower(trim(email)) as email,
    country_code,
    cast(created_at  as date)         as created_at
from {{ source('raw_ecommerce', 'raw_customers') }}