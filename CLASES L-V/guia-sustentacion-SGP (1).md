# 🎤 Guía para sustentar — SGP SENA

Documento de apoyo para la sustentación. Tenlo abierto en una pestaña aparte
o impreso — está pensado para consultarlo mientras hablas, no para leerlo
textual.

---

## 1. El pitch de 30 segundos (ábrelo así)

> "Construimos un Sistema de Gestión de Proyectos para el SENA que conecta
> a instructores y aprendices en un solo lugar: creación de proyectos,
> equipos, fases, entregables, tareas, retroalimentación, evaluación y
> reuniones. Backend en Node/Express con MySQL, autenticación real con JWT
> y roles, frontend en React. De los 22 requisitos funcionales
> documentados, tenemos **16 completamente verificados y funcionando**,
> 4 más ya construidos y en fase de prueba, y 3 parcialmente implementados.
> Se los muestro."

No prometas más de lo que vas a demostrar. Es mejor decir "16 de 23"
con seguridad que decir "casi todo" y que te pregunten algo que falla.

---

## 2. Orden recomendado de la demo en vivo

Sigue este orden exacto — está diseñado para que cada paso dependa del
anterior y se sienta como un flujo real, no una lista de features sueltas.

| # | Qué mostrar | Cómo | Por qué en ese orden |
|---|---|---|---|
| 1 | Levantar el proyecto | `docker compose up -d` → backend `pnpm run dev` → frontend `pnpm run dev` | Demuestra que corre con **una sola vía de entrega** (Docker + repo), tal como pedía el profesor |
| 2 | Login como Instructor | `maria@mail.com` / `123` | Muestra JWT real, no una sesión falsa |
| 3 | Crear un proyecto nuevo | Pestaña Proyectos → "+ Nuevo proyecto" | RF2.1 |
| 4 | Agregar una fase y un entregable | Dentro del proyecto → pestaña Fases → Entregables | RF2.3, HU-19 |
| 5 | Comentar el entregable | Pestaña Entregables → "Ver detalle" → escribir comentario | RN-015, módulo que construimos desde cero |
| 6 | Cambiar el proyecto a "En Revisión" y calificar | Editar estado del proyecto → volver al entregable → calificar | **Esta es la joya de la corona**: demuestra una regla de negocio real (RN-016) funcionando en ambos sentidos |
| 7 | Programar una reunión | Pestaña Reuniones → "+ Programar" | RN-021 — menciona que notifica automáticamente a todo el equipo |
| 8 | Cerrar sesión, entrar como Aprendiz | `carlos@mail.com` / `123` | Muestra que el menú cambia — RF1.3, control de roles |
| 9 | Intentar entrar a `/usuarios` como Aprendiz | Escribir la URL directo en el navegador | Debe rechazarlo — demuestra que la protección de rutas es real, no solo visual |

**Tiempo estimado: 6-8 minutos.** Practíquenlo una vez completo antes del día real, cronometrado.

---

## 3. El bug que encontramos — cuéntalo, no lo escondas

Esto suena contraintuitivo, pero **contar el bug que encontraron y
corrigieron es uno de los mejores momentos de la sustentación**. Demuestra
que probaron de verdad, no que solo escribieron código y asumieron que
funcionaba.

> "Antes de entregar, levantamos una base de datos real y probamos cada
> endpoint con peticiones HTTP reales, no solo revisando el código. Así
> encontramos que la tabla `github_integration` estaba definida en
> mayúsculas en el script SQL, mientras las otras 15 tablas están en
> minúsculas. En Linux —que es como corre el contenedor de Docker en
> producción— los nombres de tabla son sensibles a mayúsculas, así que
> esto habría fallado silenciosamente. Lo corregimos y volvimos a probar
> antes de entregar."

Si el profesor pregunta "¿cómo saben que funciona?", esta es tu respuesta
lista.

---

## 4. Respuestas preparadas a las preguntas más probables

### "¿Por qué usan pnpm y no npm?"
> "Para fijar versiones exactas de dependencias sin ambigüedad y tener
> instalaciones más rápidas y consistentes entre los tres. Documentamos la
> decisión y el cambio en el historial de commits."

