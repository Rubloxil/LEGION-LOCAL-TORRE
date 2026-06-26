# ELEMENTOS USADOS EN LA BASE DE DATOS

Este proyecto de gestión bibliotecaria utiliza diversas herramientas y tecnologías para su funcionamiento, persistencia y administración.

## 1. Infraestructura y Despliegue
- **Docker**: Plataforma de contenedores para asegurar la portabilidad del entorno de desarrollo.
- **Docker Compose**: Herramienta de orquestación para definir y ejecutar aplicaciones multi-contenedor.
- **Redes Virtuales**: Implementación de `bd_network` para garantizar la comunicación aislada y segura entre los servicios.

## 2. Motor de Base de Datos
- **PostgreSQL 16**: Sistema de gestión de bases de datos relacionales (RDBMS) de código abierto, robusto y escalable.
- **Esquema de Datos**: Organización lógica de objetos bajo el esquema `biblioteca`.

## 3. Administración y Visualización
- **pgAdmin 4**: Interfaz gráfica web líder para la administración de PostgreSQL, facilitando la gestión de objetos y ejecución de consultas.

## 4. Elementos de Diseño de Base de Datos
- **Tablas**: Estructuras normalizadas para `usuarios`, `libros`, `autores`, `categorias`, `prestamos` y `sanciones`.
- **Restricciones de Integridad (Constraints)**:
    - `PRIMARY KEY`: Identificación única de registros.
    - `FOREIGN KEY`: Integridad referencial con acciones `ON DELETE CASCADE` y `ON UPDATE CASCADE`.
    - `CHECK`: Reglas de negocio para validar estados permitidos y coherencia de fechas.
    - `UNIQUE`: Garantía de unicidad para correos electrónicos e ISBN.
    - `NOT NULL`: Aseguramiento de la presencia de datos obligatorios.
- **Tipos de Datos**: Uso de `SERIAL` para IDs autoincrementales, `VARCHAR` para cadenas de texto, `DATE` para fechas y `TEXT` para descripciones largas.
- **Índices (Indexes)**: Optimización del rendimiento de búsqueda mediante `CREATE INDEX` en columnas frecuentemente consultadas.

## 5. Lenguaje de Consulta (SQL)
- **DDL (Data Definition Language)**: Scripts estructurados para la creación y modificación del esquema.
- **DML (Data Manipulation Language)**: Inserción de datos maestros y registros de prueba para validación.
- **DQL (Data Query Language)**: Consultas complejas utilizando `JOIN`, agregaciones (`COUNT`), agrupamientos (`GROUP BY`), ordenamiento (`ORDER BY`) y lógica de subconsultas (`NOT EXISTS`).
