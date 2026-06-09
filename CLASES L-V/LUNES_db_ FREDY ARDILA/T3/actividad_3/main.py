from fastapi import FastAPI
from pydantic import BaseModel, Field, EmailStr
from typing import List
from datetime import date

app = FastAPI()

# ========== MODELOS ==========

class Cliente(BaseModel):
    id: int = Field(gt=0, description="ID mayor a 0")
    nombre: str = Field(min_length=3, max_length=50, description="Mínimo 3 caracteres")
    email: EmailStr = Field(description="Correo electrónico válido")
    telefono: str = Field(min_length=7, max_length=15, description="Teléfono entre 7-15 dígitos")
    edad: int = Field(gt=0, lt=120, description="Edad entre 1 y 119 años")

class Producto(BaseModel):
    id: int = Field(gt=0, description="ID mayor a 0")
    nombre: str = Field(min_length=3, max_length=100, description="Mínimo 3 caracteres")
    precio: float = Field(gt=0, description="Precio mayor a 0")
    stock: int = Field(ge=0, description="Stock mayor o igual a 0")
    categoria: str = Field(min_length=3, description="Mínimo 3 caracteres")

class Empleado(BaseModel):
    id: int = Field(gt=0, description="ID mayor a 0")
    nombre: str = Field(min_length=3, max_length=50, description="Mínimo 3 caracteres")
    email: EmailStr = Field(description="Correo electrónico válido")
    cargo: str = Field(min_length=3, description="Mínimo 3 caracteres")
    salario: float = Field(gt=0, description="Salario mayor a 0")
    fecha_contratacion: date = Field(description="Fecha en formato YYYY-MM-DD")

class Proveedor(BaseModel):
    id: int = Field(gt=0, description="ID mayor a 0")
    nombre: str = Field(min_length=3, max_length=100, description="Mínimo 3 caracteres")
    ruc: str = Field(min_length=8, max_length=11, description="RUC entre 8-11 dígitos")
    telefono: str = Field(min_length=7, max_length=15, description="Teléfono entre 7-15 dígitos")
    direccion: str = Field(min_length=5, description="Mínimo 5 caracteres")
    email: EmailStr = Field(description="Correo electrónico válido")

# ========== BASE DE DATOS SIMULADA ==========

clientes_db: List[Cliente] = []
productos_db: List[Producto] = []
empleados_db: List[Empleado] = []
proveedores_db: List[Proveedor] = []

# ========== ENDPOINTS ==========

@app.get("/")
def inicio():
    return {"mensaje": "API de modelos funcionando"}

# Clientes
@app.post("/clientes")
def crear_cliente(cliente: Cliente):
    clientes_db.append(cliente)
    return {"mensaje": "Cliente válido", "datos": cliente}

@app.get("/clientes")
def listar_clientes():
    return clientes_db

# Productos
@app.post("/productos")
def crear_producto(producto: Producto):
    productos_db.append(producto)
    return {"mensaje": "Producto válido", "datos": producto}

@app.get("/productos")
def listar_productos():
    return productos_db

# Empleados
@app.post("/empleados")
def crear_empleado(empleado: Empleado):
    empleados_db.append(empleado)
    return {"mensaje": "Empleado válido", "datos": empleado}

@app.get("/empleados")
def listar_empleados():
    return empleados_db

# Proveedores
@app.post("/proveedores")
def crear_proveedor(proveedor: Proveedor):
    proveedores_db.append(proveedor)
    return {"mensaje": "Proveedor válido", "datos": proveedor}

@app.get("/proveedores")
def listar_proveedores():
    return proveedores_db