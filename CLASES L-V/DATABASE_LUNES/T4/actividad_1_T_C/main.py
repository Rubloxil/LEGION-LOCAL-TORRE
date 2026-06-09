import datetime
from fastapi import FastAPI, Request, HTTPException
from fastapi.responses import JSONResponse

# Crear aplicación FastAPI
app = FastAPI(title="API - Middleware y Manejo de Errores")

# ==================================================
# 1. MANEJADOR GLOBAL DE ERRORES
# ==================================================

@app.exception_handler(HTTPException)
async def manejador_errores(request: Request, exc: HTTPException):
    return JSONResponse(
        status_code=exc.status_code,
        content={
            "error": True,
            "detalle": exc.detail,
            "hora_fallo": datetime.datetime.now().strftime("%H:%M:%S")
        }
    )

# ==================================================
# 2. MIDDLEWARE
# ==================================================

@app.middleware("http")
async def middleware_logging(request: Request, call_next):

    ruta = request.url.path
    metodo = request.method
    fecha_hora = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    print(
        f"[PETICIÓN] Ruta: {ruta} | Método: {metodo} | Fecha/Hora: {fecha_hora}"
    )

    response = await call_next(request)

    return response

# ==================================================
# 3. RUTAS DE PRUEBA
# ==================================================

# Ruta exitosa
@app.get("/api/bien")
def api_bien():
    return {
        "error": False,
        "mensaje": "Todo salió perfecto"
    }

# Ruta con error
@app.get("/api/mal")
def api_mal():
    raise HTTPException(
        status_code=400,
        detail="Faltan datos importantes en la petición"
    )
