-- PASO 1: Crear la tabla usuarios e insertar usuario de prueba
-- Ejecutar este script en tu servidor MySQL

CREATE DATABASE IF NOT EXISTS db_login;
USE db_login;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Insertar usuario de prueba
INSERT INTO usuarios (usuario, password) VALUES ('admin', '1234');

-- Verificar que se insertó correctamente
SELECT * FROM usuarios;
