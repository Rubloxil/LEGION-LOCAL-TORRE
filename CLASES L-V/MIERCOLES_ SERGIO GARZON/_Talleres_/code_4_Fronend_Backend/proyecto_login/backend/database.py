# PASO 3: Conexión a la Base de Datos
# Archivo: database.py

from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# Parámetros de conexión — ajusta usuario, contraseña y nombre de BD
DATABASE_URL = "mysql+mysqlconnector://root:@localhost:3306/db_login"

engine = create_engine(DATABASE_URL)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()


# Función para obtener la sesión de BD (se usa como dependencia en FastAPI)
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
