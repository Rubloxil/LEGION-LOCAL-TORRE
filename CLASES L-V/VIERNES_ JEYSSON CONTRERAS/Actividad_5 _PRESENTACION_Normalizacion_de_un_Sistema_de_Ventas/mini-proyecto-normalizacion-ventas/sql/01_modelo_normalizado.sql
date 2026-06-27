CREATE SCHEMA IF NOT EXISTS modulo2_normalizacion;

CREATE TABLE modulo2_normalizacion.departamentos(
    id_departamento VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE modulo2_normalizacion.ciudades(
    id_ciudad VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_departamento VARCHAR(10) NOT NULL,
    CONSTRAINT fk_departamentos
        FOREIGN KEY (id_departamento)
        REFERENCES modulo2_normalizacion.departamentos(id_departamento),
    CONSTRAINT uq_ciudad_departamento
        UNIQUE(nombre, id_departamento)
);

CREATE TABLE modulo2_normalizacion.clientes(
    cliente_doc VARCHAR(20) PRIMARY KEY,
    cliente_nombre VARCHAR(100) NOT NULL,
    cliente_email VARCHAR(100) NOT NULL UNIQUE,
    cliente_telefono VARCHAR(20) NOT NULL,
    cliente_direccion VARCHAR(150) NOT NULL,
    id_ciudad VARCHAR(10) NOT NULL,
    CONSTRAINT fk_ciudades
        FOREIGN KEY (id_ciudad)
        REFERENCES modulo2_normalizacion.ciudades(id_ciudad)
);

CREATE TABLE modulo2_normalizacion.zonas(
    id_zona VARCHAR(10) PRIMARY KEY,
    zona_nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE modulo2_normalizacion.vendedores(
    vendedor_id VARCHAR(10) PRIMARY KEY,
    vendedor_nombre VARCHAR(100) NOT NULL,
    id_zona VARCHAR(10) NOT NULL,
    CONSTRAINT fk_zonas
        FOREIGN KEY (id_zona)
        REFERENCES modulo2_normalizacion.zonas(id_zona)
);

CREATE TABLE modulo2_normalizacion.categorias(
    id_categoria VARCHAR(10) PRIMARY KEY,
    categoria_nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE modulo2_normalizacion.productos(
    producto_codigo VARCHAR(10) PRIMARY KEY,
    producto_nombre VARCHAR(100) NOT NULL,
    id_categoria VARCHAR(10) NOT NULL,
    CONSTRAINT fk_categorias
        FOREIGN KEY (id_categoria)
        REFERENCES modulo2_normalizacion.categorias(id_categoria)
);

CREATE TABLE modulo2_normalizacion.metodos_pago(
    id_metodo VARCHAR(10) PRIMARY KEY,
    metodo_nombre VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE modulo2_normalizacion.entidades_pago(
    id_entidad VARCHAR(10) PRIMARY KEY,
    entidad_nombre VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE modulo2_normalizacion.ventas(
    venta_id VARCHAR(10) PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    cliente_doc VARCHAR(20) NOT NULL,
    vendedor_id VARCHAR(10) NOT NULL,
    id_metodo VARCHAR(10) NOT NULL,
    id_entidad VARCHAR(10) NOT NULL,

    CONSTRAINT fk_clientes
        FOREIGN KEY (cliente_doc)
        REFERENCES modulo2_normalizacion.clientes(cliente_doc),

    CONSTRAINT fk_vendedores
        FOREIGN KEY (vendedor_id)
        REFERENCES modulo2_normalizacion.vendedores(vendedor_id),

    CONSTRAINT fk_metodos_pago
        FOREIGN KEY (id_metodo)
        REFERENCES modulo2_normalizacion.metodos_pago(id_metodo),

    CONSTRAINT fk_entidades_pago
        FOREIGN KEY (id_entidad)
        REFERENCES modulo2_normalizacion.entidades_pago(id_entidad)
);

CREATE TABLE modulo2_normalizacion.detalle_ventas(
    venta_id VARCHAR(10),
    producto_codigo VARCHAR(10),
    cantidad INT NOT NULL,
    precio_unitario NUMERIC(12,2) NOT NULL,
    descuento NUMERIC(12,2) DEFAULT 0,

    PRIMARY KEY (venta_id, producto_codigo),

    CONSTRAINT fk_ventas
        FOREIGN KEY (venta_id)
        REFERENCES modulo2_normalizacion.ventas(venta_id),

    CONSTRAINT fk_productos
        FOREIGN KEY (producto_codigo)
        REFERENCES modulo2_normalizacion.productos(producto_codigo),

    CONSTRAINT chk_cantidad
        CHECK (cantidad > 0),

    CONSTRAINT chk_precio
        CHECK (precio_unitario > 0),

    CONSTRAINT chk_descuento
        CHECK (descuento >= 0)
);