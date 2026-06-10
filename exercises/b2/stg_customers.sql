-- TODO (B2): staging de clientes desde la source Bronze.
-- - castea customer_id a integer y created_at a date
-- - normaliza el email a minúsculas con lower(trim(...))
-- - conserva first_name, last_name, country_code

select
    -- TODO: completa el SELECT
    cast(customer_id as integer) as customer_id
    -- , ...
from {{ source('raw_ecommerce', 'raw_customers') }}
