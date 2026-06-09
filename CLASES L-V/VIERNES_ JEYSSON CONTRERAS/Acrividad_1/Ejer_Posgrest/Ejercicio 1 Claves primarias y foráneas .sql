<<<<<<< HEAD
CREATE TABLE academia.departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE academia.profesores (
    id_profesor SERIAL PRIMARY KEY,
    id_departamento INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(120) UNIQUE NOT NULL,
    CONSTRAINT fk_profesor_departamento FOREIGN KEY (id_departamento) REFERENCES academia.departamentos (id_departamento) ON DELETE RESTRICT ON UPDATE CASCADE
);
-- =========================
-- INSERTAR DEPARTAMENTOS
-- =========================
INSERT INTO
    academia.departamentos (nombre)
VALUES ('Ingeniería'),
    ('Matemáticas'),
    ('Humanidades');

-- =========================
-- INSERTAR PROFESORES
-- =========================
INSERT INTO
    academia.profesores (
        id_departamento,
        nombre,
        correo
    )
VALUES (
        1,
        'Carlos Perez',
        'carlos@academia.com'
    ),
    (
        1,
        'Ana Gomez',
        'ana@academia.com'
    ),
    (
        2,
        'Luis Torres',
        'luis@academia.com'
    ),
    (
        2,
        'Maria Diaz',
        'maria@academia.com'
    ),
    (
        3,
        'Pedro Ruiz',
        'pedro@academia.com'
    );

-- =========================
-- CONSULTAR PROFESORES
-- CON SU DEPARTAMENTO
-- =========================
SELECT p.id_profesor, p.nombre AS profesor, p.correo, d.nombre AS departamento
FROM academia.profesores p
=======
CREATE TABLE academia.departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE academia.profesores (
    id_profesor SERIAL PRIMARY KEY,
    id_departamento INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(120) UNIQUE NOT NULL,
    CONSTRAINT fk_profesor_departamento FOREIGN KEY (id_departamento) REFERENCES academia.departamentos (id_departamento) ON DELETE RESTRICT ON UPDATE CASCADE
);
-- =========================
-- INSERTAR DEPARTAMENTOS
-- =========================
INSERT INTO
    academia.departamentos (nombre)
VALUES ('Ingeniería'),
    ('Matemáticas'),
    ('Humanidades');

-- =========================
-- INSERTAR PROFESORES
-- =========================
INSERT INTO
    academia.profesores (
        id_departamento,
        nombre,
        correo
    )
VALUES (
        1,
        'Carlos Perez',
        'carlos@academia.com'
    ),
    (
        1,
        'Ana Gomez',
        'ana@academia.com'
    ),
    (
        2,
        'Luis Torres',
        'luis@academia.com'
    ),
    (
        2,
        'Maria Diaz',
        'maria@academia.com'
    ),
    (
        3,
        'Pedro Ruiz',
        'pedro@academia.com'
    );

-- =========================
-- CONSULTAR PROFESORES
-- CON SU DEPARTAMENTO
-- =========================
SELECT p.id_profesor, p.nombre AS profesor, p.correo, d.nombre AS departamento
FROM academia.profesores p
>>>>>>> 316c2acbdbf86ff9f38cabb0c1564e0f4b6f4a40
    INNER JOIN academia.departamentos d ON p.id_departamento = d.id_departamento;