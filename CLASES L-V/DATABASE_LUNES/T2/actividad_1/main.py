from fastapi import FastAPI, Path, Query

app = FastAPI(
    title="API Retail",
    description="Sistema de consultas para clientes, facturación e inventario",
    version="1.0"
)

# =========================================
# LISTA DE CLIENTES
# =========================================

clientes = [
    {"id": 1, "nombre": "Juan Perez", "correo": "juan@gmail.com"},
    {"id": 2, "nombre": "Maria Lopez", "correo": "maria@gmail.com"},
    {"id": 3, "nombre": "Carlos Ruiz", "correo": "carlos@gmail.com"},
    {"id": 4, "nombre": "Ana Torres", "correo": "ana@gmail.com"},
    {"id": 5, "nombre": "Luis Gomez", "correo": "luis@gmail.com"}
]

# =========================================
# LISTA DE FACTURAS
# =========================================

facturas = [
    {"numero": "FAC-01", "cliente": "Juan Perez", "total": 150000},
    {"numero": "FAC-02", "cliente": "Maria Lopez", "total": 220000},
    {"numero": "FAC-03", "cliente": "Carlos Ruiz", "total": 175000},
    {"numero": "FAC-04", "cliente": "Ana Torres", "total": 98000},
    {"numero": "FAC-05", "cliente": "Luis Gomez", "total": 300000}
]

# =========================================
# LISTA DE PRODUCTOS
# =========================================

productos = [
    {"id": 1, "nombre": "Laptop Lenovo", "stock": 10},
    {"id": 2, "nombre": "Mouse Logitech", "stock": 50},
    {"id": 3, "nombre": "Teclado Redragon", "stock": 20},
    {"id": 4, "nombre": "Monitor Samsung", "stock": 15},
    {"id": 5, "nombre": "Audifonos HyperX", "stock": 25}
]

# =========================================
# MÓDULO CLIENTES
# Ruta: /clientes/{cliente_id}
# =========================================

@app.get("/clientes/{cliente_id}")
def obtener_cliente(
    cliente_id: int = Path(
        ...,
        gt=0,
        description="ID del cliente mayor a 0"
    )
):

    for cliente in clientes:
        if cliente["id"] == cliente_id:
            return cliente

    return {"mensaje": "Cliente no encontrado"}

# =========================================
# MÓDULO FACTURAS
# Ruta: /facturas/{numero_factura}
# =========================================

@app.get("/facturas/{numero_factura}")
def obtener_factura(
    numero_factura: str = Path(
        ...,
        min_length=5,
        description="Número de factura mínimo 5 caracteres"
    )
):

    for factura in facturas:
        if factura["numero"] == numero_factura:
            return factura

    return {"mensaje": "Factura no encontrada"}

# =========================================
# MÓDULO INVENTARIO
# Ruta: /productos/buscar
# =========================================

@app.get("/productos/buscar")
def buscar_productos(
    nombre: str = Query(
        None,
        min_length=3,
        description="Nombre del producto mínimo 3 letras"
    )
):

    if nombre is None:
        return productos

    resultado = []

    for producto in productos:
        if nombre.lower() in producto["nombre"].lower():
            resultado.append(producto)

    return resultado