select
    cast(customer_id    as integer)     as customer_id,
    cast(first_name  as varchar)        as first_name,
    cast(last_name  as varchar)         as last_name,
    cast(lower(trim(email)) as varchar) as email,
    cast(country_code  as varchar)      as country_code,
    cast(created_at  as timestamp)      as created_at
from {{ source('raw_ecommerce', 'raw_customers') }}