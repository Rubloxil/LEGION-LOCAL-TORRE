from fastapi import FastAPI, Request

# Inicializamos la aplicación
app = FastAPI()

# Ruta GET Usuarios
@app.get("/usuarios")
async def usuarios(request: Request):
    return {
        "url_visitada": str(request.url),
        "metodo_http": request.method
    }

# Ruta POST Equipos
@app.post("/equipos")
async def equipos(request: Request):
    return {
        "url_visitada": str(request.url),
        "metodo_http": request.method
    }

# Ruta GET con parámetro dinámico
@app.get("/proyectos/{proyecto_id}")
async def proyectos(proyecto_id: int, request: Request):
    return {
        "url_visitada": str(request.url),
        "metodo_http": request.method,
        "detalle": f"Proyecto con ID {proyecto_id}"
    }