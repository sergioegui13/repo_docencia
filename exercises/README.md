# Ejercicios — Día 3

Esqueletos de los ejercicios prácticos del día 3. **dbt no compila esta carpeta**
(no está en `model-paths`): son plantillas que copias a `models/` para resolverlas.

| Carpeta | Bloque | Ejercicio                                   |
|---------|--------|---------------------------------------------|
| `b2/`   | B2     | De Bronze a Silver: pipeline de clientes    |
| `b4/`   | B4     | Convertir Gold en incremental               |
| `b5/`   | B5     | Una batería de tests para `fct_orders`      |

La pipeline de **pedidos** (`stg_orders` → `slv_orders` → `fct_orders`) ya está
hecha en `models/` como referencia. En cada ejercicio replicas o amplías ese patrón.

**Las soluciones están en la rama `solutions`** (`git checkout solutions`), en estas
mismas rutas pero con el código completo y comentado.

Flujo sugerido: `dbt deps` → `dbt seed` → `dbt build` (verifica que la pipeline de
pedidos corre) → resuelve los ejercicios copiando los esqueletos a `models/`.
