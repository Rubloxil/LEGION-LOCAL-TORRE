from fastapi import FastAPI
from pydantic import BaseModel, Field

app = FastAPI()

class Producto(BaseModel):
    nombre: str
    precio: float = Field(gt=0)
    stock: int = Field(ge=0)#mayor o igual a cero

@app.post("/productos")
def crear_producto(producto: Producto):
    return {
        "mensaje": "Producto registrado",
        "producto": producto
    }
