from fastapi import FastAPI
from pydantic import BaseModel, Field, EmailStr

app = FastAPI()

# Modelo con validaciones
class Usuario(BaseModel):
    nombre: str = Field(min_length=3)
    correo: EmailStr
    edad: int = Field(gt=0)

# Modelo de respuesta 
class UsuarioResponse(BaseModel):
    mensaje: str
    usuario: Usuario

# Endpoint con response_model
@app.post("/usuarios", response_model=UsuarioResponse)
def crear_usuario(usuario: Usuario):
    return {
        "mensaje": "Usuario válido",
        "usuario": usuario
    }