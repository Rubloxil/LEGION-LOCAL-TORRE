--Categorias
INSERT INTO categoria(nombre_categoria)
VALUES ('Tecnologia'),
    ('Accesorios'),
    ('Perifericos');
--Clientes
INSERT INTO cliente
VALUES (
        '12345',
        'Juan Perez',
        'juan@gmail.com',
        '3001111111',
        'Bogota'
    ),
    (
        '67890',
        'Maria Lopez',
        'maria@gmail.com',
        '3002222222',
        'Medellin'
    );
--Vendedores
INSERT INTO vendedor(vendedor_nombre, vendedor_zona)
VALUES ('Carlos Ruiz', 'Norte'),
    ('Ana Torres', 'Sur');
--Productos
INSERT INTO producto
VALUES ('P001', 'Laptop Lenovo', 1),
    ('P002', 'Mouse Logitech', 2),
    ('P003', 'Monitor Samsung', 3);
--Ventas
INSERT INTO venta
VALUES (1, '2025-06-01', '12345', 1, 'Tarjeta'),
    (2, '2025-06-02', '67890', 2, 'Efectivo');
--Detalles
INSERT INTO detalle_venta (
        venta_id,
        producto_codigo,
        cantidad,
        precio_unitario,
        descuento
    )
VALUES (1, 'P001', 1, 3500000, 0),
    (1, 'P002', 2, 80000, 5000),
    (2, 'P003', 1, 900000, 0);