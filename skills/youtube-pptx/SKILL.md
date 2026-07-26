---
name: youtube-pptx
description: >
  Crear presentaciones .pptx para el canal de YouTube de Valeria Yashan (PM & Strategy).
  Paleta de colores oficial PMI · Estilo visual basado en EGCI.
  USAR SIEMPRE que el usuario pida: "presentación para YouTube", "slides para el video",
  "armame el deck del episodio", "deck para el canal", "presentación del canal",
  "slides con paleta PMI", "presentación YouTube", "armame el pptx del video",
  o cuando mencione un tema y quiera slides para grabarlo. También activar cuando diga
  "armame la clase para YouTube", "deck sobre [tema PM/estrategia/IA]" o cualquier
  presentación que no sea para USI, EGCI ni IMR.
---

---

## PROTOCOLO DE PREGUNTAS Y RECOMENDACIONES

### Preguntas de calidad (antes de generar)

| Situación | Pregunta clave | Para qué sirve |
|---|---|---|
| Siempre al inicio | "¿Ya tenés el guión del video o arrancamos desde el tema?" | Sí → importar estructura del guión; No → definir secciones primero |
| Si hay guión | "¿Cuántas secciones tiene el video?" | Define cuántos separadores y slides de contenido generar |
| Si no hay guión | "¿Cuántos puntos principales querés cubrir? (ideal: 3–4)" | Estructura el deck sin guión previo |
| Siempre | "¿El video es para grabar hoy o tenés tiempo?" | Urgente → priorizar slides clave; con tiempo → pack completo |

### Recomendaciones de cierre

Formato fijo: `▶ Próximo paso → [acción] — usá [skill]`

| Qué se entregó | Recomendación |
|---|---|
| Deck completo del video | `▶ Próximo paso → optimizá el título y la descripción — usá youtube-seo con "armame el pack SEO del video de [tema]"` |
| Solo portada + estructura | `▶ Próximo paso → completá las slides de contenido o pasá al guión — usá youtube-script con "escribime el guión del video de [tema]"` |
| Deck listo para grabar | `▶ Próximo paso → grabá el video — al subir, activá youtube-seo para el título, descripción y tags` |

### Conexión con la cadena de producción

Este skill es el eslabón 2 de la cadena semanal:
```
youtube-script → [youtube-pptx] → youtube-seo → linkedin-posts
```
Si el usuario viene de `youtube-script`, ya tiene la estructura — pedirle los títulos de sección y generar directamente.
Si viene de `content-planner`, preguntarle si ya tiene el guión.

---

# YouTube Channel — PPTX Skill

## Contexto del canal

| Campo | Valor |
|-------|-------|
| Canal | Valeria Yashan · PM & Strategy |
| Docente | Prof. Valeria Yashan, PMP® · MBA |
| Pilares | Project Management · Estrategia · IA aplicada |
| Audiencia | PMs, aspirantes PMP, estudiantes, líderes con IA |
| Handle | @ValeriaYashanPM *(confirmar con Valeria si cambia)* |
| Formato | 16:9 · 1920×1080 · Grabación en pantalla |

---

## Design System — Paleta PMI

→ Leer `references/design-system.md` para tokens completos, márgenes, tipografía y reglas de uso.

**Resumen rápido:**

| Token | HEX | Uso |
|-------|-----|-----|
| Navy | `003087` | Fondo portada/sección, bloques fuertes |
| Blue | `0066CC` | Acento principal, headers de columnas |
| Cyan | `00AEEF` | Línea separadora, detalles, CTA |
| Orange | `F7941D` | Etiquetas episodio, highlights, stats |
| Light Gray | `F0F4F8` | Fondo slides de contenido |
| Dark Text | `1A2B4A` | Cuerpo sobre fondo claro |
| Muted | `4A6080` | Subtexto, footers, descripciones |

---

## Tipos de slide y helpers

El builder está en `scripts/build_yt.py`. Ver tabla de helpers abajo.

### Tabla de helpers

| Helper | Slide generada | Cuándo usarla |
|--------|---------------|---------------|
| `COVER(prs, titulo, subtitulo, episodio)` | Portada oscura navy | Siempre primer slide |
| `SDIV(prs, seccion, num_seccion)` | Separador de sección | Entre bloques de contenido |
| `BULLETS(prs, titulo, puntos)` | Lista con bullets PMI | Enumeración de puntos (máx 5) |
| `QUOTE(prs, cita, autor)` | Cita de impacto | Reforzar un concepto clave |
| `DETAIL(prs, titulo, cuerpo)` | Texto libre | Explicación extendida |
| `COMP(prs, titulo, izq_t, izq_c, der_t, der_c)` | 2 columnas comparativas | Contraste / pros-cons |
| `STATS(prs, titulo, stats)` | Tarjetas con números | Datos impactantes (2–4 stats) |
| `THANKS(prs, mensaje, cta)` | Cierre con CTA | Siempre último slide |

---

## Reglas críticas

- ✅ Nunca inventar contenido — usar solo lo que provee Valeria
- ✅ Calibri en todas las fuentes
- ✅ Máx 5 bullets por slide de contenido
- ✅ Footer en todas las slides de contenido — nunca en portada ni separadores
- ✅ QA visual obligatorio antes de entregar
- ❌ Nunca cambiar colores por los de IMR, USI o EGCI
- ❌ Nunca usar fondo crema/beige — fondo claro = F0F4F8
- ❌ Nunca usar color # prefijo en python-pptx — siempre RGBColor(r, g, b)

---

## Estructura del episodio tipo

```
1  COVER     → Título + subtítulo del video
2  BULLETS   → "En este video vas a aprender..."  (agenda)
3  SDIV      → Parte 1: [nombre]
4+ BULLETS / DETAIL / COMP / STATS  → contenido
N  SDIV      → Parte N
N+ contenido
   QUOTE     → Cita de impacto (una por video)
   THANKS    → Cierre con CTA
```
