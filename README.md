# Marca Personal · PM & Strategy — Sistema de agentes

Repositorio **privado**. Versiona el sistema operativo de contenido de Valeria Yashan (PMP® #1613335): el hub de 27 módulos, los skills que lo alimentan y las reglas de marca que hacen que la salida sea publicable sin retoques.

> **Este repo no se hace público.** Contiene contactos de outreach con nombre y apellido, la estrategia de monetización y el pipeline KDP. Lo que sí va a un repo público es otra cosa —ver [`docs/06-que-no-se-publica.md`](docs/06-que-no-se-publica.md).

---

## Por qué existe

El 24/07/2026 se generó un repositorio de 45 archivos con 118 pruebas. No se descargó. Al día siguiente ya no existía: los archivos que produce el asistente viven en un contenedor efímero y no sobreviven al reinicio de sesión. Se perdió una sesión entera de trabajo.

Este repo es la respuesta a eso. Todo lo que cuesta más de una hora de reconstruir vive acá, con historia de cambios, y no en un contenedor ni en un solo archivo suelto del escritorio.

Segundo motivo, menos dramático pero más cotidiano: el hub y los skills se editan seguido. Sin control de versiones no hay forma de saber qué cambió entre la versión que funcionaba y la que empezó a devolver texto raro.

---

## Ownership

**Dueña del sistema: Valeria Yashan.** Responde por todo lo que el hub produce y se
publica bajo su firma. No hay responsabilidad compartida ni difusa: quien despliega
responde, y los términos de servicio de cualquier proveedor de modelos excluyen
responsabilidad por las salidas.

**Revisión: trimestral.** Próxima con fecha — **octubre de 2026**. Un hub que
funcionó tres meses no es un hub aprobado para siempre. En cada revisión se chequea
que las constantes sigan al día (perfil, slugs del blog, horarios, reglas de
plataforma) y que las reglas de algoritmo no hayan quedado obsoletas.

**Apagado:** el hub no ejecuta nada. Dejar de usarlo es dejar de abrirlo. No hay
proceso que detener ni credencial que revocar.

### El control humano es el control principal

Que Valeria copie y pegue a mano **no es una limitación del hub: es su control de
seguridad principal**, y está así por diseño. Nada de lo que sale se publica sin
leerse completo.

Esto importa el día que alguien proponga conectarlo a LinkedIn o a Canva para que
publique solo. Ese cambio salta la criticidad del sistema de media a alta y exige
los cuatro controles completos —permisos mínimos, guardrails en dos capas,
aprobación por acción y ownership—, no solo este documento. No es una mejora
incremental: es otro sistema.

**Módulos que reciben texto de terceros y se leen con atención específica:** análisis
de competidores, optimización de post, gestión de comentarios y revisión de métricas.
Todos piden pegar contenido ajeno, que entra al prompt sin sanitizar. Un post con
instrucciones dirigidas al modelo puede desviar la salida, y el único filtro es la
lectura previa a publicar.

---

## Estructura

```
├── hub/
│   └── hub-marca-personal.html      Los 27 módulos en un solo archivo
├── skills/                          13 skills operativos
├── docs/
│   ├── 01-arquitectura.md           Cómo está armado y cómo se ejecuta
│   ├── 02-sistema-visual.md         Las dos capas visuales
│   ├── 03-reglas-de-plataforma.md   LinkedIn · Instagram · YouTube · Substack
│   ├── 04-flujo-canva-mcp.md        El flujo confirmado, y las trampas
│   ├── 05-verificacion.md           Siete reglas, cada una con su caso real
│   └── 06-que-no-se-publica.md      Límite entre este repo y el público
├── contexto/                        Handoff del sitio, guía visual, benchmarking
├── continuidad/                     Archivos de cierre de sesión, por fecha
└── scripts/
    └── inicializar-repo.ps1         Primer commit, con los chequeos de seguridad
```

---

## Cómo se usa el hub

El botón *Generar* de cada módulo hace un `fetch` a `api.anthropic.com` **sin pasar clave**. Eso funciona únicamente cuando el HTML está renderizado como artifact dentro de Claude. Abierto con doble clic desde el escritorio, la interfaz se ve completa y el botón devuelve *"Revisá la API key"*. No está roto: está diseñado así.

De ahí salen dos modos.

**Modo A — el hub como aplicación.** Renderizado como artifact. Completás el formulario, apretás Generar, copiás. Sirve para texto puro: post de LinkedIn A+B, caption, guión, pack SEO, newsletter, outreach. El motor interno es un modelo aislado: no tiene los skills de este repo, ni acceso a Canva, Notion o el repositorio del sitio.

**Modo B — el hub como formulario de entrada.** Abrís el módulo, leés qué campos pide, los pasás al chat. Ahí la ejecución tiene todo el contexto encima: escala tipográfica, flujo MCP de Canva, capa web vs. capa redes, Notion. Es el modo obligado para carrusel, storie, post de feed y artículo del blog.

### Sesión encadenada

El panel Home tiene el control de sesión. Se fija el tema de la semana una vez y las
11 piezas se generan encadenadas: cada una recibe el tema más un extracto de las
piezas anteriores, con la instrucción de sostener el mismo ángulo y no repetir el
hook. Sin eso, cada módulo era una llamada aislada y el ángulo derivaba entre el post
de LinkedIn y el newsletter del mismo episodio.

El botón *Generar las 11 piezas* corre el pipeline completo de forma secuencial, con
progreso y botón de detener. Si alguna falla, lo informa al terminar y se reintenta
desde su panel.

**La sesión vive en memoria y se pierde al recargar.** Es deliberado: sin
almacenamiento del navegador no hay estado viejo que contamine una semana nueva.

### Ritual del lunes

1. **Estrategia · Módulo D** — revisión de métricas (Search Console + tracker)
2. **Estrategia · Módulo A** — briefing semanal, de donde sale el tema
3. **Producción** — las 11 piezas sobre ese tema, cerrando siempre con el mockup visual
4. **Monetización · Módulo A** — diagnóstico de conversión, si corresponde

---

## Los 27 módulos

**Estrategia (10)** — briefing semanal · calendario mensual · análisis de competidores · revisión de métricas · optimización de post · informe mensual · outreach LinkedIn · kit speaker · comunidad y comentarios · bio multiplataforma

**Producción (11)** — post LinkedIn A+B · caption Instagram · storie · carrusel LinkedIn · guión de video · pack SEO YouTube · artículo del blog · newsletter Substack · prompts de imagen · short/reel · golden hour

**Monetización (6)** — diagnóstico de conversión · pipeline KDP · lanzamiento de producto · outreach institucional · activación de comunidad · seguimiento de prospectos

---

## Skills incluidos

| Skill | Qué resuelve |
|---|---|
| `content-planner` | Calendario mensual y semanal, un tema por semana |
| `linkedin-posts` | Posts A+B, carruseles, escala tipográfica |
| `linkedin-comments` | Comentarios estratégicos en posts ajenos |
| `instagram-posts` | Captions y especificaciones visuales de feed |
| `storie-template` | Stories 1080×1920 vía Canva |
| `youtube-script` | Guión completo con interrupciones de patrón |
| `youtube-seo` | Título, descripción, tags, capítulos, thumbnail |
| `youtube-pptx` | Slides del episodio, paleta PMI 16:9 |
| `bio-multiplataforma` | Bio por plataforma y por contexto |
| `intake-wizard` | Cuestionario de entrada para los 27 módulos |
| `portadas-amazon` | Concepto, prompt y specs de portada KDP |
| `kdp-publicacion` | Maquetación, subida y estrategia de venta |
| `cierre-sesion` | Continuidad + actualización de Notion |

Quedan afuera a propósito los skills de otros dominios que tienen su propio contexto y no comparten reglas de marca con este sistema.

**`skills/` es la fuente canónica.** Al armar este repo se compararon los archivos instalados contra las copias sueltas que había en el proyecto: `linkedin-posts` e `intake-wizard` coinciden byte a byte, pero **la copia de `instagram-posts` del proyecto está desactualizada** — le falta el bloque completo de *Especificaciones visuales* (escala tipográfica, las tres reglas que más se rompen, zona segura, edición de diseños ya publicados y checklist de entrega). Conviene reemplazarla en el proyecto por la versión de `skills/instagram-posts/SKILL.md` para que dejen de divergir.

---

## Antes del primer commit

Hay un `.git` suelto en `C:\Users\rootless` —un commit, un archivo— que ya provocó dos veces que se stageara la carpeta de usuario entera. El script `scripts/inicializar-repo.ps1` verifica que no estés dentro de otro repositorio antes de tocar nada, pero conviene neutralizarlo igual:

```powershell
Rename-Item C:\Users\rootless\.git .git-desactivado
Test-Path C:\Users\rootless\.git    # tiene que devolver False
```

---

*Última actualización: 25 de julio de 2026*
