# Portada Completa — Tapa Blanda KDP

## Estructura del archivo

La portada de tapa blanda es un **archivo único** que incluye las tres zonas:

```
┌─────────────────────────────────────────────────────────────┐
│  SANGRADO  │    CONTRATAPA    │  LOMO  │    TAPA    │ SANGRADO │
│  0,125"    │                  │        │            │  0,125"  │
└─────────────────────────────────────────────────────────────┘
```

---

## Calcular el ancho del lomo

**Fórmula:**
```
Ancho del lomo = número de páginas × grosor por página
```

| Tipo de papel | Grosor por página |
|---|---|
| Blanco y negro, papel blanco | 0,002252" |
| Blanco y negro, papel crema | 0,002500" |
| Color estándar | 0,002347" |

**Ejemplo:** 200 páginas × 0,002252" = 0,4504" = 11,4 mm

⚠️ Siempre verificar con KDP Cover Calculator:
https://kdp.amazon.com/cover-calculator

**Lomo legible:** necesita mínimo 0,5" (12,7 mm) de ancho para poner texto. Con menos de eso, el lomo va en blanco.

---

## Calcular dimensiones del archivo completo

```
Ancho total = (trim width × 2) + ancho lomo + (0,125" × 2)
Alto total  = trim height + (0,125" × 2)
```

**Ejemplo — libro 6×9", 200 páginas, papel blanco:**
```
Ancho = (6" × 2) + 0,4504" + 0,25" = 12,7004"  →  3810 px a 300 DPI
Alto  = 9" + 0,25" = 9,25"           →  2775 px a 300 DPI
```

**Conversión px a 300 DPI:** pulgadas × 300 = píxeles

---

## Zona segura

Mantener todo el contenido importante (texto, logos, elementos clave) a:
- **0,25" del borde** de cada zona (tapa, lomo, contratapa)
- **El lomo tiene tolerancia adicional:** dejar 0,0625" extra de margen en cada lado porque el corte puede variar

---

## Contenido por zona

### Tapa delantera
→ Diseñada con `portadas-amazon` skill
→ Importar imagen resultante como capa base en Canva
→ El sistema visual de serie (si existe) aplica aquí

### Lomo (si ancho ≥ 0,5")
- Título del libro
- Nombre del autor
- Convención: texto de abajo hacia arriba (leer girando el libro a la derecha)
- Fuente: misma que la tapa, tamaño adaptado al ancho disponible

### Contratapa
```
┌────────────────────────────────────┐
│                                    │
│  BLURB (~120 palabras)             │ ← libros-amazon modo [BLURB]
│                                    │
│  Bio del autor (2–3 líneas)        │
│  Foto pequeña (opcional)           │
│                                    │
│                    ┌─────────────┐ │
│                    │  ISBN/CB    │ │ ← zona mínima 2" × 1,2"
│                    └─────────────┘ │
└────────────────────────────────────┘
```

La zona del ISBN siempre en la **esquina inferior derecha** de la contratapa. KDP agrega el código de barras automáticamente si dejás ese espacio vacío.

---

## Ensamblar en Canva

### Opción A — Con MCP de Canva (recomendado)

Si Canva MCP está conectado, Claude puede crear el diseño directamente en tu cuenta.
**Trigger:** `"creame el archivo de portada en Canva"` → Claude ejecuta los pasos automáticamente:

```
1. Calcula dimensiones exactas según trim size + páginas + tipo de papel
2. Crea nuevo diseño en tu Canva con el tamaño correcto
3. Nombra el archivo: "Portada-[Título]-[fecha]"
4. Devuelve el link directo para que lo abrás y diseñés encima
```

Desde ese archivo ya configurado:
- Importá la imagen de tapa (de portadas-amazon)
- Pegá el blurb en la contratapa (de libros-amazon [BLURB])
- Agregá el texto del lomo si el ancho ≥ 0,5"
- Dejá la zona del ISBN vacía (esquina inferior derecha contratapa)

### Opción B — Manual (si MCP no está disponible)

```
1. Nuevo diseño → Tamaño personalizado
   Ingresar: [ancho total en px] × [alto total en px]

2. Crear guías verticales (Herramientas → Guías):
   Guía 1: 38 px desde borde izquierdo (sangrado)
   Guía 2: (0,125" + ancho contratapa) × 300 (inicio lomo)
   Guía 3: (0,125" + ancho contratapa + ancho lomo) × 300 (inicio tapa)
   Guía 4: ancho total - 38 px (sangrado derecho)

3. Diseñar cada zona respetando zona segura (0,25" del borde)
4. Importar imagen de tapa → pegar blurb → texto del lomo → dejar zona ISBN vacía
```

---

## Exportación final

```
Canva: Compartir → Descargar → PDF impresión
✅ Marcas de recorte y sangrado: activado
Calidad: máxima
DPI: 300
Espacio de color: RGB (KDP convierte a CMYK internamente)
```

---

## Checklist portada completa

```
□ Dimensiones calculadas con KDP Cover Calculator
□ Tapa diseñada (portadas-amazon) e importada
□ Blurb en contratapa (libros-amazon [BLURB]) — máx. 120 palabras
□ Lomo con texto si ancho ≥ 0,5"
□ Zona ISBN vacía: 2" × 1,2" esquina inf. derecha contratapa
□ Todo el contenido dentro de la zona segura (0,25" del borde)
□ Exportado como PDF impresión con sangrado
□ Resolución 300 DPI
□ Archivo menor a 650 MB
```
