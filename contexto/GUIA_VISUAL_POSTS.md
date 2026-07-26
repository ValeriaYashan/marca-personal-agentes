# Guía Visual de Referencia — Valeria Yashan
**Versión:** 2.0 · Julio 2026
**Cambio principal v1.0 → v2.0:** escala tipográfica reescrita en px reales de canvas (antes estaba en "pt" y subdimensionada ~35%). Nueva regla de color para texto secundario. Piso de legibilidad obligatorio.
**Usar antes de armar cualquier post, carrusel, story o highlight.**

---

## 0. Las 3 reglas que se rompían (leer primero)

1. **Nada por debajo de 22px.** En el feed de Instagram, una pieza de 1080px se renderiza a ~390px en el teléfono: el factor es **0,36**. Un texto de 14px en Canva sale a **5px en pantalla** — es una mancha gris, no un texto. La escala vieja (badge 14px, footer 18px) era literalmente ilegible en el dispositivo donde se consume el 98% del contenido.
2. **`#4A6080` solo sobre fondo claro.** Sobre navy `#003087` el contraste es **1,8:1** (el mínimo legible es 4,5:1). Los subtítulos sobre navy van en **cyan `#00AEEF`**. En el carrusel PMP 2026 la práctica real ya era cyan — la regla escrita decía lo contrario.
3. **Tamaños redondos siempre.** Si en el CDF aparece `fontSize=106.665` o `47.5383`, el diseño se escaló solo y perdió la escala de marca. Números decimales = alerta roja, revisar.

---

## 1. Paleta de colores

| Nombre | HEX | Cuándo usarlo |
|---|---|---|
| **Navy** | `#003087` | Fondo portada, fondo CTA, caja de prompt, highlights |
| **Blue** | `#0066CC` | Acento, headers sobre fondo claro, dato de tiempo |
| **Cyan** | `#00AEEF` | **Texto secundario sobre navy**, línea separadora, bordes, badges |
| **Orange** | `#F7941D` | Número/dato destacado, barra superior, énfasis, CTA URL |
| **Light Gray** | `#F0F4F8` | Fondo de slides de contenido · texto sobre navy |
| **Dark Text** | `#1A2B4A` | Texto principal sobre fondo claro |
| **Muted** | `#4A6080` | **Solo sobre fondo claro.** Subtexto y footer |
| **Blanco** | `#FFFFFF` | Títulos sobre navy |

### Regla de combinación (obligatoria)

| Fondo | Título | Cuerpo | Secundario | Énfasis |
|---|---|---|---|---|
| Navy `#003087` | `#FFFFFF` | `#F0F4F8` | **`#00AEEF`** | `#F7941D` |
| Gris `#F0F4F8` | `#003087` | `#1A2B4A` | **`#4A6080`** | `#F7941D` |

> ⚠️ Nunca `#4A6080` sobre navy — contraste 1,8:1, ilegible.
> ⚠️ Nunca blanco puro `#FFFFFF` como fondo — siempre `#F0F4F8`.
> ⚠️ Nunca negro puro `#000000` como texto — siempre `#1A2B4A`.
> ⚠️ `#0066CC` es acento, **no es color de fondo de página**.

---

## 2. Tipografía — escala única

**Fuente única: Montserrat.** Un solo `fontRef` por diseño. Si en el CDF aparecen dos referencias distintas, el diseño está roto.

### Post y carrusel · canvas 1080 × 1350

| Elemento | Tamaño | Peso | Color s/navy | Color s/gris | En pantalla |
|---|---|---|---|---|---|
| Badge / eyebrow (MAYÚS) | **24** | Bold | `#00AEEF` | `#0066CC` | 8,7px |
| Título portada · 1-2 líneas | **88** | Bold | `#FFFFFF` | `#003087` | 32px |
| Título portada · 3 líneas | **72** | Bold | `#FFFFFF` | `#003087` | 26px |
| Subtítulo portada | **40** | Regular | `#F0F4F8` | `#1A2B4A` | 14px |
| Título slide · 1 línea | **60** | Bold | `#FFFFFF` | `#003087` | 22px |
| Título slide · 2-3 líneas | **52** | Bold | `#FFFFFF` | `#003087` | 19px |
| Número / dato destacado | **140** | Bold | `#F7941D` | `#F7941D` | 50px |
| Item — título | **30** | Bold | `#FFFFFF` | `#1A2B4A` | 11px |
| Item — subtítulo | **26** | Regular | `#00AEEF` | `#4A6080` | 9,4px |
| Cuerpo corrido | **28** | Regular | `#F0F4F8` | `#1A2B4A` | 10px |
| Dato clave inline | **26** | Bold | `#F7941D` | `#F7941D` | 9,4px |
| CTA — URL | **32** | Bold | `#F7941D` | `#003087` | 11,5px |
| CTA — badge | **24** | Bold | `#00AEEF` | `#0066CC` | 8,7px |
| Firma "Valeria Yashan · PMP®" | **22** | Regular | `#F0F4F8` | `#4A6080` | 8px |
| Paginación "3 / 6" | **22** | Bold | `#00AEEF` | `#4A6080` | 8px |

