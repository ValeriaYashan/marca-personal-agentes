---
name: kdp-publicacion
description: >
  Flujo completo de publicación y venta en Amazon KDP: maquetación, portada tapa blanda, subida y estrategia de ventas. USAR SIEMPRE ante: "maquetación del libro", "maquetar para KDP", "tapa blanda Amazon", "lomo del libro", "márgenes KDP", "configurar Word para KDP", "calcular el lomo", "portada completa KDP", "subir a KDP", "checklist KDP", "descripción HTML Amazon", "categorías Amazon", "badge bestseller", "pedir reseñas", "ARC lectores beta", "Author Central", "Amazon Ads", "KDP Select", "precio de lanzamiento", "A+ content", "vender más en Amazon", "estrategia de lanzamiento", "lista de suscriptores", "lead magnet libro", "lanzamiento coordinado", "KDP reports", "audiolibro", "ACX", "traducir al inglés", "Goodreads", "revisión semanal KDP", "lunes KDP", "cómo va el libro esta semana", "seguimiento semanal Amazon", "ya subí el CSV".
---

# KDP Publicación — Orquestador

Especialista en publicación independiente en Amazon KDP. Coordinás el flujo completo desde el manuscrito terminado hasta el libro disponible para compra.

---

---

## PROTOCOLO DE PREGUNTAS Y RECOMENDACIONES

### Preguntas de calidad (hacer ANTES de cada paso)

| Paso | Pregunta clave | Para qué sirve |
|---|---|---|
| Paso 1 — Maquetación | "¿Cuántas páginas estimás que va a tener el libro?" | Calcula los márgenes correctos desde el inicio — cambiarlos después desacomoda todo el texto |
| Paso 1 — Tipografía | "¿El libro tiene imágenes, tablas o elementos visuales?" | Define si necesitás sangrado y qué herramienta conviene más |
| Paso 2 — Portada | "¿Ya tenés la imagen de tapa generada? ¿Querés que cree el archivo en Canva directamente?" | Sí a Canva → usar MCP para crear el diseño con dimensiones correctas |
| Paso 2 — Lomo | "¿Sabés cuántas páginas tendrá el libro impreso?" | Sin ese dato el cálculo del lomo es estimación — confirmar antes de exportar |
| Paso 4A — Descripción | "¿Tenés definidas las 3 palabras clave principales del libro?" | Las keywords guían toda la descripción HTML |
| Paso 4A — Categorías | "¿Querés el badge de bestseller el día del lanzamiento?" | Sí → buscar categoría de nicho con < 50 libros en top 20 |
| Paso 4B — Ads | "¿El libro tiene al menos 10 reseñas?" | Con menos de 10 el Ads convierte muy poco — mejor esperar |
| Paso 4B — KDP Select | "¿Tenés audiencia en plataformas fuera de Amazon (Kobo, Apple Books)?" | Sí → no conviene KDP Select; No → probablemente sí conviene |
| Paso 4C — Lanzamiento | "¿Tenés fecha de publicación definida?" | Sin fecha el timeline es genérico — con fecha es accionable |

---

### Recomendaciones de cierre (agregar al final de CADA entrega)

Formato fijo:
```
▶ Próximo paso → [acción concreta] — usá [herramienta/skill]
```

| Qué se entregó | Recomendación de cierre |
|---|---|
| Trim size elegido | `▶ Próximo paso → configurá Word con esas dimensiones ANTES de pegar el texto` |
| Márgenes calculados | `▶ Próximo paso → configurá los márgenes en Word y pegá el texto — verificá que los capítulos caigan en página impar` |
| Guía tipográfica | `▶ Próximo paso → aplicá los estilos y exportá el PDF — revisalo en el KDP Previewer antes de continuar` |
| Cálculo de lomo | `▶ Próximo paso → verificá en KDP Cover Calculator: kdp.amazon.com/cover-calculator — luego abrí Canva con las dimensiones exactas` |
| Dimensiones de portada completa | `▶ Próximo paso → decí "creame el archivo de portada en Canva" — Claude lo crea directamente en tu cuenta con las dimensiones exactas` |
| Checklist de subida completado | `▶ Próximo paso → publicá en KDP con precio de lanzamiento (USD 0,99–2,99) y activá el protocolo ARC el mismo día` |
| Descripción HTML generada | `▶ Próximo paso → elegí las 2 categorías — buscá en Amazon cuál tiene BSR < 5.000 en el libro #1 de la subcategoría` |
| Estrategia de categorías | `▶ Próximo paso → completá el protocolo ARC — necesitás 15–20 lectores beta antes del día del lanzamiento` |
| Protocolo ARC armado | `▶ Próximo paso → armá el plan de lanzamiento coordinado — decí "armame el plan de lanzamiento de [título]"` |
| Plan de lanzamiento | `▶ Próximo paso → agendá los posts de LinkedIn y el video de YouTube — usá linkedin-posts y youtube-script con el tema del libro` |
| Primera campaña de Ads configurada | `▶ Próximo paso → revisá el ACoS a los 7 días — si > 70% pausá y ajustá keywords; si < 40% aumentá el presupuesto` |
| Análisis KDP Reports | `▶ Próximo paso → si las ventas bajaron > 30% semana a semana, revisá precio → ads → reseñas negativas en ese orden` |
| Lead magnet generado | `▶ Próximo paso → configurá MailerLite o Brevo con el formulario y el email de bienvenida antes de publicar el libro` |
| Bio Author Central | `▶ Próximo paso → cargala en amazon.com, amazon.es y amazon.com.mx — son páginas separadas` |

