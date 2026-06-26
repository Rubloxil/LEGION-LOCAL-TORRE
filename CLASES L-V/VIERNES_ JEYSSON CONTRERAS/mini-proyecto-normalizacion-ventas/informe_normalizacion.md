# Informe de Normalización

## Diagnóstico
Problemas:
- Atributos no atómicos: productos_codigos, cantidades, precios_unitarios.
- Redundancia de clientes, vendedores y categorías.
- total_venta es calculable.

## Anomalías
### Inserción
No puede agregarse un producto sin crear una venta.

### Actualización
Cambiar email de cliente requiere modificar múltiples filas.

### Eliminación
Eliminar una venta puede eliminar información única de un cliente.

## Dependencias funcionales

cliente_doc -> datos cliente
vendedor_id -> datos vendedor
producto_codigo -> nombre producto, categoria
venta_id -> fecha, cliente, vendedor, pago
venta_id + producto_codigo -> cantidad, precio, descuento

## 1FN
Una fila = un producto por venta.

## 2FN
Se crean:
- clientes
- vendedores
- ventas
- productos
- detalle_venta

## 3FN
Se crea categorias como entidad independiente.
