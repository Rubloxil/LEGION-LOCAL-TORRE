DROP TABLE IF EXISTS normalizacion.detalle_ventas_3fn CASCADE; 
DROP TABLE IF EXISTS normalizacion.ventas_3fn CASCADE; 
DROP TABLE IF EXISTS normalizacion.clientes_3fn CASCADE; 
DROP TABLE IF EXISTS normalizacion.ciudades CASCADE; 
DROP TABLE IF EXISTS normalizacion.departamentos CASCADE; 
DROP TABLE IF EXISTS normalizacion.productos_3fn CASCADE; 

DROP TABLE IF EXISTS normalizacion.vendedores_3fn CASCADE;  
CREATE TABLE normalizacion.departamentos (     
    id_departamento SERIAL PRIMARY KEY,     
    nombre VARCHAR(100) NOT NULL UNIQUE );  
CREATE TABLE normalizacion.ciudades (     
    id_ciudad SERIAL PRIMARY KEY,     
    nombre VARCHAR(100) NOT NULL,     
    id_departamento INT NOT NULL,      
    CONSTRAINT fk_ciudad_departamento         
    FOREIGN KEY (id_departamento)         
    REFERENCES normalizacion.departamentos(id_departamento),      
    CONSTRAINT uq_ciudad_departamento 
    UNIQUE (nombre, id_departamento) );  
CREATE TABLE normalizacion.clientes_3fn (     
    id_cliente SERIAL PRIMARY KEY,     
    nombre VARCHAR(100) NOT NULL,     
    correo VARCHAR(120) UNIQUE NOT NULL,     
    id_ciudad INT NOT NULL,      
    CONSTRAINT fk_cliente_ciudad         
    FOREIGN KEY (id_ciudad)         
    REFERENCES normalizacion.ciudades(id_ciudad) );  
    
CREATE TABLE normalizacion.vendedores_3fn (     
    id_vendedor SERIAL PRIMARY KEY,     
    nombre VARCHAR(100) NOT NULL UNIQUE );  
CREATE TABLE normalizacion.productos_3fn (     
    id_producto SERIAL PRIMARY KEY,     
    nombre VARCHAR(100) NOT NULL UNIQUE ); 
CREATE TABLE normalizacion.ventas_3fn (     
    id_venta SERIAL PRIMARY KEY,     
    id_cliente INT NOT NULL,     
    id_vendedor INT NOT NULL,     
    fecha_venta DATE NOT NULL DEFAULT CURRENT_DATE,      
    CONSTRAINT fk_ventas_clientes_3fn         
    FOREIGN KEY (id_cliente)         
    REFERENCES normalizacion.clientes_3fn(id_cliente),      
    CONSTRAINT fk_ventas_vendedores_3fn         
    FOREIGN KEY (id_vendedor)         
    REFERENCES normalizacion.vendedores_3fn(id_vendedor) );  
CREATE TABLE normalizacion.detalle_ventas_3fn (     
    id_venta INT NOT NULL,     
    id_producto INT NOT NULL,     
    cantidad INT NOT NULL CHECK (cantidad > 0),      
    PRIMARY KEY (id_venta, id_producto),      
    CONSTRAINT fk_detalle_ventas_3fn         
    FOREIGN KEY (id_venta)         
    REFERENCES normalizacion.ventas_3fn(id_venta)         
    ON DELETE CASCADE,      
    CONSTRAINT fk_detalle_productos_3fn         
    FOREIGN KEY (id_producto)         
    REFERENCES normalizacion.productos_3fn(id_producto) );