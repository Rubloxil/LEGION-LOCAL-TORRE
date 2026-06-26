CREATE TABLE academia.departamentos (     
  id_departamento SERIAL PRIMARY KEY,     
  nombre VARCHAR(100) NOT NULL UNIQUE );  

CREATE TABLE academia.profesores (     
  id_profesor SERIAL PRIMARY KEY,     
  id_departamento INT NOT NULL,     
  nombre VARCHAR(100) NOT NULL,     
  correo VARCHAR(120) UNIQUE NOT NULL,      
  CONSTRAINT fk_profesor_departamento         
  FOREIGN KEY (id_departamento)         
  REFERENCES academia.departamentos(id_departamento)         
  ON DELETE RESTRICT         
  ON UPDATE CASCADE ); 

INSERT INTO academia.departamentos (nombre)
VALUES 
    ('Ingeniería de Sistemas'),
    ('Matemáticas'),
    ('Administración');

INSERT INTO academia.profesores (id_departamento, nombre, correo)
VALUES
    (1, 'Carlos Pérez', 'carlos.perez@academia.edu'),
    (1, 'Laura Gómez', 'laura.gomez@academia.edu'),
    (2, 'Andrés Martínez', 'andres.martinez@academia.edu'),
    (2, 'Sofía Ramírez', 'sofia.ramirez@academia.edu'),
    (3, 'Miguel Torres', 'miguel.torres@academia.edu');

SELECT      
  p.nombre AS profesor,     
  p.correo,     
  d.nombre AS departamento
  FROM academia.profesores p 
  JOIN academia.departamentos d     
  ON p.id_departamento = d.id_departamento; 
