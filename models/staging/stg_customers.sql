-- Staging de pedidos: casting y renaming desde la source Bronze.
-- No deduplica todavía; eso es trabajo de la capa Silver.
select
    cast(customer_id as integer) as customer_id,
    INITCAP(trim(first_name)) as first_name,
    INITCAP(trim(last_name)) as last_name,
    lower(trim(email)) as email,
    upper(trim(country_code)) as country_code,
    cast(trim(created_at) as timestamp) as created_at
from {{ source("raw_ecommerce", "raw_customers") }}
