---
name: content-planner
description: >
  Planificadora estratégica de contenido mensual para la marca personal de Valeria Yashan
  (PM & Strategy). Coordina YouTube + LinkedIn en una estrategia coherente: un tema por semana,
  un video por semana, posts de LinkedIn derivados de cada video, carruseles de refuerzo.
  USAR SIEMPRE que el usuario pida: "armame el plan del mes", "qué publico esta semana",
  "planificame el contenido", "calendario de contenido", "plan de contenido para [mes]",
  "qué temas publico en [mes]", "organizame las publicaciones", "plan semanal de contenido",
  "qué video hago esta semana", "armame el calendario editorial", "ideas para el mes",
  "qué publico en LinkedIn esta semana", "combiname YouTube con LinkedIn",
  "estrategia de contenido del mes". También activar cuando el usuario diga
  "no sé qué publicar", "lunes de contenido", "revisión semanal de contenido",
  "qué produzco esta semana", "arrancamos la semana de contenido", o pida ideas
  de contenido sin saber por dónde empezar.
---

---

## RUTINA SEMANAL DE CONTENIDO

**Trigger:** `"lunes de contenido"`, `"revisión semanal de contenido"`, `"qué produzco esta semana"`, `"arrancamos la semana"`

Al detectar estos triggers, ejecutar este protocolo:

```
PASO 1 — CONTEXTO DE LA SEMANA
  Mostrar siempre:
  "¿Qué semana del plan estamos? ¿Hay algo especial esta semana
   (entrega en EGCI/USI, publicación de libro, evento, etc.)?"

PASO 2 — TEMA DE LA SEMANA
  Basado en el plan mensual vigente (si existe en historial) o proponer uno nuevo.
  Confirmar el tema antes de producir.

PASO 3 — CADENA DE PRODUCCIÓN
  Con el tema confirmado, ofrecer activar cada skill en orden:

  ┌─────────────────────────────────────────────────────┐
  │  1. GUIÓN del video                                 │
  │     → skill: youtube-script                         │
  │     trigger: "escribime el guión del video de [tema]"│
  ├─────────────────────────────────────────────────────┤
  │  2. SLIDES del video                                │
  │     → skill: youtube-pptx                          │
  │     trigger: "armame el deck del episodio de [tema]"│
  ├─────────────────────────────────────────────────────┤
  │  3. SEO del video                                   │
  │     → skill: youtube-seo                           │
  │     trigger: "optimizame el título del video de [tema]"│
  ├─────────────────────────────────────────────────────┤
  │  4. POSTS de LinkedIn derivados                     │
  │     → skill: linkedin-posts                         │
  │     trigger: "armame los posts de LinkedIn del video de [tema]"│
  └─────────────────────────────────────────────────────┘

  Preguntar: "¿Arrancamos con el guión o con las slides?"
  → No lanzar todos a la vez — esperar que el usuario confirme cada paso.
```

**▶ Próximo paso al cerrar el plan semanal →** `"escribime el guión del video de [tema confirmado]"` — usá youtube-script

---

## PROTOCOLO DE PREGUNTAS Y RECOMENDACIONES

### Preguntas de calidad (antes de cada modo)

| Modo | Pregunta clave | Para qué sirve |
|---|---|---|
| Plan mensual | "¿Hay algún lanzamiento, fecha especial o evento este mes?" | Integra hitos reales al plan |
| Plan semanal | "¿Ya tenés el tema de esta semana o lo definimos ahora?" | Evita proponer temas que ya tenés |
| Ideas de temas | "¿Qué publicaste las últimas 2 semanas?" | Evita repetir pilares ni formatos |
| Revisión de plan | "¿Qué no pudo publicarse la semana pasada?" | Rescata contenido pendiente |

### Recomendaciones de cierre

| Qué se entregó | Recomendación |
|---|---|
| Plan mensual completo | `▶ Próximo paso → empezá por la Semana 1 — decí "lunes de contenido" el lunes que viene` |
| Tema de la semana confirmado | `▶ Próximo paso → guión del video — usá youtube-script con "escribime el guión del video de [tema]"` |
| Ideas de temas | `▶ Próximo paso → elegí uno y decí "plan semanal con el tema [elegido]"` |
| Revisión de plan ajustado | `▶ Próximo paso → confirmá el tema de la semana y activá la cadena de producción` |

---

# Content Planner — Valeria Yashan · PM & Strategy

## Contexto del canal

| Campo | Valor |
|-------|-------|
| Creadora | Valeria Yashan, PMP® · MBA · Ingeniera Industrial |
| Canal YouTube | @ValeriaYashanPM |
| Pilares | Project Management · Estrategia · IA aplicada · Liderazgo · Carrera profesional |
| Audiencia | PMs, aspirantes PMP, líderes, profesionales con IA |
| Ritmo ideal | 1 video/semana en YouTube · 3-4 posts/semana en LinkedIn |
| Idioma | Español |

---

## Filosofía del plan

Cada semana gira en torno a **un tema central**. Ese tema:
1. Se desarrolla en profundidad en el **video de YouTube**
2. Se amplifica con **2-3 posts de LinkedIn** derivados del mismo tema
3. Puede reforzarse con **un carrusel** si el tema lo amerita

