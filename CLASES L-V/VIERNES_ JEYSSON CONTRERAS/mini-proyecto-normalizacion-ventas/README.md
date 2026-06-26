# Mini Proyecto - Normalización Sistema de Ventas

## Ejecución

1. Crear base de datos:
```sql
CREATE DATABASE ventas_normalizacion;
```
2. Ejecutar scripts en orden:
- 00_tabla_cruda.sql
- 01_modelo_normalizado.sql
- 02_datos_normalizados.sql
- 03_consultas_validacion.sql

## Explicación para exposición
- 1FN: se eliminan listas separadas por comas.
- 2FN: se separan entidades Cliente, Vendedor, Producto y Venta.
- 3FN: se elimina la dependencia transitiva entre Producto y Categoría.
- El detalle de venta conserva precio histórico y descuento.
