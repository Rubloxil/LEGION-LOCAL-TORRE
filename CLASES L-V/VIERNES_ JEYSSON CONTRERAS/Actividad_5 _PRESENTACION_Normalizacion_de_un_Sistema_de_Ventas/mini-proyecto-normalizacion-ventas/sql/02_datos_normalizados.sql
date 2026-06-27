INSERT INTO modulo2_normalizacion.departamentos (id_departamento, nombre) VALUES
('DEP01','Cundinamarca'),
('DEP02','Antioquia');
INSERT INTO modulo2_normalizacion.ciudades (id_ciudad, nombre, id_departamento) VALUES
('CIU01','Bogota','DEP01'),
('CIU02','Medellin','DEP02');
INSERT INTO modulo2_normalizacion.clientes (cliente_doc, cliente_nombre,cliente_email, cliente_telefono, cliente_direccion, id_ciudad ) VALUES
('CC101','Maria Gomez','maria.gomez@mail.com','3101112233','Calle 10 # 5-20','CIU01'),
('CC102','Juan Perez','juan.perez@mail.com','3155558899','Carrera 8 # 20-15','CIU01'),
('CC103','Laura Rojas','laura.rojas@mail.com','3209994455','Av. 68 # 45-30','CIU02');
INSERT INTO modulo2_normalizacion.zonas (id_zona, zona_nombre) VALUES
('Z01','Norte'),
('Z02','Centro'),
('Z03','Occidente');
INSERT INTO modulo2_normalizacion.vendedores (vendedor_id, vendedor_nombre, id_zona) VALUES
('VEN01','Ana Torres','Z01'),
('VEN02','Carlos Ruiz','Z02'),
('VEN03','Diana Mora','Z03');
INSERT INTO modulo2_normalizacion.categorias (id_categoria, categoria_nombre) VALUES
('CAT01','Perifericos'),
('CAT02','Pantallas'),
('CAT03','Computadores'),
('CAT04','Accesorios');
INSERT INTO modulo2_normalizacion.productos (producto_codigo, producto_nombre, id_categoria) VALUES
('P001','Mouse USB','CAT01'),
('P002','Teclado mecanico','CAT01'),
('P003','Monitor 24','CAT02'),
('P004','Portatil 14','CAT03'),
('P005','Base refrigerante','CAT04'),
('P006','Webcam HD','CAT01');
INSERT INTO modulo2_normalizacion.metodos_pago (id_metodo, metodo_nombre) VALUES
('MP01','Transferencia'),
('MP02','Tarjeta credito'),
('MP03','Efectivo');
INSERT INTO modulo2_normalizacion.entidades_pago (id_entidad, entidad_nombre) VALUES
('EP01','Bancolombia'),
('EP02','Visa'),
('EP03','Caja principal');
INSERT INTO modulo2_normalizacion.ventas (venta_id, fecha_venta, cliente_doc, vendedor_id, id_metodo, id_entidad) VALUES
('V1001','2026-04-01','CC101','VEN01','MP01','EP01'),
('V1002','2026-04-02','CC102','VEN02','MP02','EP02'),
('V1003','2026-04-03','CC101','VEN01','MP01','EP01'),
('V1004','2026-04-04','CC103','VEN03','MP03','EP03');
INSERT INTO modulo2_normalizacion.detalle_ventas (venta_id, producto_codigo, cantidad, precio_unitario, descuento) VALUES
('V1001','P001',2,45000,0),
('V1001','P002',1,180000,0),

('V1002','P003',1,720000,20000),
('V1002','P001',1,45000,0),

('V1003','P004',1,2450000,50000),
('V1003','P002',2,180000,0),
('V1003','P005',1,95000,0),

('V1004','P003',2,720000,0),
('V1004','P006',1,150000,10000);