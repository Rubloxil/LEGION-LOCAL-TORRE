# 🔗 Conectar Backend FastAPI con Frontend React

Guía completa paso a paso para conectar una base de datos MySQL con un formulario de login en React usando FastAPI como backend.

---

## 📋 Estructura del proyecto

```
proyecto_login/
├── backend/
│   ├── crear_tabla.sql     ← Paso 1: Script SQL
│   ├── database.py         ← Paso 3: Conexión a BD
│   ├── model.py            ← Paso 4: Modelo ORM
│   ├── schemas.py          ← Paso 5: Esquema Pydantic
│   ├── main.py             ← Paso 6 y 7: Endpoint + CORS
│   └── requirements.txt    ← Librerías Python
└── frontend/
    └── src/
        ├── App.jsx
        └── Login.jsx       ← Paso 9: Formulario React
```

---

## ✅ PASO 1 — Crear la tabla en MySQL

Abre MySQL Workbench o la terminal MySQL y ejecuta:

```sql
-- Archivo: backend/crear_tabla.sql
CREATE DATABASE IF NOT EXISTS db_login;
USE db_login;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

INSERT INTO usuarios (usuario, password) VALUES ('admin', '1234');
```

> ⚠️ Mantén el servidor MySQL en ejecución durante todo el proceso.

---

## ✅ PASO 2 — Crear el proyecto FastAPI con entorno virtual

Abre una terminal en la carpeta `backend/`:

```bash
# Crear entorno virtual
python -m venv venv

# Activar entorno virtual
# Windows:
venv\Scripts\activate
# Mac/Linux:
source venv/bin/activate

# Instalar librerías
pip install -r requirements.txt
```

> ⚠️ El entorno virtual debe estar **siempre activo** antes de correr el backend.

---

## ✅ PASO 3 — Configurar la conexión a la BD

Edita `backend/database.py` y ajusta tu usuario y contraseña de MySQL:

```python
DATABASE_URL = "mysql+mysqlconnector://root:TU_PASSWORD@localhost:3306/db_login"
#                                       ^^^^  ^^^^^^^^^^^
#                                       usuario  contraseña
```

---

## ✅ PASO 4 — Modelo ORM (model.py)

Ya creado. Representa la tabla `usuarios` como clase Python con SQLAlchemy.

---

## ✅ PASO 5 — Esquema de validación (schemas.py)

Ya creado. Pydantic valida que `usuario` y `password` sean strings antes de procesar.

---

## ✅ PASO 6 y 7 — Endpoint Login + CORS (main.py)

El endpoint `POST /login` recibe las credenciales, las busca en la BD y responde.

El middleware CORS permite que React (en `localhost:5173`) envíe peticiones al backend.

---

## ✅ PASO 8 — Ejecutar FastAPI

Con el entorno virtual activo:

```bash
cd backend
uvicorn main:app --reload
```

El servidor queda disponible en: **http://127.0.0.1:8000**

Para probar el endpoint antes de conectar React:
- Swagger UI: http://127.0.0.1:8000/docs
- O usa Postman / Thunder Client con:
  - **POST** `http://127.0.0.1:8000/login`
  - Body JSON: `{ "usuario": "admin", "password": "1234" }`

---

## ✅ PASO 9 — Crear y ejecutar el proyecto React

En una **nueva terminal**, fuera de la carpeta `backend`:

```bash
# Crear proyecto React con Vite
npm create vite@latest frontend -- --template react
cd frontend
npm install

# Reemplaza src/App.jsx y src/Login.jsx con los archivos de este proyecto
# Luego levanta el servidor:
npm run dev
```

Abre tu navegador en **http://localhost:5173**

Ingresa `admin` / `1234` y verás el mensaje de login exitoso. ✅

---

## 🔑 Usuario de prueba

| Campo    | Valor  |
|----------|--------|
| usuario  | admin  |
| password | 1234   |