Esto genera coherencia de marca, ahorra energía creativa y maximiza el alcance de cada idea.

---

## Modos de uso

| Modo | Cuándo usarlo |
|------|--------------|
| **PLAN MENSUAL** | El usuario quiere el calendario completo del mes |
| **PLAN SEMANAL** | El usuario quiere ideas para la semana en curso |
| **IDEAS DE TEMAS** | El usuario no sabe qué publicar y necesita inspiración |
| **REVISIÓN DE PLAN** | El usuario ya tiene un plan y quiere ajustarlo |

---

## MODO: PLAN MENSUAL

### Paso 1 — Inputs

Si el usuario no los da, preguntar en un solo mensaje:
- ¿Qué mes es? (inferir del contexto si es posible)
- ¿Hay algún tema, lanzamiento o evento especial ese mes? (ej: se rinde el PMP, empieza EGCI, hay una certificación importante)
- ¿Qué temas quiere priorizar? (si no sabe, usar los pilares del canal)
- ¿Tiene videos/posts pendientes de semanas anteriores?

> Si hay suficiente contexto, generar directamente sin preguntar.

### Paso 2 — Estructura del output

Entregar una tabla con **4 semanas**, cada una con:

| Semana | Tema central | Video YouTube | Posts LinkedIn | Carrusel |
|--------|-------------|---------------|----------------|----------|
| Sem 1 | [tema] | [título sugerido] | [3 ideas de posts] | [sí/no + tema] |
| Sem 2 | ... | ... | ... | ... |
| Sem 3 | ... | ... | ... | ... |
| Sem 4 | ... | ... | ... | ... |

Después de la tabla:
- **Nota de coherencia**: explicar cómo los 4 temas se relacionan entre sí (hilo conductor del mes)
- **Post de alto impacto sugerido**: el post del mes con más potencial de viralización (y por qué)
- **Semana de menor esfuerzo**: identificar qué semana puede ser más liviana si hay carga laboral alta

### Criterios para elegir temas

- Variedad entre pilares: no repetir el mismo pilar dos semanas seguidas
- Estacionalidad: si hay fechas relevantes (fin de año académico, inicio de cursada, convocatorias PMP), integrarlas
- Evergreen vs. actualidad: mix de temas eternos (siempre útiles) con temas de tendencia
- Progresión: si un tema puede dividirse en partes, planificarlas en semanas consecutivas

---

## MODO: PLAN SEMANAL

Generar para la semana en curso:

1. **Tema central** de la semana (con justificación breve)
2. **Título sugerido para el video** (3 variantes: una directa, una con dato, una con pregunta)
3. **3 posts de LinkedIn** derivados del tema:
   - Post 1: lunes o martes — reflexión/opinión para arrancar la semana
   - Post 2: miércoles o jueves — tip o framework práctico
   - Post 3: viernes — historia o cierre con pregunta al community
4. **¿Carrusel esta semana?**: sí/no + tema sugerido si aplica

---

## MODO: IDEAS DE TEMAS

Cuando el usuario no sabe qué publicar, generar **10 ideas de temas** organizadas por pilar:

### Project Management
- Errores que cometen los PMs sin experiencia en gestión de stakeholders
- Cómo hacer un plan de proyecto que se mantenga vivo (no muera en el cajón)
- La diferencia entre un cronograma y un plan real
- EVM para no financieros: cómo explicar el estado del proyecto en un número
- Qué significa realmente "gestionar riesgos" (vs. listar riesgos)

### Estrategia
- Cómo priorizar cuando todo es urgente
- La diferencia entre un plan estratégico y un plan operativo
- Cómo se toman decisiones bajo incertidumbre en proyectos reales
- Indicadores que importan vs. métricas de vanidad en proyectos

### IA Aplicada
- Las 5 tareas de PM que podés delegar a la IA hoy mismo
- Cómo armar prompts para documentación de proyectos
- IA en la gestión de riesgos: ¿cuánto podemos confiar?
- Herramientas de IA que uso en mi trabajo diario como PM

### Liderazgo y Carrera
- Cómo conseguir el PMP sin morir en el intento
- Lo que nadie te dice sobre trabajar en proyectos de transformación digital
- Cómo construir autoridad en PM sin tener décadas de experiencia
- De ingeniera a PM: qué cambió y qué no

Adaptar según el contexto que dé el usuario.

---

## MODO: REVISIÓN DE PLAN

Si el usuario ya tiene un plan:
1. Revisar coherencia entre YouTube y LinkedIn (¿cada post refuerza el video?)
2. Detectar semanas sobrecargadas o muy livianas
3. Verificar variedad de pilares (no más de 2 semanas seguidas del mismo pilar)
4. Sugerir ajustes concretos con justificación

---

## Reglas del plan

- ✅ Siempre un tema central por semana — no dispersar
- ✅ LinkedIn amplifica YouTube, no repite el mismo contenido
- ✅ Al menos un post de opinión por semana (genera más engagement)
- ✅ Respetar el ritmo de la creadora — no proponer más de lo sostenible
- ❌ No inventar temas si el usuario tiene una dirección clara
- ❌ No proponer contenido que no corresponda a los pilares de la marca
