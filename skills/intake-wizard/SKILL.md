---
name: intake-wizard
description: >
  Cuestionario conversacional que guía a Valeria Yashan por las preguntas necesarias
  para ejecutar cualquier módulo de los 3 agentes (Estrategia, Producción, Monetización).
  ACTIVAR cuando el usuario indique qué quiere producir pero no haya dado todos los inputs
  necesarios. Claude detecta el módulo por lo que escribe y hace solo las preguntas de ese
  módulo, en orden de mayor a menor impacto, una por vez. Si el usuario no responde alguna,
  usar el default inteligente del perfil y continuar.
  Activar ante: "quiero el post", "arrancamos", "pipeline para", "briefing de hoy",
  "módulo X", "generame el guión", "caption para IG", "SEO del video", "newsletter",
  "carrusel", "storie", "short", "golden hour", "diagnóstico", "KDP", "lanzamiento",
  "outreach", "prospecto", "comunidad", "bio", "speaker", "informe", "competidores",
  o cualquier pedido de contenido sin inputs completos.
  NO activar si el usuario ya dio todos los inputs necesarios en el mismo mensaje —
  en ese caso ejecutar directamente sin preguntar.
---

# Intake Wizard — Valeria Yashan · Hub de Agentes

## Principio de funcionamiento

Claude detecta el módulo por lo que escribe el usuario y hace **una pregunta por vez**,
en orden de mayor a menor impacto para ese módulo específico.
Si una pregunta no es respondida o el usuario dice "lo que convenga" / "el default",
Claude aplica el valor por defecto del perfil y avanza.
Cuando tiene suficiente para generar un output de calidad, ejecuta sin preguntar más.

---

## Perfil base (siempre disponible, no preguntar)

```
Nombre: Valeria Yashan
Título: Project Manager · PMP® (PMI #1613335) · MBA (UCEMA) · Ing. Industrial (UNLP)
Experiencia: 10+ años en energía, fintech y tecnología
Rol actual: PM en IMR Consulting (cliente YPF)
Docente: Administración Estratégica (USI) · Máster PM (EGCI)
YouTube: @ValeriaYashanPM
LinkedIn: linkedin.com/in/valeriayashan/
Substack: valeriayashanpm.substack.com
Web: valeriayashan.com.ar
Libros: Serie PMP 2026 (3 vol.) + PM MOM — Amazon KDP
Pilares: PM · Estrategia · IA aplicada · Liderazgo · Carrera
Audiencia: PMs hispanohablantes, aspirantes PMP, líderes LATAM
Voz: Directa, consultiva, sin frases huecas
Horarios: LinkedIn L/M/V 8:30am · Instagram M/J/S 19:00
```

---

## Detección de módulo

| Si el usuario menciona... | Módulo |
|---|---|
| "post LinkedIn", "posteo", "LinkedIn" | P1 — Post LinkedIn |
| "caption", "Instagram", "IG", "feed" | P2 — Caption Instagram |
| "storie", "story", "historia" | P3 — Storie HTML |
| "carrusel", "carousel", "slides LinkedIn" | P4 — Carrusel LinkedIn |
| "guión", "script", "video", "qué digo" | P5 — Guión video |
| "SEO", "título YouTube", "descripción YT", "tags" | P6 — Pack SEO YouTube |
| "blog", "artículo", "Astro" | P7 — Artículo blog |
| "newsletter", "Substack", "edición" | P8 — Newsletter Substack |
| "prompt imagen", "thumbnail", "hero" | P9 — Prompts imagen |
| "short", "reel", "60 segundos", "vertical" | P10 — Short/Reel |
| "golden hour", "primer comentario", "comentarios del post" | P11 — Golden Hour |
| "briefing", "qué publico", "tema de la semana" | SA — Briefing semanal |
| "calendario", "plan del mes", "qué publico este mes" | SB — Calendario mensual |
| "competidores", "referentes", "benchmarking" | SC — Análisis competidores |
| "métricas", "cómo me fue", "revisión semanal" | SD — Revisión métricas |
| "optimizar post", "post que no funcionó", "bajo engagement" | SE — Optimizar post |
| "informe mensual", "cierre del mes", "ROI" | SF — Informe mensual |
| "outreach LinkedIn", "comentar post ajeno", "DM" | SG — Outreach LinkedIn |
| "speaker", "ponente", "evento", "charla" | SH — Kit speaker |
| "responder comentario", "bienvenida Substack", "WhatsApp grupo" | SI — Comunidad |
| "bio", "presentación profesional", "cómo me presento" | SJ — Bio multiplataforma |
| "conversión", "funnel", "dónde se corta" | MA — Diagnóstico conversión |
| "KDP", "Amazon", "ventas libros", "reviews" | MB — Pipeline KDP |
| "lanzamiento", "nuevo producto", "countdown" | MC — Lanzamiento producto |
| "ATP", "universidad", "edtech", "instituto" | MD — Outreach institucional |
| "comunidad", "WhatsApp PM", "200 suscriptores" | ME — Activación comunidad |
| "prospecto", "lead", "consultoría", "seguimiento" | MF — Seguimiento prospectos |

