from fastapi import FastAPI, HTTPException

app = FastAPI()

# Base de datos simulada
db_usuarios = [
    {"id": 1, "nombre": "Camila Rodriguez", "rol": "Administrador"},
    {"id": 2, "nombre": "Jhon Martinez", "rol": "Instructor"},
    {"id": 3, "nombre": "Sofia Herrera", "rol": "Aprendiz"}
]

db_productos = [
    {"codigo": "P001", "nombre": "Monitor Gamer", "precio": 950000},
    {"codigo": "P002", "nombre": "Audifonos Bluetooth", "precio": 180000},
    {"codigo": "P003", "nombre": "Silla Ergonomica", "precio": 720000}
]

# Endpoint 1: Consultar usuario por ID
@app.get("/usuarios/{user_id}")
def obtener_usuario(user_id: int):

    for usuario in db_usuarios:

        if usuario["id"] == user_id:
            return usuario

    raise HTTPException(
        status_code=404,
        detail="Usuario no encontrado"
    )

# Endpoint 2: Consultar producto por código
@app.get("/productos/{codigo}")
def obtener_producto(codigo: str):

    for producto in db_productos:

        if producto["codigo"] == codigo:
            return producto

    raise HTTPException(
        status_code=404,
        detail="Producto no encontrado"
    )

# Endpoint 3: Buscar productos por nombre
@app.get("/buscar")
def buscar_productos(nombre: str):

    resultados = []

    for p in db_productos:

        if nombre.lower() in p["nombre"].lower():
            resultados.append(p)

    if len(resultados) == 0:
        return {"mensaje": "No se encontraron resultados"}

    return resultados