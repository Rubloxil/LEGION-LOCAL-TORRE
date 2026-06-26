CREATE TABLE estudiantes
id_estudiante serial PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
correo VARCHAR(100) NOT NULL UNIQUE

CREATE TABLE cursos
id_curso SERIAL PRIMARY KEY,
nombre VARCHAR(100) NOT NULL

CREATE TABLE matriculas
id_matricula SERIAL PRIMARY KEY,
id_estudiante