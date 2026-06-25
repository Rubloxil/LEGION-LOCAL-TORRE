# PASO 6: Endpoint /login
# PASO 7: Configuración CORS (obligatorio para que React pueda comunicarse)
# Archivo: main.py

from fastapi import FastAPI, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session

from database import get_db
from model import Usuario
from schemas import LoginSchema

app = FastAPI()

# PASO 7 — CORS: permite peticiones desde el puerto donde corre React
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],   # Puerto por defecto de Vite (React)
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# PASO 6 — Endpoint de login
@app.post("/login")
def login(datos: LoginSchema, db: Session = Depends(get_db)):
    # Busca el usuario en la BD
    usuario = db.query(Usuario).filter(Usuario.usuario == datos.usuario).first()

    # Valida que exista y que la contraseña coincida
    if not usuario or usuario.password != datos.password:
        raise HTTPException(status_code=401, detail="Usuario o contraseña incorrectos")

    return {"mensaje": "Login exitoso", "usuario": usuario.usuario}
