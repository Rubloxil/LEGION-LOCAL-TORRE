from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field

app = FastAPI()

# 1. Definición del Modelo con sus validaciones
class Producto(BaseModel):
    nombre: str
    precio: float = Field(gt=0, description="El precio debe ser mayor a 0")
    stock: int = Field(ge=0, description="El stock debe ser mayor o igual a 0")

# 2. Ruta POST para recibir y validar el producto
@app.post("/productos/")
def crear_producto(producto: Producto):
    # Si llega aquí, Pydantic ya validó los datos automáticamente
    return {
        "mensaje": "Producto válido",
        "datos": producto
    }