# PASO 5: Esquema de entrada de datos con Pydantic
# Archivo: schemas.py
#
# Pydantic valida que los datos recibidos sean del tipo correcto
# antes de procesarlos en el endpoint.

from pydantic import BaseModel


class LoginSchema(BaseModel):
    usuario: str
    password: str
