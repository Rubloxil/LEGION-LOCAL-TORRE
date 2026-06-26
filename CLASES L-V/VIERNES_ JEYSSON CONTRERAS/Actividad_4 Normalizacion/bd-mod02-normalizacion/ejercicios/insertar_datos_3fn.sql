INSERT INTO normalizacion.departamentos (nombre) VALUES 
('Cundinamarca'), 
('Antioquia');  
INSERT INTO normalizacion.ciudades (nombre, id_departamento) VALUES 
('Bogotá', 1), 
('Medellín', 2);  
INSERT INTO normalizacion.clientes_3fn (nombre, correo, id_ciudad) VALUES 
('Ana Torres', 'ana@mail.com', 1), 
('Luis Gómez', 'luis@mail.com', 2);  
INSERT INTO normalizacion.vendedores_3fn (nombre) VALUES 
('Carlos'), 
('Diana');  
INSERT INTO normalizacion.productos_3fn (nombre) VALUES 
('Mouse'), 
('Teclado'), 
('Monitor'), 
('Laptop'), 
('Silla');  
INSERT INTO normalizacion.ventas_3fn (id_cliente, id_vendedor, fecha_venta) VALUES 
(1, 1, '2026-06-01'), 
(2, 1, '2026-06-02'), 
(1, 2, '2026-06-03');  
INSERT INTO normalizacion.detalle_ventas_3fn (id_venta, id_producto, cantidad) VALUES 
(1, 1, 1), 
(1, 2, 1), 
(1, 3, 1), 
(2, 4, 1), 
(2, 1, 1), 
(3, 5, 1); 