### "¿Por qué no reescribieron los commits viejos para que sigan la convención?"
> "Reescribir el historial requiere forzar el push, lo que rompe los
> clones locales de los compañeros. Documentamos la convención en
> `CONTRIBUTING.md` para adoptarla de aquí en adelante, y todos los
> commits desde ese punto sí la siguen."

### "¿Todo el código es 100% funcional?"
> "No al 100%. Somos honestos con eso: 16 de 23 historias de usuario están
> completamente verificadas, 4 más están construidas y probadas a nivel de
> backend pero pendientes de validación manual en la interfaz, y 3 están
> parcialmente implementadas — por ejemplo, el módulo de archivos guarda
> la referencia pero no la subida física del binario todavía. Preferimos
> mostrarles exactamente dónde estamos que inflar el número."

### "¿Qué es el tablero de GitHub Projects?"
> Muéstralo en vivo: las 4 columnas (Backlog/En progreso/Pruebas/Hecho)
> con las 23 tarjetas ya clasificadas. Menciona que hay un script
> (`crear-github-project.sh`) que lo genera automáticamente con GitHub CLI.

### "¿Cómo garantizan que un aprendiz no pueda calificar o administrar usuarios?"
> Demuéstralo en vivo (paso 9 de la demo): intenta la acción prohibida y
> muestra que el sistema la rechaza, no solo que el botón está oculto.

### "¿Qué reglas de negocio implementaron de verdad, no solo documentaron?"
> RN-015 (retroalimentación en comentarios), RN-016 (solo evaluar
> proyectos "En Revisión" — muéstralo fallando y luego funcionando), RN-021
> (notificación automática al programar reunión).

---

## 5. Si algo falla en vivo (plan B)

No entres en pánico ni improvises disculpas largas. Ten esto listo:

1. **Capturas de pantalla** de cada paso de la demo (tómalas la noche
   antes, con todo funcionando).
2. Si un endpoint específico falla en vivo: "Esto lo teníamos probado
   ayer con `curl` contra la API directamente, les muestro esa evidencia" —
   y muestras el log/terminal de las pruebas que ya hicimos.
3. Nunca digas "no sé por qué falla" sin más — di "vamos a revisarlo
   después de la sustentación, mientras les muestro el resto del flujo" y
   sigues con el siguiente punto de la demo.

---

## 6. Reparto sugerido de la palabra (ajústenlo a su equipo)

| Momento | Quién habla | Por qué |
|---|---|---|
| Pitch inicial + arquitectura | Quien más domine el panorama completo | Da contexto antes de entrar en detalle |
| Demo del backend / base de datos / el bug encontrado | Rubiel (Backend/BD) | Es quien más conoce esa capa |
| Demo del frontend / pestañas nuevas | Juan Manuel (Frontend) | Mismo criterio |
| GitHub Projects, commits, documentación | Juan Carlos (QA/Doc) | Coherente con su rol en el equipo |
| Preguntas del profesor | Cualquiera que sepa la respuesta — está bien que se complementen entre ustedes | Muestra trabajo en equipo real, no un show de una sola persona |

---

## 7. Checklist final antes de entrar a sustentar

- [ ] `docker compose up -d` probado la noche anterior, sin errores
- [ ] `pnpm install` corrido en backend y frontend sin errores
- [ ] Login probado con las credenciales exactas que van a usar en vivo
- [ ] El tablero de GitHub Projects abierto en una pestaña, ya con las 23 tarjetas clasificadas
- [ ] Capturas de respaldo tomadas por si falla la conexión a internet o el proyector
- [ ] Cada integrante sabe qué parte le toca explicar
- [ ] Practicaron el flujo completo al menos una vez, cronometrado

---

## 8. Cierre sugerido

> "Les mostramos exactamente dónde estamos: lo que funciona, lo que está
> en pruebas, y lo que queda pendiente con un plan claro para cerrarlo.
> Preferimos ser precisos que optimistas, y todo lo que les mostramos hoy
> lo probamos nosotros mismos antes de traerlo aquí."

Cerrar con honestidad y evidencia genera más confianza en un jurado que
cerrar con una promesa grande sin respaldo.
