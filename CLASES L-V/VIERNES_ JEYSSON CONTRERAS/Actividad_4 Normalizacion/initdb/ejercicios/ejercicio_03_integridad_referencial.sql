/* 1. Intentar insertar un profesor con un id_departamento inexistente */
INSERT INTO academia.profesores ( 
  id_departamento, nombre, correo ) 
  VALUES ( 
  999, 'Profesor Inválido', 'invalido@correo.com' ); 

/* 2. Error generado */

ERROR: insert or update on table "profesores" violates foreign key constraint 

/* 3. Intentar eliminar un departamento con profesores asociados */

DELETE FROM academia.departamentos
WHERE id_departamento = 1;

/* 4. */

ERROR: update or delete on table "departamentos"
violates foreign key constraint
"fk_profesor_departamento" on table "profesores"

DETAIL: Key (id_departamento)=(1)
is still referenced from table "profesores".

/* 5. Primero se elimina la restricción actual */

ALTER TABLE academia.profesores
DROP CONSTRAINT fk_profesor_departamento;

/* Luego se crea nuevamente con CASCADE */

ALTER TABLE academia.profesores
ADD CONSTRAINT fk_profesor_departamento
FOREIGN KEY (id_departamento)
REFERENCES academia.departamentos(id_departamento)
ON DELETE CASCADE
ON UPDATE CASCADE;