---

## Flujos de preguntas por módulo

### P1 — Post LinkedIn
1. **¿Cuál es el tema o idea central?** *(obligatoria)*
2. ¿Qué tipo de post? `[Valor educativo / Opinión contrarian / Historia real / Promoción / Amplificación de video]` — *default: Valor educativo*
3. ¿Pilar? `[PM / Estrategia / IA / Liderazgo / Carrera]` — *inferir del tema si es obvio*
4. ¿Mencionamos @IMR Consulting? `[Sí / No / Evaluar]` — *default: Evaluar*
5. ¿Link de destino? — *default: valeriayashan.com.ar según el tema*
→ Con 1 y 2 ya se puede generar. 3-5 mejoran el output.

### P2 — Caption Instagram
1. **¿Cuál es el tema?** *(obligatoria)*
2. ¿Formato visual? `[Post feed / Reel / Video corto]` — *default: Post feed*
3. ¿Pilar? — *inferir del tema*
4. ¿Link de destino? — *default: página relevante de valeriayashan.com.ar*
→ Con 1 ya se puede generar. Siempre incluir 3 hooks alternativos.

### P3 — Storie HTML
1. **¿Qué comunicás en la storie?** *(obligatoria)*
2. ¿Tipo? `[Anuncio video / Teaser post / CTA Substack / Behind the scenes / Encuesta]` — *default: Anuncio video*
3. ¿Fondo? `[Navy / Gris claro / Blue]` — *default: Navy*
→ Con 1 ya se puede generar.

### P4 — Carrusel LinkedIn
1. **¿Cuál es el tema?** *(obligatoria)*
2. ¿Pilar? — *inferir del tema*
3. ¿CTA del último slide? `[Guardar / Substack / YouTube / Consultar / Libro]` — *default: Guardar*
→ Con 1 ya se puede generar.

### P5 — Guión video
1. **¿Cuál es el título o tema del episodio?** *(obligatoria)*
2. ¿Qué puntos clave tiene que cubrir? — *si no responde, Claude estructura según el tema*
3. ¿Pilar? — *inferir del tema*
4. ¿Bridge al próximo episodio? ¿De qué pilar? — *default: IA aplicada*
→ Con 1 ya se puede generar.

### P6 — Pack SEO YouTube
1. **¿Cuál es el título de trabajo del video?** *(obligatoria)*
2. ¿De qué trata el video? (puntos cubiertos) — *si no responde, inferir del título*
3. ¿Playlist? `[PMP 2026 / IA aplicada / Gestión Real / Estrategia y Liderazgo]` — *inferir del tema*
4. ¿Duración aproximada? — *default: 10 minutos*
→ Con 1 ya se puede generar.

### P7 — Artículo blog Astro
1. **¿Cuál es el tema o título del artículo?** *(obligatoria)*
2. ¿Keyword principal? — *inferir del tema si no responde*
3. ¿Fecha de publicación? — *default: hoy en formato YYYY-MM-DD*
4. ¿Slug (URL)? — *default: generar desde el título*
→ Con 1 ya se puede generar.

### P8 — Newsletter Substack
1. **¿Cuál es el tema de esta edición?** *(obligatoria)*
2. ¿Qué puntos cubre? — *si no responde, Claude estructura según el tema*
3. ¿Número de edición? — *default: omitir si no se sabe*
4. ¿Hay un video relacionado? — *default: ninguno*
→ Con 1 ya se puede generar.

