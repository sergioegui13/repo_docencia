-- Staging de pedidos: casting y renaming desde la source Bronze.
-- No deduplica todavía; eso es trabajo de la capa Silver.
select
    cast(customer_id  as integer)        as customer_id,
    cast(first_name as varchar)          as first_name,
    cast(last_name as varchar)           as last_name,
    lower(trim(cast(email as varchar)))  as email,
    country_code                         as country_code,
    cast(created_at   as timestamp)      as created_at
from {{ source('raw_ecommerce', 'raw_customers') }}
