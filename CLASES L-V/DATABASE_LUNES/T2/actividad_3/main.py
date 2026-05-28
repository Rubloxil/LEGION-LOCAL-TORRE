from fastapi import FastAPI, Path, Query
from typing import Optional

app = FastAPI()

# =========================================
# USUARIOS
# =========================================

@app.get("/usuarios/{usuario_id}/{rol_id}")
def obtener_usuario(

    usuario_id: int = Path(..., gt=0),

    rol_id: int = Path(..., gt=0),

    nombres: Optional[str] = Query(
        None,
        min_length=3,
        max_length=50
    ),

    estado: Optional[str] = Query(
        None,
        min_length=3,
        max_length=20
    )

):

    return {
        "modulo": "usuarios",
        "usuario_id": usuario_id,
        "rol_id": rol_id,
        "nombres": nombres,
        "estado": estado
    }

# =========================================
# PROYECTOS
# =========================================

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
        "modulo": "proyectos",
        "proyecto_id": proyecto_id,
        "instructor_id": instructor_id,
        "estado": estado,
        "avance": avance
    }

# =========================================
# TAREAS
# =========================================

@app.get("/tareas/{tarea_id}/{proyecto_id}")
def obtener_tarea(

    tarea_id: int = Path(..., gt=0),

    proyecto_id: int = Path(..., gt=0),

    prioridad: Optional[str] = Query(
        None,
        min_length=4
    ),

    estado: Optional[str] = Query(
        None,
        min_length=3
    )

):

    return {
        "modulo": "tareas",
        "tarea_id": tarea_id,
        "proyecto_id": proyecto_id,
        "prioridad": prioridad,
        "estado": estado
    }

# =========================================
# ENTREGABLES
# =========================================

@app.get("/entregables/{entregable_id}/{fase_id}")
def obtener_entregable(

    entregable_id: int = Path(..., gt=0),

    fase_id: int = Path(..., gt=0),

    version: Optional[str] = Query(
        None,
        min_length=1,
        max_length=10
    ),

    estado: Optional[str] = Query(
        None,
        min_length=3
    )

):

    return {
        "modulo": "entregables",
        "entregable_id": entregable_id,
        "fase_id": fase_id,
        "version": version,
        "estado": estado
    }

# =========================================
# FASES
# =========================================

@app.get("/fases/{fase_id}/{proyecto_id}")
def obtener_fase(

    fase_id: int = Path(..., gt=0),

    proyecto_id: int = Path(..., gt=0),

    nombre_fase: Optional[str] = Query(
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
        "modulo": "fases",
        "fase_id": fase_id,
        "proyecto_id": proyecto_id,
        "nombre_fase": nombre_fase,
        "avance": avance
    }

# =========================================
# INICIO
# =========================================

@app.get("/")
def inicio():

    return {
        "mensaje": "API Sistema Gestión Proyectos SENA"
    }