### P9 — Prompts imagen
1. **¿Qué tema visual querés representar?** *(obligatoria)*
2. ¿Herramienta? `[DALL-E / Ideogram / Firefly / Midjourney]` — *default: DALL-E*
3. ¿Estilo? `[Profesional minimalista / Bold tipografía / Ilustración plana / Fotorrealista]` — *default: Profesional minimalista*
→ Con 1 ya se puede generar.

### P10 — Short/Reel
1. **¿Cuál es la idea o aprendizaje a compartir?** *(obligatoria)*
2. ¿Pilar? — *inferir del tema*
3. ¿CTA al final? — *default: Seguir en YouTube para el video completo*
→ Con 1 ya se puede generar.

### P11 — Golden Hour
1. **¿Cuál es el tema del post que publicaste?** *(obligatoria)*
2. ¿Qué link va en el primer comentario? — *default: preguntar si no es obvio*
3. ¿Qué tipo de comentarios esperás recibir? — *default: Claude infiere del tema*
→ Con 1 y 2 ya se puede generar.

### SA — Briefing semanal
1. ¿Hay algún tema o pilar que querés evitar esta semana? — *default: ninguno*
2. ¿Hay algún pilar que querés priorizar? — *default: el que lleve más tiempo sin aparecer*
3. ¿Formato preferido esta semana? — *default: sin preferencia*
→ Se puede generar directamente sin preguntas si el usuario no especifica nada.

### SB — Calendario mensual
1. **¿Qué mes planificamos?** *(obligatoria)*
2. ¿Hay semanas con restricciones (viajes, eventos, exámenes)? — *default: ninguna*
3. ¿Temas a evitar este mes? — *default: los cubiertos el mes anterior*
→ Con 1 ya se puede generar.

### SC — Análisis competidores
1. **¿A quién analizamos?** *(obligatoria — nombre o perfil)*
2. ¿Qué plataforma o contenido específico querés comparar? — *default: presencia general*
→ Con 1 ya se puede generar.

### SD — Revisión métricas
1. ¿Tenés métricas para pegar? `[Sí / No]`
   - Si sí: pedirlas
   - Si no: generar diagnóstico baseline con recomendaciones generales
→ Funciona con o sin datos.

### SE — Optimizar post
1. **Pegá el post que no funcionó.** *(obligatoria)*
2. ¿Tenés métricas de ese post? — *default: sin datos, hacer diagnóstico cualitativo*
→ Con 1 ya se puede generar.

### SF — Informe mensual
1. **¿Qué mes cerramos?** *(obligatoria)*
2. ¿Tenés datos del mes para pegar? — *default: generar estructura vacía con preguntas guía*
→ Con 1 ya se puede generar.

### SG — Outreach LinkedIn
1. **¿Cuál es el contexto?** (pegá el post ajeno, o describí la situación) *(obligatoria)*
2. ¿Tipo? `[Comentar post / DM / Responder comentario propio / Invitar a conectar]` — *inferir del contexto*
3. ¿Objetivo? `[Visibilidad / Networking / Lead / Docencia / Colaboración]` — *default: Visibilidad*
→ Con 1 ya se puede generar.

### SH — Kit speaker
1. **¿Cuál es el evento y el tema propuesto?** *(obligatoria)*
2. ¿Duración disponible? — *default: 45 minutos*
3. ¿Audiencia del evento? — *default: profesionales PM*
→ Con 1 ya se puede generar.

### SI — Comunidad/Comentarios
1. **¿Cuál es el contexto?** (pegá el comentario, o describí la situación) *(obligatoria)*
2. ¿Tipo? `[Responder comentario / Bienvenida Substack / Publicación WhatsApp / DM seguidor]` — *inferir del contexto*
→ Con 1 ya se puede generar.

### SJ — Bio multiplataforma
1. ¿Para qué plataforma o contexto? `[LinkedIn titular / LinkedIn sobre mí / YouTube / Instagram / Speaker / Workana / Website / Firma email / Todas]` *(obligatoria)*
2. ¿Hay algún énfasis especial? — *default: ninguno*
→ Con 1 ya se puede generar.

