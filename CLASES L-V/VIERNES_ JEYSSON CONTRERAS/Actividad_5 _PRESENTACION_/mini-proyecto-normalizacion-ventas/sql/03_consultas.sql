--Total por venta
SELECT
    venta_id,
    SUM((cantidad * precio_unitario) - descuento) AS total_calculado
FROM detalle_venta
GROUP BY venta_id;
--Productos más vendidos
SELECT
    producto_codigo,
    SUM(cantidad) AS unidades_vendidas
FROM detalle_venta
GROUP BY producto_codigo
ORDER BY unidades_vendidas DESC;
--Ventas por vendedor
SELECT
    v.vendedor_nombre,
    COUNT(ve.venta_id) AS cantidad_ventas
FROM vendedor v
JOIN venta ve
ON v.vendedor_id = ve.vendedor_id
GROUP BY v.vendedor_nombre;
--Historial de compras por cliente
SELECT
    c.cliente_nombre,
    ve.venta_id,
    ve.fecha_venta
FROM cliente c
JOIN venta ve
ON c.cliente_doc = ve.cliente_doc;
--Verificar registros huérfanos
SELECT *
FROM detalle_venta d
LEFT JOIN venta v
ON d.venta_id = v.venta_id
WHERE v.venta_id IS NULL;
