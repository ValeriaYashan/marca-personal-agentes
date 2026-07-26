# Maquetación Interior KDP

## Trim size recomendado

| Formato | Dimensiones | Ideal para |
|---|---|---|
| **6 × 9"** ✅ | 15,24 × 22,86 cm | Non-fiction: PM, negocios, autoayuda |
| 5,5 × 8,5" | 13,97 × 21,59 cm | Guías prácticas, libros compactos |
| 5 × 8" | 12,70 × 20,32 cm | Guías rápidas, libros delgados |
| 8,5 × 11" | 21,59 × 27,94 cm | Workbooks, libros de ejercicios |

Default para Valeria: **6 × 9"** (non-fiction profesional).

---

## Márgenes según número de páginas

| Páginas | Interior mínimo | Interior recomendado | Exterior | Superior/Inferior |
|---|---|---|---|---|
| 24 – 150 | 9,5 mm (0,375") | 12,7 mm (0,5") | 12,7 mm | 12,7 mm |
| 151 – 300 | 19 mm (0,75") | 22,2 mm (0,875") | 12,7 mm | 12,7 mm |
| 301 – 500 | 22,2 mm (0,875") | 25,4 mm (1,0") | 12,7 mm | 12,7 mm |
| 501 – 700 | 25,4 mm (1,0") | 28,6 mm (1,125") | 12,7 mm | 12,7 mm |
| 700+ | 28,6 mm (1,125") | 31,75 mm (1,25") | 12,7 mm | 12,7 mm |

**Sangrado:** solo si hay imágenes o elementos al borde → 3,2 mm (0,125") en todos los lados. Para texto puro: sin sangrado.

---

## Configuración en Word

```
1. Diseño de página → Tamaño → Personalizado
   Ancho: [trim width]  Alto: [trim height]

2. Márgenes → Configurar página → Márgenes:
   Interior: [según tabla]
   Exterior: 0,5"
   Superior: 0,5"
   Inferior: 0,5"
   Páginas: Márgenes simétricos  ← crítico para encuadernado

3. Diseño → Encabezado y pie:
   ✅ Diferente en páginas pares e impares
   ✅ Primera página diferente
```

⚠️ Configurar ANTES de pegar el texto. Los márgenes afectan el flujo y el conteo de páginas final.

---

## Tipografía

| Elemento | Fuente | Tamaño | Interlineado |
|---|---|---|---|
| Cuerpo | Garamond / Palatino / Georgia | 11–12 pt | 1,15–1,3 |
| Título capítulo | Misma familia, bold | 18–24 pt | automático |
| Subtítulos H2 | Misma familia, bold | 13–14 pt | automático |
| Notas / refs | Misma familia | 9–10 pt | simple |
| Encabezado/pie | Misma familia, light | 9 pt | simple |

Regla: máximo 2 familias en todo el libro. Para non-fiction: una sola familia en distintos pesos.

---

## Encabezados y pies de página

- **Páginas impares (derecha):** título del capítulo actual
- **Páginas pares (izquierda):** título del libro o nombre del autor
- **Número de página:** centrado en el pie o en el margen exterior
- **Primera página de cada capítulo:** sin encabezado, sin número visible

En Word: Insertar → Encabezado → activar "Diferente en páginas pares e impares" + "Primera página diferente".

---

## Páginas preliminares — orden estándar

```
Pág. 1  Portadilla         — título + autor solamente
Pág. 2  Página de derechos — copyright, ISBN, edición, año
Pág. 3  Dedicatoria        — opcional, página impar
Pág. 4  (en blanco)        — si hay dedicatoria
Pág. 5+ Tabla de contenidos — página impar
        Prólogo / Introducción
        Capítulo 1         — siempre página impar ← regla de oro
```

Los capítulos siempre arrancan en página impar (derecha). Si el capítulo anterior termina en página impar, insertar página en blanco.

---

## Exportar a PDF para KDP

```
Archivo → Guardar como → PDF
Opciones:
  ✅ Optimizar para: Impresión de alta calidad
  ❌ Incluir información del documento: NO
  ❌ PDF/A: NO (KDP no lo acepta)
  
Verificar antes de subir:
  - Tamaño del archivo = exactamente el trim size (sin márgenes de papel)
  - Márgenes consistentes en todas las páginas
  - Sin páginas en blanco no deseadas al final
  - Tipografía embebida (Archivo → Propiedades → Fuentes)
```

---

## Herramientas alternativas a Word

| Herramienta | Costo | Ventaja | Cuándo usarla |
|---|---|---|---|
| **Reedsy Book Editor** | Gratis | Específico para libros, exporta directo | Querés simplicidad sin configurar nada |
| **LibreOffice** | Gratis | Igual a Word | No tenés Office |
| **Affinity Publisher** | ~USD 70 pago único | Control total, profesional | Libros con mucho diseño o imágenes |
| **Vellum** | ~USD 250 | Mejor resultado visual | Solo Mac, si publicás varios libros |
| **Canva** | Gratis/Pro | Fácil | Solo workbooks o libros muy visuales |
