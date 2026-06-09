<<<<<<< HEAD
CREATE SCHEMA IF NOT EXISTS academia;

SET search_path TO academia;

-- =========================================
-- TABLA ESTUDIANTE
-- =========================================

CREATE TABLE estudiante (

    id_estudiante SERIAL PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    correo VARCHAR(100) NOT NULL UNIQUE,

    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE
);

-- =========================================
-- TABLA CURSO
-- =========================================

CREATE TABLE curso (

    id_curso SERIAL PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    codigo VARCHAR(20) NOT NULL,

    creditos INT NOT NULL CHECK (creditos > 0)
);

-- =========================================
-- TABLA INSCRIPCION
-- =========================================

CREATE TABLE inscripcion (

    id_inscripcion SERIAL PRIMARY KEY,

    id_estudiante INT NOT NULL,

    id_curso INT NOT NULL,

    FOREIGN KEY (id_estudiante)
        REFERENCES estudiante(id_estudiante)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    FOREIGN KEY (id_curso)
        REFERENCES curso(id_curso)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- =========================================
-- INSERTAR DATOS ESTUDIANTE
-- =========================================

INSERT INTO estudiante(nombre, correo)
VALUES
('Juan Perez', 'juan@gmail.com'),
('Maria Lopez', 'maria@gmail.com');

-- =========================================
-- INSERTAR DATOS CURSO
-- =========================================

INSERT INTO curso(nombre, codigo, creditos)
VALUES
('Base de Datos', 'BD101', 3),
('Programacion Java', 'JAVA201', 4);

-- =========================================
-- INSERTAR INSCRIPCIONES
-- =========================================

INSERT INTO inscripcion(id_estudiante, id_curso)
VALUES
(1,1),
(2,2);

-- =========================================
-- CONSULTAS
-- =========================================

SELECT * FROM estudiante;

SELECT * FROM curso;

=======
CREATE SCHEMA IF NOT EXISTS academia;

SET search_path TO academia;

-- =========================================
-- TABLA ESTUDIANTE
-- =========================================

CREATE TABLE estudiante (

    id_estudiante SERIAL PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    correo VARCHAR(100) NOT NULL UNIQUE,

    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE
);

-- =========================================
-- TABLA CURSO
-- =========================================

CREATE TABLE curso (

    id_curso SERIAL PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    codigo VARCHAR(20) NOT NULL,

    creditos INT NOT NULL CHECK (creditos > 0)
);

-- =========================================
-- TABLA INSCRIPCION
-- =========================================

CREATE TABLE inscripcion (

    id_inscripcion SERIAL PRIMARY KEY,

    id_estudiante INT NOT NULL,

    id_curso INT NOT NULL,

    FOREIGN KEY (id_estudiante)
        REFERENCES estudiante(id_estudiante)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    FOREIGN KEY (id_curso)
        REFERENCES curso(id_curso)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- =========================================
-- INSERTAR DATOS ESTUDIANTE
-- =========================================

INSERT INTO estudiante(nombre, correo)
VALUES
('Juan Perez', 'juan@gmail.com'),
('Maria Lopez', 'maria@gmail.com');

-- =========================================
-- INSERTAR DATOS CURSO
-- =========================================

INSERT INTO curso(nombre, codigo, creditos)
VALUES
('Base de Datos', 'BD101', 3),
('Programacion Java', 'JAVA201', 4);

-- =========================================
-- INSERTAR INSCRIPCIONES
-- =========================================

INSERT INTO inscripcion(id_estudiante, id_curso)
VALUES
(1,1),
(2,2);

-- =========================================
-- CONSULTAS
-- =========================================

SELECT * FROM estudiante;

SELECT * FROM curso;

>>>>>>> 316c2acbdbf86ff9f38cabb0c1564e0f4b6f4a40
SELECT * FROM inscripcion;