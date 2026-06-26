# ACTIVIDAD 1: COHESIÓN

## ¿Qué es cohesión?

La cohesión es el grado en que una clase se enfoca en una única responsabilidad o tarea específica.

### Regla básica

> Una clase con alta cohesión realiza una sola función bien definida.

> Una clase con baja cohesión realiza demasiadas funciones diferentes.

---

## Parte A: Baja Cohesión

### Frase para memorizar

> "Hay baja cohesión porque una sola clase hace demasiadas tareas."

### Ejemplo

### BibliotecaSistema

- Registrar libros
- Prestar libros
- Generar reportes

Todo está mezclado en una sola clase.

### Problema

La clase tiene múltiples responsabilidades.

Esto dificulta:

- El mantenimiento
- Las pruebas
- La escalabilidad

---

## Parte B: Alta Cohesión

### Frase para memorizar

> "Hay alta cohesión porque cada clase tiene una única responsabilidad."

### Ejemplo

#### LibroService

Responsable de gestionar libros.

#### PrestamoService

Responsable de gestionar préstamos.

#### ReporteService

Responsable de generar reportes.

### Ventajas

- Código más organizado.
- Más fácil de mantener.
- Más fácil de reutilizar.
- Más fácil de probar.

---

# ACTIVIDAD 2: ACOPLAMIENTO

## ¿Qué es acoplamiento?

El acoplamiento mide el nivel de dependencia entre clases.

### Regla básica

> Mientras menos dependencias existan entre clases, mejor será el diseño.

---

## Parte A: Alto Acoplamiento

### Frase para memorizar

> "Hay alto acoplamiento porque una clase depende directamente de otra."

### Ejemplo

```text
PedidoService
      │
      ▼
EmailService
```

### Problema

Si EmailService cambia:

- PedidoService también debe cambiar.
- Se generan dependencias fuertes.
- El mantenimiento se vuelve más difícil.

---

## Parte B: Bajo Acoplamiento

### Frase para memorizar

> "Hay bajo acoplamiento porque se utiliza una interfaz."

### Ejemplo

```text
     Notificacion
          ▲
          │
     EmailService
```

### Explicación

PedidoService depende de la interfaz:

```java
Notificacion
```

No depende directamente de EmailService.

### Ventajas

- Se pueden cambiar implementaciones fácilmente.
- Menor dependencia entre clases.
- Código más flexible.

---

# ACTIVIDAD 3: SOLID

## Problema Inicial

Cuando una clase contiene muchos:

```java
if(...)
else if(...)
else if(...)
```

aparecen problemas de mantenimiento.

### Frase para memorizar

> "Existe baja cohesión y alto acoplamiento porque todo depende de condiciones."

### Ejemplo

```java
if(tipoPago.equals("Tarjeta"))
{
   ...
}
else if(tipoPago.equals("Paypal"))
{
   ...
}
else if(tipoPago.equals("Transferencia"))
{
   ...
}
```

### Problema

Cada vez que aparece un nuevo método de pago:

- Nequi
- Daviplata
- PSE

se debe modificar la clase existente.

Esto viola principios SOLID.

---

## Solución

Crear una clase independiente para cada método de pago.

### Ejemplo

#### PagoTarjeta

Procesa pagos con tarjeta.

#### PagoPaypal

Procesa pagos con PayPal.

#### PagoTransferencia

Procesa pagos por transferencia.

### Frase para memorizar

> "Existe alta cohesión y bajo acoplamiento porque cada método de pago tiene su propia clase."

### Ventajas

- Código organizado.
- Fácil mantenimiento.
- Fácil extensión.
- Menor dependencia.

---

# PRINCIPIO OPEN/CLOSED (SOLID)

## Definición

> "Las clases deben estar abiertas para extensión y cerradas para modificación."

---

## Ejemplo

Actualmente existen:

- PagoTarjeta
- PagoPaypal
- PagoTransferencia

Mañana se necesita agregar:

- PagoNequi

### Solución Correcta

Crear:

```java
PagoNequi.java
```

Sin modificar las clases anteriores.

### Beneficio

Se agregan nuevas funcionalidades sin alterar código existente.

Por eso cumple el principio Open/Closed.

---

# RESUMEN PARA LA EXPOSICIÓN

## Actividad 1

> "Se analiza la cohesión. En la parte A una sola clase realiza muchas tareas, por lo que existe baja cohesión. En la parte B cada clase tiene una responsabilidad específica, logrando alta cohesión."

---

## Actividad 2

> "Se analiza el acoplamiento. En la parte A existe una dependencia directa entre clases, generando alto acoplamiento. En la parte B se utiliza una interfaz, reduciendo la dependencia y logrando bajo acoplamiento."

---

## Actividad 3

> "Se aplican principios SOLID. La parte A utiliza múltiples estructuras if y else if, dificultando el mantenimiento. La parte B crea una clase independiente para cada método de pago, logrando alta cohesión, bajo acoplamiento y cumplimiento del principio Open/Closed."

---

# FÓRMULA RÁPIDA PARA RECORDAR

## Cohesión

> Qué tanto se enfoca una clase en una sola responsabilidad.

## Acoplamiento

> Qué tanto depende una clase de otras clases.

---

# BUENA ARQUITECTURA DE SOFTWARE

✅ Alta cohesión

✅ Bajo acoplamiento

✅ Cumplimiento del principio Open/Closed

---

# CONCLUSIÓN

Un buen diseño orientado a objetos busca:

- Clases con una única responsabilidad.
- Pocas dependencias entre componentes.ss
- Facilidad para agregar nuevas funcionalidades.
- Código mantenible y escalable.

Si recuerdas:
s
**Alta Cohesión + Bajo Acoplamiento + Open/Closed**

podrás explicar correctamente toda la actividad y los conceptos fundamentales de arquitectura de software.