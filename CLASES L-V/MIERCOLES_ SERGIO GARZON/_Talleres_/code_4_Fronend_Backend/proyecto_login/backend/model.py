# PASO 4: Modelo ORM de SQLAlchemy
# Archivo: model.py
#
# Representa la tabla "usuarios" de la BD como una clase Python.
# Permite trabajar con objetos en lugar de escribir SQL manualmente.

from sqlalchemy import Column, Integer, String
from database import Base


class Usuario(Base):
    __tablename__ = "usuarios"

    id = Column(Integer, primary_key=True, index=True)
    usuario = Column(String(100), unique=True, nullable=False)
    password = Column(String(255), nullable=False)
