# marca-personal-agentes

Sistema de producción de contenido de la marca personal **Valeria Yashan · PM & Strategy**.

Repositorio **privado**. Contiene el hub de generación, los skills canónicos, la documentación del sistema y el contexto operativo.

---

## Qué hay acá

| Ruta | Contenido |
|---|---|
| `hub-marca-personal.html` | Hub unificado **v1.8** — 27 módulos en tres agentes + conexión a Sheets, Canva y Notion |
| `skills/` | **Fuente canónica de los skills.** Toda edición empieza acá |
| `docs/` | Documentación del sistema (ver tabla abajo) |
| `contexto.md` | Perfil, marca y estado del ecosistema |
| `continuidad/` | Archivos de cierre de sesión, uno por fecha |
| `scripts/inicializar-repo.ps1` | Bootstrap del repo en una máquina nueva |

### Documentación

| Documento | Qué resuelve |
|---|---|
| `docs/01-arquitectura.md` | Cómo se relacionan hub, skills y proyecto. Incluye la sección de mantenimiento y desincronización |
| `docs/02-sistema-visual.md` | Las dos capas visuales (redes y web) y las escalas tipográficas por formato |
| `docs/03-reglas-plataforma.md` | LinkedIn, Instagram, YouTube, Substack: reglas algorítmicas vigentes 2026 |
| `docs/04-flujo-canva-mcp.md` | Creación y edición de diseños por MCP, con las restricciones conocidas |
| `docs/05-verificacion.md` | Disciplina de verificación aplicable a todo trabajo técnico |
| `docs/06-que-no-se-publica.md` | Qué queda fuera de cualquier repo público y por qué |

---

## El hub

Tres agentes, 27 módulos:

- **Estrategia** (10) — briefing, calendario, análisis de competidores, revisión semanal, optimización de posts, informe mensual, outreach, kit de speaker, comunidad, bios multiplataforma
- **Producción** (11) — LinkedIn A+B, caption de Instagram, Story, carrusel, guión de video, pack SEO de YouTube, artículo de blog con frontmatter, newsletter, prompts de imagen, Short/Reel, kit de Golden Hour
- **Monetización** (6) — diagnóstico de conversión, pipeline KDP, lanzamientos, outreach institucional, activación de comunidad, seguimiento de prospectos

El tema de la sesión se fija una vez (barra debajo del topbar) y se inyecta automáticamente en el prompt de cada módulo. **Corrección respecto a versiones anteriores de este documento:** los módulos no leen las salidas generadas por los módulos anteriores — solo comparten el mismo tema fijado. El historial de la sesión queda disponible para revisar y exportar (ver más abajo), pero no se re-inyecta automáticamente en generaciones siguientes.

### Chequeo automático de salida

`verificarSalida()` corre después de cada generación, sin llamada adicional a la API. Detecta:
- guión largo (—) usado más de 2 veces
- las 4 frases prohibidas del proyecto
- clichés de IA
- la construcción "no X, sino Y"
- nombres de modelos de IA mencionados sin contexto
- **clientes sin anonimizar** (ej. "YPF" en vez de "empresa petrolera nacional") — lista extensible en `CLIENTES_SIN_ANONIMIZAR`
- cifras sin fuente cercana (detección por oración, no por ventana de caracteres)
- ausencia de relación con el tema fijado de la sesión, si hay uno

Pinta un aviso naranja debajo de la salida. **Avisa, no bloquea.**

### Aviso de calendarización

`chequearCalendarizacion()` compara el día actual (huso `America/Argentina/Buenos_Aires`) contra el horario de marca de cada plataforma (LinkedIn Lun/Mié/Vie, Instagram Mar/Jue/Sáb) y muestra un aviso informativo — no bloqueante — si la pieza generada no corresponde publicarla hoy. Solo aplica a P1, P2, P3 y P4.

### Clave de API y modelo

Campo opcional, solo en memoria del navegador por defecto. Checkbox "recordar en esta pestaña" la guarda en `sessionStorage` (sobrevive a un F5, se pierde al cerrar la pestaña) — nunca en `localStorage`, que persistiría en disco indefinidamente. Sin clave, el hub funciona igual dentro de un artifact de Claude.ai. Con clave, funciona abriendo el HTML directamente.

Selector de modelo (Sonnet 5 / Haiku 4.5), también persistido en `sessionStorage`. Costo estimado por generación y acumulado de la sesión, mostrado en la barra de sesión.

**Nunca hardcodear la clave en el archivo.** Es el mismo riesgo que ya dejó un dato personal en el historial de git del sitio.

### Historial, exportar sesión y pipeline semanal

- **Historial** — últimas 30 generaciones de la sesión, con opción de copiar o volver al módulo.
- **Exportar sesión** — descarga un `.md` con todo lo generado en la sesión, tema fijado y costo total.
- **Pipeline semanal** — un botón corre P1→P2→P3→P4 en secuencia, autocompletando los campos de tema vacíos con el tema fijado de la sesión. Frena con aviso claro si no hay tema fijado.

### Conexión a fuentes externas

El hub **no puede llamar directamente a Canva ni a Notion** — esa autorización vive del lado de la cuenta de Claude.ai, no de una clave de API personal. En su lugar, los módulos visuales (P2, P3, P4, P9) y los que terminan en Notion (calendario mensual, informe mensual, pipeline KDP) tienen un botón **"📋 Para Canva" / "📋 Para Notion"** que copia el contenido envuelto en una instrucción lista para pegar en un chat de Claude con el conector correspondiente conectado.

