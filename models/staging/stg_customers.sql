-- Staging de pedidos: casting y renaming desde la source Bronze.
-- No deduplica todavía; eso es trabajo de la capa Silver.
select
    cast(customer_id as integer) as customer_id,
    cast(first_name as varchar(50)) as first_name,
    cast(last_name as varchar(50)) as last_name,
    lower(trim(email)) as email,
    cast(country_code as varchar(2)) as country_code,
    cast(created_at as date) as created_at 
from {{ source('raw_ecommerce', 'raw_customers') }}