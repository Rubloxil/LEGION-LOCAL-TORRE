EXPLAIN 
  SELECT * FROM academia.profesores 
  WHERE correo = 'profesor1@correo.com'; 

CREATE INDEX idx_profesores_correo 
  ON academia.profesores(correo); 

CREATE INDEX idx_depatamentos_nombre 
  ON academia.departamentos(nombre); 

EXPLAIN SELECT * FROM academia.profesores 
  WHERE correo = 'laura.gomez@academia.edu';

/*se crean índices en columnas que se usan frecuentemente para:
búsquedas (WHERE), uniones (JOIN), ordenamientos (ORDER BY), agrupaciones (GROUP BY), validaciones de unicidad (UNIQUE).
















