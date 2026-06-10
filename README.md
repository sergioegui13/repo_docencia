# repo_docencia — Semana de Inmersión en el Modern Data Stack

Repositorio de **docencia** para los días 3–5 de la inmersión (dbt Platform +
Snowflake sobre el motor Fusion). Caso de uso: **e-commerce ficticio** con
pedidos y clientes.

Trae la pipeline de **pedidos ya hecha y comentada** como referencia, y los
**esqueletos de los ejercicios** del día 3. Las **soluciones** están en la rama
`solutions`.

> Para el proyecto final se entrega un repo aparte (`repo_proyecto`). Para
> formaciones más centradas en dbt se usa `repo_demo`.

## Convención (la de las slides, guías y anexos)

- **Medallion**: Bronze (`source()`) → Staging (`stg_`) → Silver (`slv_`) → Gold (`fct_`/`dim_`).
- **Bases de datos por entorno y capa** vía variables de entorno
  `DBT_BRONZE_DB` / `DBT_SILVER_DB` / `DBT_GOLD_DB` (con *default* a la database
  del target, para que el repo corra sin configurarlas).
- **Entornos**: `dbt_desa` / `dev` / `pre` / `pro` (`target.name`).
- dbt ejecuta con `TRANSFORM_ROLE` (ver `profiles.yml.example`).

## Estructura

```
models/
  sources/   _raw_ecommerce__sources.yml   ← declara Bronze + freshness
  staging/   stg_orders.sql                 ← curación (casting/renaming)
  silver/    slv_orders.sql                 ← deduplicación
  gold/      fct_orders.sql                 ← hechos para consumo (tabla)
snapshots/   snap_customers.yml             ← SCD2 de ejemplo
seeds/       raw_orders.csv, raw_customers.csv   ← Bronze "cargada" (para correr en clase)
macros/      generate_schema_name.sql (override Cívica), cents_to_dollars.sql
tests/       singular/assert_order_date_not_future.sql
exercises/   b2/ b4/ b5/   ← esqueletos (NO compilados); soluciones en rama solutions
```

## Cómo ejecutar

```bash
dbt deps          # descarga dbt_utils
dbt seed          # carga la "Bronze" desde los CSV
dbt build         # construye y testea la pipeline de pedidos
dbt source freshness
```

En clase, los seeds hacen de capa Bronze para que el proyecto corra de inmediato.
En un entorno real, Bronze la pobla la ingesta y dbt solo la declara como `source()`.

## Ejercicios (día 3)

| Carpeta | Bloque | Ejercicio                                |
|---------|--------|------------------------------------------|
| `b2/`   | B2     | De Bronze a Silver: pipeline de clientes |
| `b4/`   | B4     | Convertir Gold en incremental            |
| `b5/`   | B5     | Batería de tests para `fct_orders`       |

Cada carpeta lleva un `INSTRUCCIONES.md`. Resuélvelos copiando los esqueletos a
`models/`. Para ver las soluciones: `git checkout solutions`.

## Mapa material → repo

- **Día 3** (sources, staging→silver, materializaciones, incremental, snapshots, testing):
  toda la pipeline de `models/`, `snapshots/` y los ejercicios `b2`/`b4`/`b5`.
- **Días 4–5** (calidad, entornos, variables, jobs, CI, seguridad, gobernanza):
  se trabajan sobre todo en la interfaz de la plataforma; este repo aporta la
  base de código y el `dbt_project.yml` parametrizado por entorno.
