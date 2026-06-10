# B2 — De Bronze a Silver: clientes

Replica el patrón de la pipeline de pedidos, ahora para **clientes**.

1. `stg_customers`: desde la source `raw_ecommerce.raw_customers`, castea los
   tipos y **normaliza el email a minúsculas** (`lower(trim(email))`).
2. `slv_customers`: **deduplica** por `customer_id` quedándote con el registro
   más reciente (usa `created_at`).

Copia estos archivos a `models/staging/` y `models/silver/` respectivamente,
y completa los `TODO`. Verifica con `dbt build --select +slv_customers`.

Pista: el patrón de deduplicación es el mismo de `slv_orders`
(`row_number() over (partition by ... order by ... desc) = 1`).
