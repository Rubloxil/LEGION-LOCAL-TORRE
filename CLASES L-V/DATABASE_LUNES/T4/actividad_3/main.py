from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="API Restringida con CORS")

origins = [
    "https://mi-estudiante-react.com"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["POST"],  # Solo POST permitido desde navegador
    allow_headers=["*"],
)


@app.post("/api/datos")
def guardar_datos():
    return {
        "status": "éxito",
        "mensaje": "Petición POST aceptada por CORS"
    }


@app.get("/api/usuarios")
def listar_usuarios():
    return {
        "status": "error_cors",
        "mensaje": "El navegador puede bloquear esta respuesta por política CORS"
    }