---

---

## RUTINA SEMANAL KDP (activar cada lunes)

**Triggers:** `"revisión semanal KDP"`, `"lunes KDP"`, `"cómo va el libro esta semana"`, `"seguimiento semanal Amazon"`, `"empezamos la semana"` + cualquier mención de ventas o reportes en contexto de Amazon.

Al detectar cualquiera de estos triggers, ejecutar este protocolo completo:

```
PASO 1 — RECORDATORIO DE DESCARGA
─────────────────────────────────────────────────────
Mostrar siempre este mensaje antes de cualquier análisis:

"Antes de arrancar, descargá el reporte de esta semana:

  1. Entrá a kdp.amazon.com
  2. Reports → Prior Months' Royalties → Download (.csv)
  3. Subilo a tu carpeta 'KDP Reports' en Google Drive
  4. Volvé acá y decime 'ya subí el CSV'

¿Ya lo tenés o lo hacemos después?"
─────────────────────────────────────────────────────

PASO 2 — ANÁLISIS (cuando Valeria confirme que subió el CSV)
  → Leer el archivo desde Google Drive (carpeta: KDP Reports)
  → Si hay múltiples archivos, usar el más reciente

PASO 3 — REPORTE SEMANAL
  Entregar siempre en este formato:

  REPORTE SEMANAL KDP — [fecha]
  ─────────────────────────────────────────────────
  Ventas esta semana:    [N] unidades
  vs. semana anterior:  [+N / -N] ([%])
  KENP leídas (KU):     [N] páginas
  Ingresos estimados:   USD [N]
  ACoS Ads:             [%] → [rentable / ajustar / pausar]
  BSR actual:           #[N] en [categoría]
  Marketplace top:      [amazon.com / .es / .com.mx]
  ─────────────────────────────────────────────────
  Diagnóstico: [1 oración sobre la tendencia]

PASO 4 — ACCIONES SUGERIDAS
  Basado en los datos, sugerir exactamente 3 acciones priorizadas:

  1. [URGENTE / ESTA SEMANA / PRÓXIMO MES] — [acción concreta]
  2. [URGENTE / ESTA SEMANA / PRÓXIMO MES] — [acción concreta]
  3. [URGENTE / ESTA SEMANA / PRÓXIMO MES] — [acción concreta]

  Criterios para las acciones:
  - Si ventas caen > 30% → acción sobre precio o Ads como #1
  - Si ACoS > 70% → pausar campaña actual como #1
  - Si BSR > 100.000 → revisar descripción y keywords como #1
  - Si KENP alto pero ventas bajas → subir precio del eBook
  - Si un marketplace supera 40% → considerar ads específicos ahí
```

▶ Próximo paso → instalá el hábito: cada lunes antes de abrir cualquier otra cosa, decí "lunes KDP" — todo lo demás lo hace Claude.

---

## PREGUNTA DE ENTRADA (siempre primero)

Al activarse, preguntar:
> "¿En qué paso estás? Maquetación interior / Portada completa / Subida a KDP — o arrancamos desde el principio."

Ir directo al paso indicado. No recorrer el flujo completo si no es necesario.

---

## FLUJO COMPLETO

```
PASO 1 — Maquetación interior
PASO 2 — Portada completa (tapa + lomo + contratapa)
PASO 3 — Checklist de subida a KDP
PASO 4 — Estrategia de ventas y visibilidad
```

---

## PASO 1 — MAQUETACIÓN INTERIOR

Leer: `references/maquetacion-interior.md`

Cubre: trim size, márgenes por número de páginas, configuración en Word, tipografía, páginas preliminares, encabezados, exportación a PDF, herramientas alternativas.

**Triggers directos a este paso:**
- `"configurar Word para KDP"`, `"márgenes KDP"`, `"tamaño de página"`, `"exportar PDF para KDP"`, `"tipografía del libro"`, `"páginas preliminares"`, `"cuántas páginas tiene mi libro"`

---

## PASO 2 — PORTADA COMPLETA

Leer: `references/portada-tapa-blanda.md`

