# Mini Proyecto Normalización Ventas

Normalización de la tabla `ventas_crudas` (Ventas Express S.A.S.) hasta 3FN, con modelo entidad-relación, scripts SQL para PostgreSQL y consultas de validación.

## Contenido de esta carpeta

```
mini-proyecto-normalizacion-ventas/
├── sql/
│   ├── 00_tabla_cruda.sql
│   ├── 01_modelo_normalizado.sql
│   ├── 02_datos_normalizados.sql
│   └── 03_consultas_validacion.sql
├── diagrama_er.png
├── informe_normalizacion.pdf
└── README.md
```

## Cómo ejecutar los scripts

Con el contenedor de PostgreSQL levantado (ver `entorno-postgres/`), conéctate a la base `curso_bd` y ejecuta los scripts **en este orden**:

```bash
psql -h localhost -U curso_user -d curso_bd -f sql/00_tabla_cruda.sql
psql -h localhost -U curso_user -d curso_bd -f sql/01_modelo_normalizado.sql
psql -h localhost -U curso_user -d curso_bd -f sql/02_datos_normalizados.sql
psql -h localhost -U curso_user -d curso_bd -f sql/03_consultas_validacion.sql
```

O desde pgAdmin (`http://localhost:8080`): crea/abre la conexión a `curso_bd` y ejecuta cada archivo en el Query Tool, en el mismo orden.

1. **00_tabla_cruda.sql** — crea `ventas_crudas` con los 4 registros de ejemplo, tal como llegan desde la hoja de cálculo original. Solo sirve para el diagnóstico, no es el modelo final.
2. **01_modelo_normalizado.sql** — crea el esquema `normalizacion_ventas` con las 9 tablas en 3FN: las 6 entidades principales (`clientes`, `vendedores`, `categorias`, `productos`, `ventas`, `detalle_venta`) más los 3 catálogos opcionales que la guía permite agregar (`ciudades`, `zonas`, `metodos_pago`), todas con sus llaves primarias, foráneas y restricciones `CHECK`.
3. **02_datos_normalizados.sql** — inserta los mismos datos de `ventas_crudas`, ya distribuidos sin duplicar clientes, vendedores, productos ni categorías.
4. **03_consultas_validacion.sql** — ejecuta las 5 consultas exigidas (total por venta, productos más vendidos, ventas por vendedor, historial por cliente, registros huérfanos).

## Decisiones principales de diseño

- **`total_venta` no se almacena** como columna en `ventas`. Se calcula siempre con `SUM(cantidad*precio_unitario - descuento)` desde `detalle_venta`, para que no exista riesgo de inconsistencia entre el total guardado y el detalle real (regla de negocio 9 y restricción técnica del documento).
- **`precio_unitario` se guarda en `detalle_venta`**, no se referencia desde `productos`, porque el precio de catálogo puede cambiar con el tiempo y la venta debe conservar el precio histórico (regla de negocio 6).
- **`descuento` vive en el detalle**, no en `productos`, porque se aplica por línea de venta, no de forma global al producto (regla de negocio 7).
- **`categorias` se separó de `productos`** al aplicar 3FN: la categoría depende del producto, no de la venta (dependencia transitiva venta → producto → categoría).
- **`ciudades`, `zonas` y `metodos_pago` se separaron como catálogos**, tal como la guía lo permite explícitamente: *"Separa ciudades o zonas solo si justificas que se administrarán como catálogos"* (Paso 4) y *"Puedes agregar metodos_pago o ciudades si tu justificación lo requiere"* (Paso 5). Se separaron porque son listas cerradas y reutilizadas por el negocio (ciudades de operación, zonas comerciales, métodos de pago aceptados), no porque la guía lo exija.
- **`entidad_pago` NO se separó en catálogo** (a diferencia de `metodo_pago`): la guía no lo menciona como catálogo opcional, y depende del método elegido en cada venta concreta, no es un dato administrado de forma centralizada en este alcance. Se deja como columna de texto en `ventas`.
- **Las llaves foráneas en `detalle_venta`** (`venta_id`, `producto_codigo`) son `NOT NULL` y están protegidas con `REFERENCES`, de modo que es imposible insertar un detalle con venta o producto inexistente (regla de negocio 10).
- **`cantidad > 0` y `precio_unitario >= 0`** se garantizan con `CHECK`, no solo por convención de la aplicación.

## Verificación rápida

Después de ejecutar los 4 scripts, los totales por venta deben coincidir exactamente con los de `ventas_crudas`:

| venta_id | total esperado |
|---|---|
| V1001 | 270.000 |
| V1002 | 745.000 |
| V1003 | 2.855.000 |
| V1004 | 1.580.000 |

Y las dos consultas de huérfanos del script 03 deben devolver **cero filas**.

Más detalle del diagnóstico, las dependencias funcionales y la justificación de cada forma normal está en `informe_normalizacion.pdf`. El modelo visual está en `diagrama_er.png`.
