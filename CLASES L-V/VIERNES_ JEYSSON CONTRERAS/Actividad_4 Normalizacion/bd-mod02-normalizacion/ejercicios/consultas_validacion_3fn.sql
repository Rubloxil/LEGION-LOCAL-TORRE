SELECT     
    v.id_venta,     
    c.nombre AS cliente,     
    c.correo,     
    ci.nombre AS ciudad,     
    d.nombre AS departamento,     
    ven.nombre AS vendedor,     
    p.nombre AS producto,     
    dv.cantidad,     
    v.fecha_venta 
FROM normalizacion.ventas_3fn v 
JOIN normalizacion.clientes_3fn c     
    ON v.id_cliente = c.id_cliente 
JOIN normalizacion.ciudades ci     
    ON c.id_ciudad = ci.id_ciudad 
JOIN normalizacion.departamentos d     
    ON ci.id_departamento = d.id_departamento 
JOIN normalizacion.vendedores_3fn ven     
    ON v.id_vendedor = ven.id_vendedor 
JOIN normalizacion.detalle_ventas_3fn dv     
    ON v.id_venta = dv.id_venta 
JOIN normalizacion.productos_3fn p     
    ON dv.id_producto = p.id_producto 
ORDER BY v.id_venta;