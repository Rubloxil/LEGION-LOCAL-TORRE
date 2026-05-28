from fastapi import FastAPI, Path, Query, HTTPException
from pydantic import BaseModel
from typing import Optional, List

app = FastAPI(
    title="API Sistema Gestión Proyectos SENA",
    description="CRUD completo del proyecto formativo ADSO",
    version="1.0.0"
)

# =====================================================
# LISTAS SIMULANDO BASE DE DATOS
# =====================================================

usuarios = []
proyectos = []
tareas = []
entregables = []

# =====================================================
# MODELOS
# =====================================================

class Usuario(BaseModel):
    id: int
    nombres: str
    correo: str
    rol: str
    estado: str


class Proyecto(BaseModel):
    id: int
    nombre: str
    descripcion: str
    estado: str
    avance: int


class Tarea(BaseModel):
    id: int
    titulo: str
    prioridad: str
    estado: str


class Entregable(BaseModel):
    id: int
    nombre: str
    version: str
    estado: str


# =====================================================
# INICIO
# =====================================================

@app.get("/")
def inicio():
    return {
        "mensaje": "API Sistema Gestión Proyectos SENA"
    }

# =====================================================
# USUARIOS
# =====================================================

# GET
@app.get("/usuarios")
def listar_usuarios():

    return usuarios


# GET CON PARAMETROS
@app.get("/usuarios/{usuario_id}/{rol_id}")
def obtener_usuario(

    usuario_id: int = Path(..., gt=0),
    rol_id: int = Path(..., gt=0),

    nombres: Optional[str] = Query(
        None,
        min_length=3
    ),

    estado: Optional[str] = Query(
        None,
        min_length=3
    )

):

    return {
        "usuario_id": usuario_id,
        "rol_id": rol_id,
        "nombres": nombres,
        "estado": estado
    }


# POST
@app.post("/usuarios")
def crear_usuario(usuario: Usuario):

    usuarios.append(usuario)

    return {
        "mensaje": "Usuario creado",
        "data": usuario
    }


# PUT
@app.put("/usuarios/{usuario_id}")
def actualizar_usuario(
    usuario_id: int,
    usuario_actualizado: Usuario
):

    for index, usuario in enumerate(usuarios):

        if usuario.id == usuario_id:

            usuarios[index] = usuario_actualizado

            return {
                "mensaje": "Usuario actualizado"
            }

    raise HTTPException(
        status_code=404,
        detail="Usuario no encontrado"
    )


# DELETE
@app.delete("/usuarios/{usuario_id}")
def eliminar_usuario(usuario_id: int):

    for usuario in usuarios:

        if usuario.id == usuario_id:

            usuarios.remove(usuario)

            return {
                "mensaje": "Usuario eliminado"
            }

    raise HTTPException(
        status_code=404,
        detail="Usuario no encontrado"
    )

# =====================================================
# PROYECTOS
# =====================================================

# GET
@app.get("/proyectos")
def listar_proyectos():

    return proyectos


# GET PARAMETROS
@app.get("/proyectos/{proyecto_id}/{instructor_id}")
def obtener_proyecto(

    proyecto_id: int = Path(..., gt=0),

    instructor_id: int = Path(..., gt=0),

    estado: Optional[str] = Query(
        None,
        min_length=3
    ),

    avance: Optional[int] = Query(
        None,
        ge=0,
        le=100
    )

):

    return {
        "proyecto_id": proyecto_id,
        "instructor_id": instructor_id,
        "estado": estado,
        "avance": avance
    }


# POST
@app.post("/proyectos")
def crear_proyecto(proyecto: Proyecto):

    proyectos.append(proyecto)

    return {
        "mensaje": "Proyecto creado",
        "data": proyecto
    }


# PUT
@app.put("/proyectos/{proyecto_id}")
def actualizar_proyecto(
    proyecto_id: int,
    proyecto_actualizado: Proyecto
):

    for index, proyecto in enumerate(proyectos):

        if proyecto.id == proyecto_id:

            proyectos[index] = proyecto_actualizado

            return {
                "mensaje": "Proyecto actualizado"
            }

    raise HTTPException(
        status_code=404,
        detail="Proyecto no encontrado"
    )


# DELETE
@app.delete("/proyectos/{proyecto_id}")
def eliminar_proyecto(proyecto_id: int):

    for proyecto in proyectos:

        if proyecto.id == proyecto_id:

            proyectos.remove(proyecto)

            return {
                "mensaje": "Proyecto eliminado"
            }

    raise HTTPException(
        status_code=404,
        detail="Proyecto no encontrado"
    )

# =====================================================
# TAREAS
# =====================================================

@app.get("/tareas")
def listar_tareas():

    return tareas


@app.post("/tareas")
def crear_tarea(tarea: Tarea):

    tareas.append(tarea)

    return {
        "mensaje": "Tarea creada",
        "data": tarea
    }


@app.put("/tareas/{tarea_id}")
def actualizar_tarea(
    tarea_id: int,
    tarea_actualizada: Tarea
):

    for index, tarea in enumerate(tareas):

        if tarea.id == tarea_id:

            tareas[index] = tarea_actualizada

            return {
                "mensaje": "Tarea actualizada"
            }

    raise HTTPException(
        status_code=404,
        detail="Tarea no encontrada"
    )


@app.delete("/tareas/{tarea_id}")
def eliminar_tarea(tarea_id: int):

    for tarea in tareas:

        if tarea.id == tarea_id:

            tareas.remove(tarea)

            return {
                "mensaje": "Tarea eliminada"
            }

    raise HTTPException(
        status_code=404,
        detail="Tarea no encontrada"
    )

# =====================================================
# ENTREGABLES
# =====================================================

@app.get("/entregables")
def listar_entregables():

    return entregables


@app.post("/entregables")
def crear_entregable(entregable: Entregable):

    entregables.append(entregable)

    return {
        "mensaje": "Entregable creado",
        "data": entregable
    }


@app.put("/entregables/{entregable_id}")
def actualizar_entregable(
    entregable_id: int,
    entregable_actualizado: Entregable
):

    for index, entregable in enumerate(entregables):

        if entregable.id == entregable_id:

            entregables[index] = entregable_actualizado

            return {
                "mensaje": "Entregable actualizado"
            }

    raise HTTPException(
        status_code=404,
        detail="Entregable no encontrado"
    )


@app.delete("/entregables/{entregable_id}")
def eliminar_entregable(entregable_id: int):

    for entregable in entregables:

        if entregable.id == entregable_id:

            entregables.remove(entregable)

            return {
                "mensaje": "Entregable eliminado"
            }

    raise HTTPException(
        status_code=404,
        detail="Entregable no encontrado"
    )