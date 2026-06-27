# Mini Proyecto: Normalización de una Base de Datos de Ventas

Este proyecto implementa el proceso de normalización de una tabla de ventas hasta Tercera Forma Normal (3FN) utilizando PostgreSQL y Docker.

## Estructura del proyecto

```
modulo-2-normalizacion/
│
├── entorno-postgres/
│   └── docker-compose.yml
│
├── mini-proyecto-normalizacion-ventas/
│   ├── sql/
│   │   ├── 00_tabla_cruda.sql
│   │   ├── 01_modelo_normalizado.sql
│   │   ├── 02_datos_normalizados.sql
│   │   └── 03_consultas_validacion.sql
│   │
│   ├── diagrama_er.png
│   ├── informe_normalizacion.pdf
│   └── README.md
│
└── README.md
```

---

## Requisitos

- Docker Desktop
- Docker Compose
- Git (opcional)
- PostgreSQL (opcional, si se desea conectar desde una herramienta externa)

---

## Clonar el repositorio

```bash
git clone https://github.com/karem990823/Modulo_2_Normalizacion_de_un_Sistema_de_Ventas.git
cd modulo-2-normalizacion
```

---

## Inicializar el entorno

Entrar al directorio:

```bash
cd entorno-postgres
```

Levantar los contenedores:

```bash
docker compose up -d
```

Verificar que los contenedores estén en ejecución:

```bash
docker ps
```

Deberían aparecer:

- postgres16_bdcurso
- pgadmin_bdcurso

---

## Acceso a PostgreSQL

### Base de datos

- Base de datos: `curso_bd`
- Usuario: `curso_user`
- Contraseña: `curso_pass`
- Puerto: `5432`

---

## Acceso a PgAdmin

Abrir en el navegador:

```
http://localhost:8080
```

Credenciales:

- Email:

```
admin@curso.com
```

- Contraseña:

```
admin123
```

---

## Scripts SQL

### 00_tabla_cruda.sql

Crea la tabla original no normalizada e inserta los datos de ejemplo.

### 01_modelo_normalizado.sql

Crea el esquema y las tablas normalizadas en 3FN.

### 02_datos_normalizados.sql

Inserta los datos distribuidos en las tablas normalizadas.

### 03_consultas_validacion.sql

Contiene consultas para verificar:

- Reconstrucción del total de cada venta.
- Productos más vendidos.
- Ventas por vendedor.
- Historial de compras por cliente.
- Integridad referencial y registros huérfanos.

---

## Diagrama Entidad-Relación

El archivo:

```
diagrama_er.png
```

contiene el modelo entidad-relación de la base de datos normalizada.

---

## Detener los contenedores

```bash
docker compose down
```

---

## Tecnologías utilizadas

- PostgreSQL 16
- PgAdmin 4
- Docker
- Docker Compose
- SQL

---

## Autor

**Karem Juliet Barandica Arias**

Mini Proyecto – Normalización de Bases de Datos (3FN)
