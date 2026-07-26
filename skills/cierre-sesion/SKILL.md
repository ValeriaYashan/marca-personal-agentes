---
name: cierre-sesion
description: >
  Protocolo de cierre de sesión de trabajo para Valeria Yashan. ACTIVAR SIEMPRE ante:
  "cerramos", "cerramos la sesión", "hasta acá por hoy", "guardamos y cerramos",
  "archivo de continuidad", "actualizá Notion", "registrá el avance", "qué aprendimos hoy",
  "resumí lo de hoy", "archivá la sesión", "siguiente vez que trabajemos en esto",
  "cierre de sesión", "continuidad", o cuando la conversación supere 20 intercambios
  relevantes en un mismo proyecto. También activar cuando Valeria diga "listo por hoy"
  o "seguimos mañana". El skill genera el archivo de continuidad del proyecto trabajado
  y actualiza automáticamente la base de datos Proyectos en Notion con estado, próximo
  hito, observaciones y fecha de última actualización. Nunca omitir la actualización
  de Notion si la conexión MCP está activa.
---

# PROTOCOLO DE CIERRE DE SESIÓN — VY

Ejecutar en este orden exacto. No omitir pasos.

---

## PASO 1 — Identificar proyecto(s) trabajados

Revisar la conversación y determinar:
- ¿Qué proyecto(s) se trabajaron en esta sesión?
- ¿Hubo decisiones importantes, cambios de estado, o nuevos entregables?
- ¿Cambió el próximo hito respecto a lo que estaba en Notion?

Si se trabajaron múltiples proyectos, generar un archivo de continuidad por cada uno y actualizar cada entrada en Notion.

---

## PASO 2 — Generar archivo de continuidad

Usar el formato del `project-continuity-manager` como base. Para cada proyecto trabajado, producir:

```
## CONTINUIDAD — [NOMBRE DEL PROYECTO]
Fecha: [DD/MM/AAAA]

### Estado del proyecto
[1-2 oraciones sobre dónde está el proyecto HOY]

### Decisiones tomadas en esta sesión
[Lista de decisiones concretas — solo las de esta sesión]

### Entregables generados
[Archivos, documentos, bases, slides, scripts producidos hoy]

### Pendientes / Próximos pasos
[Lista ordenada por prioridad]

### Observaciones críticas
[Lo que no debe olvidarse entre sesiones]

### Skills activos
[Skills relevantes para este proyecto]

### IDs y referencias técnicas
[IDs de Notion, Figma, Drive, KDP ASIN, etc. — solo los relevantes]
```

**Reglas del archivo:**
- Máxima densidad, mínima longitud
- Solo lo que cambió o se decidió HOY — no repetir lo que ya está en el skill
- Si hay IDs técnicos nuevos, siempre incluirlos
- Redactar en español, prosa o bullets, sin decoración

---

## PASO 3 — Actualizar Notion

**Base de datos:** `collection://68c7ef36-0b67-45fe-8e68-2491ce51d7f1`
**Dashboard:** `https://app.notion.com/p/38cc3df5efcd8133bbedd9e20b0b56ca`

Para cada proyecto trabajado, actualizar la página correspondiente en Notion con:

| Campo | Qué actualizar |
|---|---|
| `Estado` | Si cambió (Activo / En pausa / Cerrado / Bloqueado) |
| `Próximo hito` | El siguiente paso concreto después de esta sesión |
| `Observaciones` | Resumen denso del estado actual + decisiones clave |
| `Fecha límite` | Solo si se definió o cambió en esta sesión |
| `Última actualización` | SIEMPRE — fecha de hoy en formato YYYY-MM-DD |

**IDs de páginas conocidos** (actualizar si se agregan proyectos):

| Proyecto | Page ID |
|---|---|
| EGCI Máster PM 2026 | `38cc3df5-efcd-81f0-a951-dc76b2001d6d` |
| USI Adm. Estratégica 2026 | `38cc3df5-efcd-8189-b0a5-c2ffc7db8f90` |
| IMR Capacitación PMBOK® 8 | `38cc3df5-efcd-818c-a770-cbc1392b8ce4` |
| PMBOK 8 Explicado Fácil | `38cc3df5-efcd-819c-8dc5-d3222ab70f87` |
| De una Semana a Dos Horas | `38cc3df5-efcd-812a-9078-ddcdd4eab23b` |
| Miss Eloise Libro 1 | `38cc3df5-efcd-81f0-9fec-d0ad95121512` |
| Marca Personal — PM & Strategy | `38cc3df5-efcd-81f7-9e86-f2c599f22ef1` |
| Alfacart | `38cc3df5-efcd-811c-9095-e3b99c9b0114` |
| Búsqueda laboral | `38cc3df5-efcd-815e-a38e-e68a355dfa8a` |
| Workana — Freelance | `38cc3df5-efcd-816b-b9a2-ee26f6c4aa36` |
| Extensión USI | `38cc3df5-efcd-8154-a509-f755cce0af95` |
| Dashboard Notion | `38cc3df5-efcd-81c9-92c5-f3576eda2e42` |

**Si se crea un proyecto nuevo en la sesión:** agregar su page ID a esta tabla en el skill.

---

## PASO 4 — Proponer aprendizajes para memoria o skill

Al finalizar, proponer 1–2 aprendizajes clave de la sesión con este formato:

```
APRENDIZAJES DE HOY — para memoria o skill:
1. [Decisión / criterio / patrón que vale la pena preservar]
2. [Opcional — segundo aprendizaje si es relevante]

¿Los agrego a memoria o a algún skill?
```

Valeria aprueba o ajusta. Si aprueba, ejecutar con `memory_user_edits` o editar el skill correspondiente.

---

## REGLAS GENERALES

- Nunca omitir la actualización de Notion si el MCP está activo
- Si Notion falla, avisar y entregar el archivo de continuidad igualmente
- No pedir confirmación antes de generar el archivo — generarlo y luego preguntar si hay algo que ajustar
- Si la sesión fue corta o no hubo cambios relevantes, decirlo explícitamente en lugar de generar un archivo vacío
- El archivo de continuidad va en la conversación (en chat), no como archivo descargable, salvo que Valeria lo pida

---

## ACTIVACIÓN AUTOMÁTICA POR EXTENSIÓN

Si la conversación supera 20 intercambios sobre un mismo proyecto sin que Valeria haya pedido cierre, avisar:

```
Esta sesión ya tiene [N] intercambios sobre [proyecto].
Te propongo generar el archivo de continuidad y actualizar Notion antes de seguir.
¿Cerramos esta parte y abrimos un nuevo chat?
```
