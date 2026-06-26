CREATE SCHEMA IF NOT EXISTS academia;

CREATE TABLE academia.estudiantes(
    id_estudiante SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE academia.cursos(
    id_curso SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) NOT NULL,
    creditos INT NOT NULL CHECK (creditos > 0)
);

CREATE TABLE academia.matriculas(
    id_matricula SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    fecha_matricula DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_estudiante) REFERENCES academia.estudiantes (id_estudiante) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_curso) REFERENCES academia.cursos(id_curso) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE INDEX idx_estudiantes_correo ON academia.estudiantes(correo);
CREATE INDEX idx_cursos_codigo ON academia.cursos(codigo);
CREATE INDEX idx_matriculas_estudiante ON academia.matriculas(id_estudiante);

INSERT INTO academia.estudiantes (nombre, correo) VALUES
('Juan Perez', 'jp@gmail.com'), ('Mari Lopez', 'ml@gmail.com'), ('Ana Gomez', 'an@gmail.com');

INSERT INTO academia.cursos (nombre, codigo, creditos) VALUES
('MATEMATICAS', 'MAT001', 3), ('MECANICA', 'MEC001', 4);

INSERT INTO academia.matriculas (id_estudiante, id_curso) VALUES
(1, 1), (1, 2), (2, 1), (3, 2);
