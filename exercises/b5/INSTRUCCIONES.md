# B5 — Una batería de tests para fct_orders

Añade tres tipos de prueba:

1. **Genérico** (en YAML): `order_id` único y no nulo.
2. **Singular** (SQL): detectar importes negativos o cero.
3. **Unit test** (YAML): un pedido duplicado en staging se colapsa en una sola
   fila en `slv_orders` (prueba la lógica donde vive: sobre `slv_orders`,
   no sobre `fct_orders`).

Copia `_fct_orders__tests.yml` a `models/gold/`, `assert_amount_positive.sql`
a `tests/singular/`, y añade el bloque `unit_tests` a `models/silver/`.
Ejecuta con `dbt test` (y `dbt test --select test_type:unit`).
