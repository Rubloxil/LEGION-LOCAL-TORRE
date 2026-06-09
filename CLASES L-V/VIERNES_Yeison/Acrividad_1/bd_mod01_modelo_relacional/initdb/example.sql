<<<<<<< HEAD
-- =========================================
-- CREAR SCHEMA
-- =========================================

CREATE SCHEMA IF NOT EXISTS academia;

SET search_path TO academia;

-- =========================================
-- ELIMINAR TABLAS SI EXISTEN
-- =========================================

DROP TABLE IF EXISTS inscripcion CASCADE;
DROP TABLE IF EXISTS estudiante CASCADE;
DROP TABLE IF EXISTS curso CASCADE;

-- =========================================
-- TABLA ESTUDIANTE
-- =========================================

CREATE TABLE estudiante (

    id_estudiante SERIAL PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    correo VARCHAR(100) UNIQUE NOT NULL,

    edad INT CHECK (edad >= 15),

    fecha_registro DATE DEFAULT CURRENT_DATE
);

-- =========================================
-- TABLA CURSO
-- =========================================

CREATE TABLE curso (

    id_curso SERIAL PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    codigo VARCHAR(20) UNIQUE NOT NULL,

    creditos INT CHECK (creditos > 0)
);

-- =========================================
-- TABLA INSCRIPCION
-- =========================================

CREATE TABLE inscripcion (

    id_inscripcion SERIAL PRIMARY KEY,

    id_estudiante INT NOT NULL,

    id_curso INT NOT NULL,

    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_estudiante)
        REFERENCES estudiante(id_estudiante)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (id_curso)
        REFERENCES curso(id_curso)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================
-- INSERTAR ESTUDIANTES
-- =========================================

INSERT INTO estudiante(nombre, correo, edad)
VALUES
('Juan Perez', 'juan@gmail.com', 20),
('Maria Lopez', 'maria@gmail.com', 22),
('Carlos Ruiz', 'carlos@gmail.com', 19);

-- =========================================
-- INSERTAR CURSOS
-- =========================================

INSERT INTO curso(nombre, codigo, creditos)
VALUES
('Base de Datos', 'BD101', 3),
('Programacion Java', 'JAVA201', 4),
('Docker y PostgreSQL', 'DK301', 2);

-- =========================================
-- INSERTAR INSCRIPCIONES
-- =========================================

INSERT INTO inscripcion(id_estudiante, id_curso)
VALUES
(1,1),
(1,2),
(2,2),
(3,3);

-- =========================================
-- CONSULTAS BÁSICAS
-- =========================================

SELECT * FROM estudiante;

SELECT * FROM curso;

SELECT * FROM inscripcion;

-- =========================================
-- CONSULTA CON JOIN
-- =========================================

SELECT
    e.nombre AS estudiante,
    c.nombre AS curso,
    i.fecha_inscripcion
FROM inscripcion i
INNER JOIN estudiante e
ON i.id_estudiante = e.id_estudiante
INNER JOIN curso c
ON i.id_curso = c.id_curso;

-- =========================================
-- ACTUALIZAR DATOS
-- =========================================

UPDATE estudiante
SET edad = 23
WHERE id_estudiante = 2;

-- =========================================
-- ELIMINAR DATOS
-- =========================================

DELETE FROM inscripcion
WHERE id_inscripcion = 4;

-- =========================================
-- CONSULTA FINAL
-- =========================================

SELECT
    e.nombre,
    e.correo,
    c.nombre AS curso
FROM estudiante e
INNER JOIN inscripcion i
ON e.id_estudiante = i.id_estudiante
INNER JOIN curso c
=======
-- =========================================
-- CREAR SCHEMA
-- =========================================

CREATE SCHEMA IF NOT EXISTS academia;

SET search_path TO academia;

-- =========================================
-- ELIMINAR TABLAS SI EXISTEN
-- =========================================

DROP TABLE IF EXISTS inscripcion CASCADE;
DROP TABLE IF EXISTS estudiante CASCADE;
DROP TABLE IF EXISTS curso CASCADE;

-- =========================================
-- TABLA ESTUDIANTE
-- =========================================

CREATE TABLE estudiante (

    id_estudiante SERIAL PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    correo VARCHAR(100) UNIQUE NOT NULL,

    edad INT CHECK (edad >= 15),

    fecha_registro DATE DEFAULT CURRENT_DATE
);

-- =========================================
-- TABLA CURSO
-- =========================================

CREATE TABLE curso (

    id_curso SERIAL PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    codigo VARCHAR(20) UNIQUE NOT NULL,

    creditos INT CHECK (creditos > 0)
);

-- =========================================
-- TABLA INSCRIPCION
-- =========================================

CREATE TABLE inscripcion (

    id_inscripcion SERIAL PRIMARY KEY,

    id_estudiante INT NOT NULL,

    id_curso INT NOT NULL,

    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_estudiante)
        REFERENCES estudiante(id_estudiante)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (id_curso)
        REFERENCES curso(id_curso)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================
-- INSERTAR ESTUDIANTES
-- =========================================

INSERT INTO estudiante(nombre, correo, edad)
VALUES
('Juan Perez', 'juan@gmail.com', 20),
('Maria Lopez', 'maria@gmail.com', 22),
('Carlos Ruiz', 'carlos@gmail.com', 19);

-- =========================================
-- INSERTAR CURSOS
-- =========================================

INSERT INTO curso(nombre, codigo, creditos)
VALUES
('Base de Datos', 'BD101', 3),
('Programacion Java', 'JAVA201', 4),
('Docker y PostgreSQL', 'DK301', 2);

-- =========================================
-- INSERTAR INSCRIPCIONES
-- =========================================

INSERT INTO inscripcion(id_estudiante, id_curso)
VALUES
(1,1),
(1,2),
(2,2),
(3,3);

-- =========================================
-- CONSULTAS BÁSICAS
-- =========================================

SELECT * FROM estudiante;

SELECT * FROM curso;

SELECT * FROM inscripcion;

-- =========================================
-- CONSULTA CON JOIN
-- =========================================

SELECT
    e.nombre AS estudiante,
    c.nombre AS curso,
    i.fecha_inscripcion
FROM inscripcion i
INNER JOIN estudiante e
ON i.id_estudiante = e.id_estudiante
INNER JOIN curso c
ON i.id_curso = c.id_curso;

-- =========================================
-- ACTUALIZAR DATOS
-- =========================================

UPDATE estudiante
SET edad = 23
WHERE id_estudiante = 2;

-- =========================================
-- ELIMINAR DATOS
-- =========================================

DELETE FROM inscripcion
WHERE id_inscripcion = 4;

-- =========================================
-- CONSULTA FINAL
-- =========================================

SELECT
    e.nombre,
    e.correo,
    c.nombre AS curso
FROM estudiante e
INNER JOIN inscripcion i
ON e.id_estudiante = i.id_estudiante
INNER JOIN curso c
>>>>>>> 316c2acbdbf86ff9f38cabb0c1564e0f4b6f4a40
ON i.id_curso = c.id_curso;