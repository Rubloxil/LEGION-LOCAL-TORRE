-- =========================================
-- ANÁLISIS DEL USO DE ÍNDICES
-- =========================================


-- =========================================
-- 1. CONSULTA SIN ÍNDICE
-- =========================================

EXPLAIN
SELECT *
FROM academia.profesores
WHERE correo = 'profesor1@correo.com';


-- =========================================
-- 2. CREAR ÍNDICE SOBRE EL CORREO
-- =========================================

CREATE INDEX idx_profesores_correo
ON academia.profesores(correo);


-- =========================================
-- 3. CREAR ÍNDICE SOBRE EL NOMBRE
-- DEL DEPARTAMENTO
-- =========================================

CREATE INDEX idx_departamentos_nombre
ON academia.departamentos(nombre);


-- =========================================
-- 4. CONSULTA DESPUÉS DEL ÍNDICE
-- =========================================

EXPLAIN
SELECT *
FROM academia.profesores
WHERE correo = 'profesor1@correo.com';


-- =========================================
-- COMPARACIÓN DEL PLAN DE EJECUCIÓN
-- =========================================

-- ANTES DEL ÍNDICE
--
-- PostgreSQL normalmente realiza:
--
-- Seq Scan
--
-- Esto significa:
-- - Escaneo secuencial.
-- - Recorre toda la tabla fila por fila.
-- - Es más lento en tablas grandes.
--
-- Ejemplo:
--
-- Seq Scan on profesores


-- =========================================
-- DESPUÉS DEL ÍNDICE
-- =========================================
--
-- PostgreSQL puede usar:
--
-- Index Scan
--
-- Esto significa:
-- - Usa el índice creado.
-- - Encuentra datos más rápido.
-- - Evita recorrer toda la tabla.
--
-- Ejemplo:
--
-- Index Scan using idx_profesores_correo


-- =========================================
-- ¿EN QUÉ COLUMNAS CONVIENE
-- CREAR ÍNDICES?
-- =========================================
--
-- Conviene crear índices en columnas que:
--
-- - Se usan frecuentemente en WHERE.
-- - Se usan en JOIN.
-- - Se usan en ORDER BY.
-- - Tienen valores únicos.
-- - Se usan mucho en búsquedas y filtros.
--
-- Ejemplos:
--
-- - correo
-- - documento
-- - id_usuario
-- - codigo_producto


-- =========================================
-- ¿EN QUÉ COLUMNAS NO CONVIENE?
-- =========================================
--
-- No conviene crear índices en columnas:
--
-- - Con pocos valores distintos.
-- - Que cambian constantemente.
-- - En tablas pequeñas.
--
-- Ejemplos:
--
-- - sexo
-- - estado
-- - activo
--
-- Porque el índice consume espacio
-- y puede hacer más lentos los
-- INSERT, UPDATE y DELETE.