### MA — Diagnóstico conversión
1. ¿Tenés métricas para pegar? — *default: diagnóstico general sin datos*
2. ¿Foco? `[General / Substack / Amazon / Leads consultoría]` — *default: General*
→ Funciona con o sin datos.

### MB — Pipeline KDP
1. ¿Tenés datos de ventas esta semana? — *default: análisis sin datos*
2. ¿Libro en foco? `[Todos / Vol.1 / Vol.2 / Vol.3 / PM MOM]` — *default: Todos*
3. ¿Qué querés trabajar? `[Diagnóstico / Precio / Reviews / A+ Content / Descripción HTML]` — *default: Diagnóstico*
→ Funciona con o sin datos.

### MC — Lanzamiento producto
1. **¿Qué producto lanzamos?** *(obligatoria)*
2. ¿Tipo? `[Libro / Curso / Servicio / Lead magnet / Webinar]`
3. ¿Fecha de lanzamiento? — *default: por definir*
4. ¿Propuesta de valor? (precio, problema que resuelve, para quién)
5. ¿Qué piezas necesitás? `[Secuencia completa / Email / Posts countdown / Página / CTAs]` — *default: Secuencia completa*
→ Con 1 y 2 ya se puede generar.

### MD — Outreach institucional
1. **¿Cuál es la institución y qué sabés de ella?** *(obligatoria)*
2. ¿Tipo de propuesta? `[Docencia / Taller / Consultoría PMO / Contenido / Speaker]`
3. ¿Etapa? `[Primer contacto / Follow-up / Propuesta formal / Negociación]` — *default: Primer contacto*
4. ¿Hay contexto adicional? (referido, competencia, convocatoria abierta) — *default: ninguno*
→ Con 1 y 2 ya se puede generar.

### ME — Activación comunidad
1. ¿Cuántos suscriptores tiene Substack ahora? — *default: sin dato*
2. ¿Qué necesitás? `[Precalentamiento / Anuncio LinkedIn / Bienvenida / Primeras publicaciones / Reglas / Kit completo]`
→ Con 2 ya se puede generar.

### MF — Seguimiento prospectos
1. **¿Quién es el prospecto y cómo llegó?** *(obligatoria)*
2. ¿Estado? `[Nuevo / Respondió / Tuvimos reunión / Esperando propuesta / Se enfrió / Negociando]`
3. ¿Servicio de interés? `[PMO / Capacitación / Proyecto puntual / Mentoring / Sin definir]`
4. ¿Qué generar? `[Follow-up / Propuesta ejecutiva / Caso de éxito / Mensaje de cierre / Diagnóstico]` — *default: Follow-up*
→ Con 1 y 2 ya se puede generar.

---

## Reglas de comportamiento

### Una pregunta por vez
Nunca hacer más de una pregunta en el mismo mensaje. Esperar la respuesta antes de continuar.

### Inferir antes de preguntar
Si el tema hace obvia la respuesta (ej: "guión sobre PMP 2026" → pilar PM, playlist PMP 2026), no preguntar — aplicar directamente y aclararlo al generar.

### Default inteligente
Si el usuario dice "lo que convenga", "el default", "vos elegí" o no responde una pregunta opcional, aplicar el valor por defecto del perfil sin volver a preguntar.

### Ejecutar cuando hay suficiente
No esperar tener todos los inputs posibles. Con los obligatorios y 1-2 opcionales relevantes, generar. La calidad del output con buenos defaults supera la fricción de más preguntas.

### Confirmación de módulo
Si hay ambigüedad sobre qué módulo activar, decirlo en una línea y preguntar. Ej: *"¿Querés el guión del video o el pack SEO para subirlo?"*

### Pipeline completo
Si el usuario pide "el pipeline completo" o "las 11 piezas", ejecutar P1 a P11 en orden haciendo las preguntas del tema primero (1-2 preguntas comunes a todas las piezas) y luego generando cada pieza secuencialmente, confirmando entre piezas si el usuario quiere continuar o ajustar algo.

---

## Comandos rápidos reconocidos

```
pipeline para: [tema]          → P1 a P11 completo
módulo [letra/número]: [input] → módulo específico directo
briefing hoy                   → SA sin preguntas
diagnóstico conversión         → MA sin preguntas
cierre KDP                     → MB diagnóstico semanal
```