> **Piso absoluto: 22px.** Nada más chico entra en una pieza de feed.

### Story · canvas 1080 × 1920

| Elemento | Tamaño | Peso |
|---|---|---|
| Marca "VALERIA YASHAN" (MAYÚS) | **26** | Bold |
| Título | **84** | Bold |
| Título largo (3+ líneas) | **68** | Bold |
| Cuerpo | **34** | Regular |
| CTA | **30** | Bold |
| Firma / handle | **24** | Regular |

### Interlineado

| Elemento | lineHeight |
|---|---|
| Títulos (52px+) | **1,15** |
| Items y subtítulos | **1,25** |
| Cuerpo corrido | **1,45** |

> El carrusel PMP 2026 usa 1,4 en todo, incluidos los títulos de 56px. Un título con 1,4 se desarma visualmente: bajar a 1,15.

---

## 3. Dimensiones y zonas de seguridad

| Formato | Canal | Dimensiones |
|---|---|---|
| **Post / carrusel (estándar)** | Instagram / LinkedIn | **1080 × 1350** |
| Post cuadrado (solo si lo pide el formato) | Instagram / LinkedIn | 1080 × 1080 |
| Story / Reel cover / Highlight | Instagram | 1080 × 1920 |

**Márgenes en 1080 × 1350:**
- Laterales: **80px** mínimo
- Superior: **90px**
- Inferior: **110px**
- **Últimos 140px inferiores:** sin contenido crítico — ahí caen los puntos del carrusel y el UI de Instagram

**Márgenes en 1080 × 1920 (story):**
- Superior: **250px** libres (barra de perfil)
- Inferior: **320px** libres (caja de respuesta)
- Laterales: **80px**

**Densidad máxima por slide:** 1 título + 4 items. Cada subtítulo de item, máximo 2 líneas.

---

## 4. Estructura de cada tipo de slide

### Portada (Slide 1) — fondo `#003087`

```
▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬  ← barra #F7941D, 6px, ancho completo, top 0
  [ BADGE EN MAYÚSCULAS ]     ← 24 Bold #00AEEF, en pastilla navy borde cyan
  Título grande               ← 88 Bold #FFFFFF, lineHeight 1,15
  de la portada
  Subtítulo descriptivo       ← 40 Regular #F0F4F8
  ──────────────              ← línea #00AEEF
  Valeria Yashan · PMP®       ← 22 Regular #F0F4F8, inferior izq
                        1 / 6 ← 22 Bold #00AEEF, inferior der
```

### Slide de contenido — fondo `#003087` o `#F0F4F8`

```
▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬  ← barra #F7941D
  BADGE · CONTEXTO            ← 24 Bold #00AEEF
  Título del slide            ← 52-60 Bold, máx. 2-3 líneas
  1  Título del item          ← 30 Bold
     Subtítulo del item       ← 26 Regular #00AEEF (navy) / #4A6080 (gris)
  2  Título del item
     Subtítulo del item
  Dato clave: ...             ← 26 Bold #F7941D
  Valeria Yashan · PMP®       ← 22 Regular            3 / 6 ← 22 Bold
```

### Slide de dato destacado

```
  BADGE · MÉTRICA             ← 24 Bold #00AEEF
  26%                         ← 140 Bold #F7941D
  Qué significa ese número.   ← 52 Bold #FFFFFF
  Contexto en una línea.      ← 28 Regular #F0F4F8
```

### Slide CTA (último) — fondo `#003087`

```
  PRÓXIMOS PASOS              ← 24 Bold #00AEEF
  ¿Preparás el PMP ahora?     ← 60 Bold #FFFFFF
  1  Paso concreto            ← 30 Bold / 26 Regular cyan
  2  Paso concreto
  3  Paso concreto
  ┌─────────────────────────┐ ← caja navy, borde #F7941D 2px
  │ valeriayashan.com.ar/... │ ← 32 Bold #F7941D
  └─────────────────────────┘
  GUARDÁ ESTE CARRUSEL        ← 24 Bold #00AEEF
```

---

## 5. Fondos — regla dura

- Fondo **siempre color sólido de marca**: `#003087` navy o `#F0F4F8` gris claro. Nada más.
- **Nunca** imágenes de fondo, fotografías de fondo, gradientes ni texturas.
- **Nunca** `#0066CC` ni `#F7941D` como fondo de página completa.
- Las fotos de Valeria y los íconos van **superpuestos** sobre el fondo sólido, nunca como fondo.
- Fotos de personas: solo fotos reales de Valeria (`/mnt/user-data/uploads/`). Nunca stock de terceros, nunca ilustraciones genéricas de personas.

---

## 6. Patrón de feed Instagram

Alternar navy y gris claro:

