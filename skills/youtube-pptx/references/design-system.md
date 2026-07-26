# Design System — Canal YouTube · Valeria Yashan PM & Strategy

## Paleta de colores oficial (PMI)

| Token       | HEX       | RGBColor Python-pptx         | Uso principal                          |
|-------------|-----------|------------------------------|----------------------------------------|
| Navy        | `#003087` | `RGBColor(0, 48, 135)`       | Fondo portada, separadores, bloques fuertes |
| Blue        | `#0066CC` | `RGBColor(0, 102, 204)`      | Acento principal, headers de columnas  |
| Cyan        | `#00AEEF` | `RGBColor(0, 174, 239)`      | Línea separadora, detalles, CTA        |
| Orange      | `#F7941D` | `RGBColor(247, 148, 29)`     | Etiquetas episodio, highlights, stats  |
| Light Gray  | `#F0F4F8` | `RGBColor(240, 244, 248)`    | Fondo slides de contenido              |
| Dark Text   | `#1A2B4A` | `RGBColor(26, 43, 74)`       | Cuerpo sobre fondo claro               |
| Muted       | `#4A6080` | `RGBColor(74, 96, 128)`      | Subtexto, footers, descripciones       |
| White       | `#FFFFFF` | `RGBColor(255, 255, 255)`    | Texto sobre fondos oscuros             |

> ⚠️ **Nunca usar el string `#RRGGBB` en python-pptx.** Siempre `RGBColor(r, g, b)`.

---

## Tipografía

| Uso              | Fuente    | Tamaño | Peso   | Color          |
|------------------|-----------|--------|--------|----------------|
| Título portada   | Calibri   | 40 pt  | Bold   | White          |
| Subtítulo portada| Calibri   | 22 pt  | Regular| Cyan           |
| Etiqueta episodio| Calibri   | 14 pt  | Bold   | Orange         |
| Título slide     | Calibri   | 28 pt  | Bold   | Navy / White*  |
| Cuerpo / bullets | Calibri   | 18 pt  | Regular| Dark Text      |
| Footer           | Calibri   | 10 pt  | Regular| Muted          |
| Número sección   | Calibri   | 60 pt  | Bold   | Cyan           |
| Texto sección    | Calibri   | 30 pt  | Bold   | White          |
| Stats número     | Calibri   | 36 pt  | Bold   | Orange / Blue  |
| Stats label      | Calibri   | 14 pt  | Regular| Muted          |

\* Blanco cuando el fondo es Navy o Blue oscuro.

---

## Dimensiones y márgenes

| Propiedad         | Valor                    |
|-------------------|--------------------------|
| Tamaño de slide   | 1920 × 1080 px (16:9)    |
| Unidad en pptx    | `Inches(...)` o `Emu`    |
| Margen lateral    | 0.5" (cada lado)         |
| Margen superior   | 0.4"                     |
| Área de contenido | 12.4" × 6.5" aprox.      |
| Altura footer     | 0.3" — pegado al borde inferior |
| Línea cyan        | 4 pt de alto, ancho total |

---

## Línea separadora Cyan

Presente en todos los slides de contenido (no en portada ni separadores de sección):

```python
from pptx.util import Inches, Pt
from pptx.dml.color import RGBColor

def add_cyan_line(slide, prs):
    W = prs.slide_width
    line = slide.shapes.add_shape(
        MSO_SHAPE_TYPE.RECTANGLE if False else 1,  # MSO_SHAPE.RECTANGLE = 1
        left=0, top=Inches(0.38),
        width=W, height=Pt(4)
    )
    line.fill.solid()
    line.fill.fore_color.rgb = RGBColor(0, 174, 239)
    line.line.fill.background()
```

---

## Footer estándar

Texto: `@ValeriaYashanPM · PM & Strategy`  
Posición: borde inferior izquierdo  
Estilo: Calibri 10pt, color Muted (`#4A6080`)

```python
def add_footer(slide, prs):
    W, H = prs.slide_width, prs.slide_height
    txb = slide.shapes.add_textbox(
        Inches(0.5), H - Inches(0.35),
        W - Inches(1), Inches(0.3)
    )
    tf = txb.text_frame
    tf.word_wrap = False
    p = tf.paragraphs[0]
    run = p.add_run()
    run.text = "@ValeriaYashanPM · PM & Strategy"
    run.font.name = "Calibri"
    run.font.size = Pt(10)
    run.font.color.rgb = RGBColor(74, 96, 128)
```

---

## Reglas visuales

- ✅ Fondo claro = siempre `#F0F4F8` (nunca blanco puro ni crema/beige)
- ✅ Máx 5 bullets por slide de contenido
- ✅ Footer en todos los slides de contenido — nunca en portada ni separadores
- ✅ Línea Cyan en todos los slides de contenido
- ❌ No mezclar paleta con la de IMR (`#8B0000`), USI (verde) ni EGCI
- ❌ No usar `theme_color` ni colores heredados del tema — siempre RGB explícito

---

## Bullet style

```python
from pptx.util import Pt
from pptx.dml.color import RGBColor

def style_bullet(paragraph, text, level=0):
    paragraph.text = text
    paragraph.level = level
    run = paragraph.runs[0]
    run.font.name = "Calibri"
    run.font.size = Pt(18)
    run.font.color.rgb = RGBColor(26, 43, 74)
```
