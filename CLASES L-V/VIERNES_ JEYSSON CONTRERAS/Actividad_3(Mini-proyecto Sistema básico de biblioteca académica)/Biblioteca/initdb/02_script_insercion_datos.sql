INSERT INTO biblioteca.usuarios (nombre, correo) VALUES
('Carlos Pérez', 'carlos.perez@email.com'),
('Ana Martínez', 'ana.mtz@email.com'),
('Luis Rodríguez', 'l.rodriguez@email.com'),
('Elena Diaz', 'elena.diaz@email.com'),
('Marcos Velez', 'marcos.velez@email.com'),
('Amelia Smith', 'ameli@email.com'),
('Andres Vargas', 'andres@email.com');

INSERT INTO biblioteca.autores (nombre, nacionalidad) VALUES
('Gabriel García Márquez', 'Colombiana'),
('Miguel de Cervantes', 'Española'),
('William Shakespeare', 'Inglesa'),
('George Orwell', 'Británica'),
('Jane Austen', 'Británica'),
('Isabel Allende', 'Chilena');

INSERT INTO biblioteca.categorias (nombre) VALUES
('Novela'), ('Fantasía'), ('Ciencia Ficción'), ('Poesía'), ('Historia');

INSERT INTO biblioteca.libros (nombre, isbn, id_autor, id_categoria) VALUES
('Cien Años de Soledad', '978-0307474728', 1, 1),
('El Amor en los Tiempos del Cólera', '978-0307387264', 1, 1),
('Don Quijote de la Mancha', '978-8420412146', 2, 1),
('La Casa de los Espíritus', '978-1501117015', 3, 1),
('1984', '978-0451524935', 4, 3),
('Orgullo y Prejuicio', '978-0199535563', 5, 1),
('Eva Luna', '978-0525433491', 3, 2);

INSERT INTO biblioteca.prestamos (id_usuario, id_libro, fecha_prestamo, fecha_devolucion, estado) VALUES
(1, 1, CURRENT_DATE - INTERVAL '2 days', CURRENT_DATE + INTERVAL '5 days', 'ACTIVO'),
(1, 2, CURRENT_DATE - INTERVAL '8 days', CURRENT_DATE - INTERVAL '2 days', 'DEVUELTO'),
(3, 1, CURRENT_DATE - INTERVAL '12 days', CURRENT_DATE - INTERVAL '5 days', 'VENCIDO'),
(4, 5, CURRENT_DATE - INTERVAL '14 days', CURRENT_DATE - INTERVAL '3 days', 'VENCIDO');

INSERT INTO biblioteca.sanciones (id_prestamo, descripcion) VALUES
(3, 'El usuario tiene un retraso crítico en la devolución del ejemplar.'),
(4, 'Sanción automática por vencimiento de plazo.');