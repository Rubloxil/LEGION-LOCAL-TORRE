
SET search_path TO normalizacion_ventas;

-- Total por venta
SELECT venta_id,
SUM(cantidad*precio_unitario-descuento) total_calculado
FROM detalle_venta
GROUP BY venta_id;

-- Productos mas vendidos
SELECT p.producto_codigo,p.nombre,
SUM(d.cantidad) unidades_vendidas
FROM productos p
JOIN detalle_venta d ON p.producto_codigo=d.producto_codigo
GROUP BY p.producto_codigo,p.nombre
ORDER BY unidades_vendidas DESC;

-- Ventas por vendedor
SELECT v.vendedor_id,v.nombre,
COUNT(ve.venta_id) cantidad_ventas,
SUM(d.cantidad*d.precio_unitario-d.descuento) valor_total
FROM vendedores v
JOIN ventas ve ON v.vendedor_id=ve.vendedor_id
JOIN detalle_venta d ON ve.venta_id=d.venta_id
GROUP BY v.vendedor_id,v.nombre;

-- Historial cliente
SELECT c.cliente_doc,c.nombre,ve.venta_id,ve.fecha_venta,
p.nombre,d.cantidad
FROM clientes c
JOIN ventas ve ON c.cliente_doc=ve.cliente_doc
JOIN detalle_venta d ON ve.venta_id=d.venta_id
JOIN productos p ON d.producto_codigo=p.producto_codigo
WHERE c.cliente_doc='CC101';

-- Huérfanos
SELECT *
FROM detalle_venta d
LEFT JOIN ventas v ON d.venta_id=v.venta_id
LEFT JOIN productos p ON d.producto_codigo=p.producto_codigo
WHERE v.venta_id IS NULL OR p.producto_codigo IS NULL;