```
[Navy] [Gris] [Navy] [Gris] [Navy] [Gris]
  IA   Dato   Libro   PM   Prompt  Prod
```

| Fondo navy `#003087` | Fondo gris `#F0F4F8` |
|---|---|
| Portadas de carrusel | Posts de datos / estadísticas |
| Posts de IA | Posts de gestión de proyectos |
| Posts de libros | Posts de productividad |
| CTAs y lanzamientos | Contenido educativo |

---

## 7. Flujo MCP Canva — carruseles y multipágina

```
1. generate-design → "blank solid navy #003087 background, no text no images"
2. create-design-from-candidate → convertir a editable
3. read-design (open_transaction: true) → obtener IDs de página
4. add_page con background_color="#003087" (una por slide)
5. add_text página por página
6. format_text en segunda pasada → aplicar color, peso y TAMAÑO de la tabla §2
7. commit
8. Ajuste manual de posición en Canva (el posicionamiento en páginas FIXED se invierte)
```

> ⚠️ **Nunca** `generate-design` con el contenido completo para un carrusel: Canva AI ignora colores, tipografía y tamaños.
> ⚠️ **Nunca** reusar un `transaction_id` entre sesiones.
> ⚠️ `perform-editing-operations` falla en silencio si no se pasan todos los objetos existentes en `pages`.

---

### Editar un diseño que ya existe

```
1. read-design (open_transaction: true) → transaction_id + CDF con los locator_id
2. edit-design → una llamada por página (page_index)
   · todas las operaciones de una llamada deben apuntar a la MISMA página
   · format_text, replace_text y resize_element se pueden batchear juntos
3. Revisar la miniatura devuelta antes de pasar a la página siguiente
4. edit-design con finalize:"commit" y SIN operations → guarda todo (irreversible)
```

**Cambiar el fondo de una página existente.** El MCP no expone esa propiedad. Workaround confirmado:

```
Llamada 1: insert_shape → rect 1080×1350, path "M0 0H1080V1350H0Z", color de marca
Llamada 2: layer_element → position:"back" sobre el ID que devolvió la llamada 1
```

El rectángulo entra siempre por encima de todo, así que la segunda llamada es obligatoria. El ID recién existe después de aplicar la primera, por eso no se puede batchear. Queda bien visualmente, pero la propiedad de fondo de la página sigue con el color viejo por debajo: conviene corregirla a mano en Canva y borrar el rectángulo.

**Al subir el tamaño de un texto**, agrandar también la caja con `resize_element`. En elementos TEXT se pasa solo `width` — el alto se recalcula solo. Si no, el texto se parte en líneas de más y se desborda.

> ⚠️ `operations` y `finalize:"commit"` no se pueden combinar en la misma llamada — se rechaza.
> ⚠️ Las coordenadas del CDF en páginas FIXED se ven mal (`pos: 1260` en un canvas de 1080) pero renderizan bien. No tocarlas.
> ⚠️ Después de subir la escala tipográfica, siempre queda una pasada manual de espaciado vertical en Canva: los bloques crecen entre 15% y 25% de alto.

---

## 8. Checklist de control antes de publicar

- [ ] ¿Todos los `fontSize` son números redondos de la tabla §2? (decimales = diseño escalado, corregir)
- [ ] ¿Ningún texto por debajo de **22px**?
- [ ] ¿Un solo `fontRef` (Montserrat) en todo el diseño?
- [ ] ¿Fondo de **todas** las páginas es `#003087` o `#F0F4F8`? (nada de `#0066CC`, `#F7941D` ni imágenes)
- [ ] ¿Ningún `#4A6080` sobre navy?
- [ ] ¿Todos los elementos dentro del canvas? (posición X e Y menores a 1080 / 1350)
- [ ] ¿Últimos 140px inferiores libres de contenido crítico?
- [ ] ¿Máximo 4 items por slide, subtítulos de 2 líneas máximo?
- [ ] ¿Barra `#F7941D` de 6px en el top de cada página?
- [ ] ¿Firma + paginación en todas las páginas?

---

## 9. Reglas de oro

1. **Piso 22px** — nada más chico en feed.
2. **Fondo claro = `#F0F4F8`** — nunca blanco puro.
3. **Fuente única = Montserrat** — nunca mezclar.
4. **Navy y gris son fondos** — cyan y naranja son acentos, nunca fondo.
5. **`#4A6080` solo sobre fondo claro.**
6. **Alternar navy / gris** en el feed siempre.
7. **No editar la plantilla original** — siempre duplicar.
8. **No publicar desde desktop en Instagram** — usar Meta Business Suite o Canva.
9. **No editar posts de LinkedIn** en las primeras horas — penaliza el alcance.
10. **CTA siempre concreto** — nunca "seguinos", siempre una acción específica.
11. **Highlights: crear de atrás para adelante** — el último creado aparece primero.
12. **Contenido siempre significativo** — nunca placeholder ni frase genérica.
