# REFLEXIÓN SOBRE EL DESARROLLO DEL PROYECTO

El desarrollo de este sistema de gestión de biblioteca ha permitido integrar conceptos fundamentales de ingeniería de software y bases de datos. A continuación, se detallan las reflexiones clave del proceso:

## 1. La Integridad como Pilar Fundamental
La implementación de restricciones (`Constraints`) como `CHECK`, `NOT NULL` y `FOREIGN KEY` no son solo reglas técnicas, sino la traducción de reglas de negocio al código. Asegurar que una fecha de devolución no sea anterior a la de préstamo o que el estado solo admita valores específicos garantiza que la base de datos sea una "fuente de verdad" confiable.

## 2. Automatización y Consistencia con Docker
El uso de Docker y Docker Compose transformó la gestión del entorno. Aprendimos que el orden de ejecución en la carpeta `initdb` es crítico; el simple hecho de numerar los archivos (`01_`, `02_`) previene fallos de dependencias y asegura que cualquier desarrollador pueda levantar el sistema con un solo comando, garantizando la paridad entre entornos.

## 3. Relacionalidad y Normalización
Diseñar tablas separadas para autores, categorías y libros, conectadas mediante llaves foráneas, demuestra la eficiencia del modelo relacional. Esto reduce la redundancia de datos y facilita el mantenimiento. Por ejemplo, cambiar el nombre de una categoría se hace en un solo lugar y se refleja en todos los libros asociados.

## 4. El Poder de las Consultas SQL
Más allá de almacenar datos, el valor real reside en la capacidad de extraer información. El uso de `JOINs` complejos, subconsultas con `NOT EXISTS` y funciones de agregación permite transformar filas de datos en reportes estratégicos, como identificar usuarios morosos o los libros menos solicitados.

## 5. Mejora Continua
A pesar de tener un sistema funcional, este proyecto deja la puerta abierta a futuras mejoras:
- Implementación de **Triggers** para automatizar sanciones.
- Creación de **Vistas** para simplificar reportes complejos.
- Optimización de **Procedimientos Almacenados** para la lógica de préstamo.

---
**Conclusión:** Este ejercicio refuerza que una base de datos bien estructurada es el cimiento de cualquier aplicación robusta. La combinación de una buena arquitectura relacional con herramientas de despliegue modernas es la clave para desarrollar software profesional.