**Sí puede leer datos publicados como CSV** (fetch directo, sin autenticación): el módulo `sd` (revisión de métricas) combina tres fuentes en un clic —
1. Sheet "Piezas" — una fila por pieza publicada, agregado por plataforma en los últimos 7 días
2. Tracker semanal (`tracker-metricas-valeriayashan`, pestaña "Métricas semanales") — hoja ancha, detecta automáticamente la última semana con datos cargados
3. Search Console (misma hoja, otra pestaña) — top 5 queries por impresiones; CTR y posición se descartan a propósito porque el export usa coma decimal sin comillas y rompe un parseo genérico

Si una fuente falla, las otras dos igual generan diagnóstico — degradación elegante, nunca todo o nada. El módulo `se` (optimizar post con bajo engagement) tiene un botón separado que detecta la pieza de peor `(likes+comentarios+guardados)/alcance` de la semana — el texto del post sigue siendo carga manual, el Sheet no lo tiene.

**Advertencia de privacidad heredada:** estas hojas están publicadas con "Cualquiera con el enlace" — no salen en buscadores pero tampoco requieren login. Evaluar si corresponde restringir en el futuro.

---

## Mantenimiento: el hub y los skills se desincronizan

**El motor del hub es texto puro, sin herramientas.** Sus prompts son extractos manuales de los skills, no lectura en vivo del archivo.

Consecuencias operativas:

1. Cada vez que se modifica un skill, **verificar si el hub necesita el mismo cambio**.
2. Al hub van solo las secciones de **calidad de contenido**: voz, anatomía de hooks, estructura, filtro anti-IA, pools de hashtags, escalas tipográficas.
3. Al hub **nunca** van los flujos de herramienta — MCP de Canva, IDs de Notion, rutas de archivo. No puede ejecutarlos, pero sí puede ofrecer un atajo de copiado hacia ellos (ver arriba).
4. `skills/` de este repo manda. Las copias instaladas en Claude y la copia del proyecto son derivadas y ya quedaron viejas al menos una vez.

**Caso real de este mismo documento:** hasta la v1.5, este README decía que `verificarSalida()` ya detectaba clichés y frases prohibidas — pero el código real no tenía esa función implementada todavía. La documentación describía una intención, no el estado real del archivo. Se corrigió implementando la función de verdad antes de seguir agregando funcionalidad nueva encima de una base que no existía.

---

## Alcance: qué automatiza y qué no

**Automatiza el trabajo interno** — encadenar el pipeline, generar borradores, verificar la salida, traer datos de fuentes publicadas. Eso no cambia la criticidad del sistema.

**No automatiza el acto de publicar**, ni la conexión directa a Canva o Notion (requieren el atajo de copiado + un chat de Claude con el conector activo). Automatizar la publicación llevaría el sistema de riesgo medio a alto y exigiría los cuatro controles completos de gobernanza: permisos mínimos, guardrails en dos capas, human-in-the-loop y ownership. Mientras el hub solo produzca borradores que una persona revisa y publica, no hace falta.

---

## Por qué es privado

- Expone contactos de outreach con nombre y apellido
- Expone la estrategia de monetización y el pipeline KDP
- Son 27 prompts largos: demuestran el resultado, no el criterio de ingeniería

Lo que **debería ir** a un repositorio público es `agentes-pm`: la capa de coordinación anonimizada más la gobernanza. **Estado sin confirmar** — quedó pendiente de reconstrucción luego de perder 45 archivos y 118 tests en una sesión anterior; no hay verificación de que exista una versión actualizada en GitHub. Confirmar antes de asumir que está listo para linkear en cualquier lugar público.

---

## Trabajo local

```powershell
cd C:\Users\rootless\Desktop\marca-personal-agentes
git log --oneline -5
git ls-remote --heads origin
git rev-parse --show-toplevel   # antes de cualquier git add -A
```

**Correo de autor:** `89478965+ValeriaYashan@users.noreply.github.com` (configurado global).

**Nota histórica:** `hub-marca-personal.html` quedó trackeado en este repo por primera vez el 15/08/2026 (commit `d0ec823`, v1.8). Las versiones v1.1 a v1.7 se trabajaron en sesiones de Claude y vivieron solo en descargas locales — nunca llegaron a `git push`. A partir de acá sí hay historial real de versiones para este archivo.

---

## Reglas de trabajo

**Verificar contra el remoto, no contra el reporte.** Un "listo" no confirma nada. Confirmarlo con el conteo del commit, `git diff --shortstat` o un fetch a `raw.githubusercontent.com`.

**Predecir el número antes de actuar.** "Esto debería llevar el conteo de 56 a 46" es falsable; "listo" no lo es.

**Una consulta rara no es una conclusión.** El CDN de GitHub cachea unos minutos. Esperar el TTL o buscar un segundo indicador independiente.

**Una verificación que falla por rate limit, red o permisos es una verificación pendiente, no un resultado.**

**Cuando falla la tercera hipótesis, la salida es hacerlo a mano.**

**Descargar antes de cerrar.** Todo lo que se genera en una sesión de Claude vive en el contenedor y no sobrevive al reinicio. El primer paso del cierre es listar los archivos producidos y descargarlos — antes del archivo de continuidad y antes de Notion.

---

## Restricción de entorno: fetch dentro de un artifact

Los artifacts corren en un iframe sandboxeado y `fetch` se reenvía al padre por `postMessage`, que solo transporta objetos clonables. **`AbortSignal` no lo es.** Pasarlo en las opciones produce `AbortSignal object could not be cloned` y la llamada falla antes de llegar a la red.

Los timeouts se implementan con `Promise.race`, nunca con `AbortController`.

Una prueba con `fetch` simulado en Node no detecta esto: Node no tiene la restricción del sandbox. Para validar código que va a correr en un artifact, el fetch de prueba tiene que rechazar explícitamente cualquier campo no serializable.
