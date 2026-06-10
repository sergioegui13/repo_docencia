# B4 — Convertir Gold en incremental

Convierte `fct_orders` (hoy materializado como `table`) en un modelo
**incremental**.

- Estrategia `merge` sobre `order_id` (`unique_key`).
- `on_schema_change='append_new_columns'`.
- El filtro de `is_incremental()` solo debe traer pedidos posteriores al
  último `order_date` ya cargado.

Reemplaza `models/gold/fct_orders.sql` por la versión incremental (o copia este
esqueleto encima) y completa los `TODO`. Prueba la primera carga y una recarga:
`dbt build --select fct_orders` (dos veces) y `... --full-refresh`.

Error típico: olvidar el guard `{% if is_incremental() %}`. Sin él, el filtro
se aplica en la primera carga (cuando `{{ this }}` aún no existe) y falla.