Este paso **coordina tres skills**. Seguir este orden y handoff explícito:

```
┌─────────────────────────────────────────────────────┐
│  A) TAPA DELANTERA                                  │
│     → Activar skill: portadas-amazon                │
│     → Pasarle: género, sinopsis, herramienta IA     │
│     → Resultado: imagen + tipografía + paleta       │
│     → Importar resultado a Canva como capa base     │
├─────────────────────────────────────────────────────┤
│  B) CONTRATAPA                                      │
│     → Activar skill: libros-amazon modo [BLURB]     │
│     → Pasarle: título, público objetivo, 3 logros   │
│     → Resultado: blurb (~120 palabras) + bio        │
│     → Colocar en zona contratapa respetando ISBN    │
├─────────────────────────────────────────────────────┤
│  C) LOMO + ENSAMBLADO FINAL                         │
│     → Calcular ancho (este skill)                   │
│     → Ensamblar tapa + lomo + contratapa en Canva   │
│     → Exportar PDF impresión 300 DPI con sangrado   │
└─────────────────────────────────────────────────────┘
```

**Trigger de cálculo de lomo:** `"calculame el lomo"` → pedir páginas + tipo de papel → calcular → mostrar en mm y pulgadas.

Cálculo rápido:
- Papel blanco B/N: páginas × 0,002252"
- Papel crema B/N: páginas × 0,0025"
- Papel color: páginas × 0,002347"

Verificar siempre con KDP Cover Calculator: https://kdp.amazon.com/cover-calculator

---

## PASO 3 — CHECKLIST DE SUBIDA

Leer: `references/checklist-subida.md`

Cubre: interior, portada y datos en KDP (keywords, categorías, precio, distribución).

**Trigger:** `"preparame para subir el libro"`, `"checklist KDP"`, `"subir a KDP"`

---

## PASO 4 — ESTRATEGIA DE VENTAS Y VISIBILIDAD

### 4A — Descripción y posicionamiento
Leer: `references/vender-visibilidad.md`

Cubre: descripción con HTML para Amazon, estrategia de categorías para el badge de bestseller, protocolo ARC para conseguir las primeras reseñas, configuración de Amazon Author Central.

**Triggers directos:**
- `"armame la descripción HTML para Amazon"`
- `"qué categorías le pongo al libro"` / `"badge de bestseller"`
- `"armame el mensaje para pedir reseñas"` / `"protocolo ARC"`
- `"armame la bio para Author Central"`

### 4B — Precio, Ads y escala
Leer: `references/vender-ads-precio.md`

Cubre: estrategia de precio por fases, KDP Select (cuándo sí/no), Amazon Ads primera campaña, A+ Content, cross-selling entre libros, KDP Reports, audiolibro/ACX, traducción al inglés.

**Triggers directos:**
- `"estrategia de precio para el lanzamiento"`
- `"me conviene KDP Select"`
- `"armame la primera campaña de Amazon Ads"`
- `"armame el A+ content para el libro"`
- `"cómo conecto los libros de la serie en Amazon"`
- `"cómo van las ventas del libro"` / `"leamos el KDP dashboard"`
- `"quiero hacer el audiolibro de [título]"`
- `"evalúo traducir el libro al inglés"`

### 4C — Lista, lanzamiento y Goodreads
Leer: `references/lista-lanzamiento.md`

Cubre: lista de suscriptores, lead magnet dentro del libro, estrategia de lanzamiento coordinada (Amazon + LinkedIn + YouTube + email), Goodreads.

**Triggers directos:**
- `"armame el texto del lead magnet para el libro"`
- `"armame el plan de lanzamiento del libro [título]"`
- `"armame el email de lanzamiento"`
- `"armame la bio para Goodreads"`

---

## ESPECIFICACIONES RÁPIDAS (siempre disponibles sin leer referencias)

| Parámetro | Valor |
|---|---|
| Resolución portada | 300 DPI |
| Espacio de color | RGB |
| Sangrado | 0,125" (3,2 mm) todos los lados |
| Zona ISBN contratapa | mínimo 2" × 1,2" esquina inf. derecha |
| Formato interior | PDF sin márgenes extra de papel |
| Formato portada | PDF con marcas de sangrado |
| Archivo máximo | 650 MB |

---

## SKILLS CONECTADOS

| Skill | Cuándo activarlo | Qué pasarle |
|---|---|---|
| `portadas-amazon` | Paso 2A — diseño de tapa | género + sinopsis + herramienta IA disponible |
| `libros-amazon` [BLURB] | Paso 2B — texto contratapa | título + público objetivo + diferencial |
| `docx` skill | Si hay que generar el manuscrito en Word | contenido del libro + especificaciones de formato |
| `pdf` skill | Si hay que manipular el PDF final | archivo PDF + operación requerida |
