
-- TOTAL VENTA --
SELECT
    v.venta_id,
    v.fecha_venta,
    c.cliente_nombre,
    SUM((dv.cantidad * dv.precio_unitario) - dv.descuento) AS total_venta
FROM modulo2_normalizacion.ventas v
INNER JOIN modulo2_normalizacion.clientes c
    ON v.cliente_doc = c.cliente_doc
INNER JOIN modulo2_normalizacion.detalle_ventas dv
    ON v.venta_id = dv.venta_id
GROUP BY
    v.venta_id,
    v.fecha_venta,
    c.cliente_nombre
ORDER BY v.venta_id;

-- Productos más vendidos por cantidad --

SELECT
    p.producto_codigo,
    p.producto_nombre,
    SUM(dv.cantidad) AS total_vendido
FROM modulo2_normalizacion.productos p
INNER JOIN modulo2_normalizacion.detalle_ventas dv
    ON p.producto_codigo = dv.producto_codigo
GROUP BY
    p.producto_codigo,
    p.producto_nombre
ORDER BY total_vendido DESC;

-- Ventas por vendedor--

SELECT
    vd.vendedor_id,
    vd.vendedor_nombre,
    COUNT(v.venta_id) AS numero_ventas
FROM modulo2_normalizacion.vendedores vd
INNER JOIN modulo2_normalizacion.ventas v
    ON vd.vendedor_id = v.vendedor_id
GROUP BY
    vd.vendedor_id,
    vd.vendedor_nombre
ORDER BY numero_ventas DESC;

-- ventas totales por vendedor --

SELECT
    vd.vendedor_nombre,
    SUM((dv.cantidad * dv.precio_unitario) - dv.descuento) AS total_vendido
FROM modulo2_normalizacion.vendedores vd
INNER JOIN modulo2_normalizacion.ventas v
    ON vd.vendedor_id = v.vendedor_id
INNER JOIN modulo2_normalizacion.detalle_ventas dv
    ON v.venta_id = dv.venta_id
GROUP BY vd.vendedor_nombre
ORDER BY total_vendido DESC;

-- Historial de compras por cliente --

SELECT
    c.cliente_doc,
    c.cliente_nombre,
    v.venta_id,
    v.fecha_venta,
    SUM((dv.cantidad * dv.precio_unitario) - dv.descuento) AS total_compra
FROM modulo2_normalizacion.clientes c
INNER JOIN modulo2_normalizacion.ventas v
    ON c.cliente_doc = v.cliente_doc
INNER JOIN modulo2_normalizacion.detalle_ventas dv
    ON v.venta_id = dv.venta_id
GROUP BY
    c.cliente_doc,
    c.cliente_nombre,
    v.venta_id,
    v.fecha_venta
ORDER BY
    c.cliente_nombre,
    v.fecha_venta;

-- Verificar registros huérfanos en detalle_ventas --

SELECT dv.*
FROM modulo2_normalizacion.detalle_ventas dv
LEFT JOIN modulo2_normalizacion.productos p
    ON dv.producto_codigo = p.producto_codigo
WHERE p.producto_codigo IS NULL;

-- Ventas inexistentes--

SELECT dv.*
FROM modulo2_normalizacion.detalle_ventas dv
LEFT JOIN modulo2_normalizacion.ventas v
    ON dv.venta_id = v.venta_id
WHERE v.venta_id IS NULL;

-- producto por categoria --
SELECT
    p.producto_codigo,
    p.producto_nombre,
    c.id_categoria,
    c.categoria_nombre
FROM modulo2_normalizacion.productos p
INNER JOIN modulo2_normalizacion.categorias c
    ON p.id_categoria = c.id_categoria;

-- Todos los clientes --
SELECT *
FROM modulo2_normalizacion.clientes;

-- producto mas vendido por categoria --


