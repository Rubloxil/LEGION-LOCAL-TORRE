from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

# Ruta principal
@app.get("/")
def inicio():
    return {
        "mensaje": "API funcionando correctamente"
    }

# Error personalizado 1
@app.get("/error1")
def error1():
    raise HTTPException(
        status_code=404,
        detail="Usuario no encontrado"
    )

# Error personalizado 2
@app.get("/error2")
def error2():
    raise HTTPException(
        status_code=400,
        detail="Datos inválidos"
    )

# Error personalizado 3
@app.get("/error3")
def error3():
    raise HTTPException(
        status_code=401,
        detail="Acceso denegado"
    )