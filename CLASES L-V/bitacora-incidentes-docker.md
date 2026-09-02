# 🔧 Bitácora de incidentes — Levantamiento del entorno con Docker

Registro de los problemas reales encontrados al levantar el proyecto SGP
SENA con `docker compose` por primera vez en un entorno Windows, con su
causa raíz confirmada y la solución aplicada. Útil como referencia para
cualquier integrante que vuelva a levantar el entorno desde cero, o para
incluir como evidencia de proceso en la sustentación.

---

## Incidente 1 — `sgp_sena_db` quedaba "unhealthy" y todo el stack fallaba

**Síntoma:**
```
✘ Container sgp_sena_db       Error dependency db failed to start
dependency failed to start: container sgp_sena_db is unhealthy
```

**Causa raíz confirmada** (vía `docker logs sgp_sena_db`):
```
[ERROR] [Entrypoint]: Database is uninitialized and password option is not specified
    You need to specify one of the following as an environment variable:
    - MYSQL_ROOT_PASSWORD
    - MYSQL_ALLOW_EMPTY_PASSWORD
    - MYSQL_RANDOM_ROOT_PASSWORD
```

`docker-compose.yml` referencia variables como `${DB_ROOT_PASSWORD}`,
`${DB_NAME}`, etc. Estas variables se leen de un archivo **`.env` en la
raíz del proyecto** (junto a `docker-compose.yml`), no de `backend/.env`.
Como ese archivo no existía todavía, Docker Compose sustituyó todas las
variables por strings vacíos (`docker compose config` lo confirma con un
warning: `"DB_ROOT_PASSWORD" variable is not set. Defaulting to a blank
string.`). MySQL no puede inicializar su base de datos con una contraseña
de root vacía, así que el `healthcheck` fallaba en cada reintento hasta
marcar el contenedor como `unhealthy`.

**Complicaciones que retrasaron el diagnóstico:**
- Se intentó corregir editando `backend/.env` (el que usa el backend
  cuando corre *fuera* de Docker) en vez del `.env` de la raíz (el que lee
  `docker-compose.yml`) — son dos archivos con propósitos distintos.
- El primer intento de `.env` en la raíz se creó con Notepad; existía el
  riesgo de que Windows lo guardara como `.env.txt` en vez de `.env` (se
  descartó como causa al confirmar el nombre exacto con extensiones de
  archivo visibles, pero consumió tiempo de diagnóstico).
- Al haber quedado un volumen de datos parcialmente inicializado de los
  primeros intentos fallidos, hubo que descartarlo por completo con
  `docker compose down -v` antes de que la corrección del `.env`
  surtiera efecto — MySQL solo ejecuta los scripts de inicialización
  (`docker-entrypoint-initdb.d/`) la primera vez que arranca con un
  volumen de datos vacío.

**Solución aplicada:**
1. Crear `.env` en la raíz del proyecto (no en `backend/`) con
   `DB_ROOT_PASSWORD`, `DB_NAME`, `DB_USER`, `DB_PASSWORD`, `JWT_SECRET`,
   etc. — creado directamente desde PowerShell con `Set-Content` para
   evitar problemas de codificación/extensión de Notepad.
2. Confirmar que Docker sí lee las variables:
   `docker compose config | Select-String "MYSQL_ROOT_PASSWORD"`
3. `docker compose down -v` (descartar el volumen dañado)
4. `docker compose up -d --build` (reconstruir desde cero, ya con las
   variables correctas)

---

## Incidente 2 — `Access denied for user 'sgp_user'@'localhost'`

**Síntoma:** al correr `node database/seed.js` directamente en la máquina
Windows (no dentro de Docker).

**Causa raíz:** se mezclaron dos flujos de trabajo distintos:
- **Flujo A (con Docker):** el backend corre *dentro* del contenedor y se
  conecta a la base de datos usando `DB_HOST=db` (el nombre del servicio
  en la red interna de Docker).
- **Flujo B (sin Docker, desarrollo local):** el backend corre directo en
  Windows y se conecta a `DB_HOST=localhost`, apuntando a un MySQL que
  tendría que estar corriendo localmente.

Se corrió el seed con la configuración del Flujo B (`backend/.env` con
`DB_HOST=localhost`) mientras el contenedor de base de datos —Flujo A—
aún no había arrancado correctamente por el Incidente 1. Ese
`localhost:3306` no correspondía a ninguna instancia de MySQL con el
usuario `sgp_user` creado.

**Solución aplicada:** una vez resuelto el Incidente 1, se corrió el seed
**dentro** del contenedor del backend, no en la máquina Windows:
```powershell
docker compose exec backend node database/seed.js
```

---

## Incidente 3 — Login fallaba en el frontend aunque los contenedores estaban "healthy"

**Síntoma:** los 3 contenedores (`db`, `backend`, `frontend`) en estado
`Up (healthy)`, pero ningún usuario de prueba podía iniciar sesión.

**Causa raíz:** el `seed.js` nunca se había ejecutado todavía en ese
levantamiento del entorno. Los contenedores "healthy" solo confirman que
los *servicios* están corriendo, no que la base de datos tenga datos
cargados — el schema se crea automáticamente al iniciar MySQL (vía
`docker-entrypoint-initdb.d`), pero los usuarios de prueba solo existen
después de correr el seed manualmente.

**Solución aplicada:**
```powershell
docker compose exec backend node database/seed.js
```

---

## Incidente 4 — "Demasiados intentos, espera 15 minutos" al intentar login

**Causa raíz:** protección contra fuerza bruta en el endpoint de login
(buena práctica de seguridad, no un bug). Los múltiples intentos fallidos
del Incidente 3 —cuando los usuarios de prueba todavía no existían en la
base de datos— se contaron como intentos fallidos reales y activaron el
bloqueo temporal.

**Solución aplicada:** el contador de intentos se guarda en memoria del
proceso del backend, así que reiniciar el contenedor lo reinicia también:
```powershell
docker compose restart backend
```

---

## 📋 Causa raíz común a los 3 primeros incidentes

Todos partieron del mismo origen: **el archivo `.env` de la raíz no
existía** cuando se corrió `docker compose up` por primera vez. Para
evitar que esto le pase a otro integrante del equipo, conviene:

1. Agregar un `.env.example` en la raíz del proyecto (igual a como ya
   existe en `backend/`), documentando las variables que
   `docker-compose.yml` espera.
2. Mencionar explícitamente en el `README.md` principal que hay **dos**
   archivos `.env` distintos (raíz para Docker, `backend/` para
   desarrollo local sin Docker) y para qué sirve cada uno — esta
   distinción no era obvia y causó la mayoría de la confusión.
