-- 1. Listar todos los libros con su autor y categoría.
SELECT 
    l.nombre AS titulo, 
    a.nombre AS autor, 
    c.nombre AS categoria
FROM biblioteca.libros l
JOIN biblioteca.autores a ON l.id_autor = a.id_autor
JOIN biblioteca.categorias c ON l.id_categoria = c.id_categoria;

-- 2. Listar todos los préstamos activos.
SELECT * 
FROM biblioteca.prestamos 
WHERE estado = 'ACTIVO';

-- 3. Consultar los préstamos de un usuario específico (ejemplo con ID 1).
SELECT * 
FROM biblioteca.prestamos 
WHERE id_usuario = 1;

-- 4. Identificar libros que no tienen préstamos activos.
SELECT l.*
FROM biblioteca.libros l
WHERE NOT EXISTS (
    SELECT 1 
    FROM biblioteca.prestamos p 
    WHERE p.id_libro = l.id_libro 
    AND p.estado = 'ACTIVO'
);

-- 5. Contar cuántos préstamos tiene cada usuario.
SELECT 
    u.nombre, 
    COUNT(p.id_prestamo) AS total_prestamos
FROM biblioteca.usuarios u
LEFT JOIN biblioteca.prestamos p ON u.id_usuario = p.id_usuario
GROUP BY u.id_usuario, u.nombre;

-- 6. Consultar préstamos vencidos según una fecha de referencia (ejemplo: fecha actual).
SELECT * 
FROM biblioteca.prestamos 
WHERE estado = 'VENCIDO' 
   OR (estado = 'ACTIVO' AND fecha_devolucion < CURRENT_DATE);

-- 7. Mostrar libros prestados junto con la fecha esperada de devolución.
SELECT 
    l.nombre AS libro, 
    p.fecha_devolucion
FROM biblioteca.libros l
JOIN biblioteca.prestamos p ON l.id_libro = p.id_libro
WHERE p.estado = 'ACTIVO';

-- 8. Mostrar usuarios ordenados por cantidad de préstamos.
SELECT 
    u.nombre, 
    COUNT(p.id_prestamo) AS total_prestamos
FROM biblioteca.usuarios u
LEFT JOIN biblioteca.prestamos p ON u.id_usuario = p.id_usuario
GROUP BY u.id_usuario, u.nombre
ORDER BY total_prestamos DESC;
