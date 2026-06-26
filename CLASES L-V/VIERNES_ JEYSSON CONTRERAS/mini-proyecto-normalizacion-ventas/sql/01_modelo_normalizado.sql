
CREATE SCHEMA IF NOT EXISTS normalizacion_ventas;
SET search_path TO normalizacion_ventas;

CREATE TABLE categorias(
 id_categoria SERIAL PRIMARY KEY,
 nombre VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE clientes(
 cliente_doc VARCHAR(20) PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 email VARCHAR(120) UNIQUE,
 telefono VARCHAR(30),
 direccion VARCHAR(150),
 ciudad VARCHAR(80)
);

CREATE TABLE vendedores(
 vendedor_id VARCHAR(10) PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 zona VARCHAR(80)
);

CREATE TABLE productos(
 producto_codigo VARCHAR(10) PRIMARY KEY,
 nombre VARCHAR(120) NOT NULL,
 id_categoria INT NOT NULL REFERENCES categorias(id_categoria)
);

CREATE TABLE ventas(
 venta_id VARCHAR(10) PRIMARY KEY,
 fecha_venta DATE NOT NULL,
 cliente_doc VARCHAR(20) REFERENCES clientes(cliente_doc),
 vendedor_id VARCHAR(10) REFERENCES vendedores(vendedor_id),
 metodo_pago VARCHAR(80),
 entidad_pago VARCHAR(80)
);

CREATE TABLE detalle_venta(
 id_detalle SERIAL PRIMARY KEY,
 venta_id VARCHAR(10) REFERENCES ventas(venta_id) ON DELETE CASCADE,
 producto_codigo VARCHAR(10) REFERENCES productos(producto_codigo),
 cantidad INT NOT NULL CHECK(cantidad > 0),
 precio_unitario NUMERIC(12,2) NOT NULL CHECK(precio_unitario >= 0),
 descuento NUMERIC(12,2) DEFAULT 0 CHECK(descuento >= 0)
);
