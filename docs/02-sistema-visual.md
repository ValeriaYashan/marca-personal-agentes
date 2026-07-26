# Sistema visual — dos capas

La marca tiene **dos capas visuales distintas y deliberadas**. No es una inconsistencia pendiente de corregir: es una decisión tomada el 24/07/2026. Nunca se mezclan.

---

## Capa REDES — LinkedIn · Instagram · YouTube · Substack

### Paleta

| Rol | Hex |
|---|---|
| Navy | `#003087` |
| Blue | `#0066CC` |
| Cyan | `#00AEEF` |
| Orange | `#F7941D` |
| Light Gray | `#F0F4F8` |
| Dark Text | `#1A2B4A` |
| Muted | `#4A6080` |

**Tipografía:** Montserrat, única. ExtraBold (800) títulos · Bold (700) subtítulos · Regular (400) cuerpo. Nunca mezclar fuentes.

### Tres reglas que se rompen seguido

**Fondos sólidos, siempre.** Todo diseño usa `#003087` o `#F0F4F8` de fondo. Nunca imágenes, gradientes ni texturas. Fotos e íconos van como elementos superpuestos sobre el fondo sólido.

**`#0066CC` es acento, nunca fondo de página.**

**`#4A6080` solo sobre fondo claro.** Sobre navy el contraste es 1,8:1 — ilegible. Sobre `#003087`, el texto secundario, los subtítulos de ítem y la paginación van en cyan `#00AEEF`.

### Escala tipográfica v2.0 — canvas 1080×1350 px

Reemplaza la v1.0, que estaba expresada en puntos y quedaba ~35% chica.

| Elemento | Tamaño | Peso | Color |
|---|---|---|---|
| Badge / eyebrow MAYÚSCULAS | 24 | Bold | `#00AEEF` |
| Título de portada | 88 (72 si son 3 líneas) | Bold | |
| Subtítulo de portada | 40 | Regular | |
| Título de slide | 60 (52 si son 2-3 líneas) | Bold | |
| Número o dato destacado | 140 | Bold | `#F7941D` |
| Título de ítem | 30 | Bold | |
| Subtítulo de ítem | 26 | Regular | |
| Cuerpo | 28 | Regular | |
| Dato clave | 26 | Bold | `#F7941D` |
| URL del CTA | 32 | Bold | `#F7941D` |
| Badge del CTA | 24 | Bold | `#00AEEF` |
| Firma / paginación | 22 | | |

Interlineado: títulos 1,15 · ítems 1,25 · cuerpo 1,45.

**Piso absoluto: 22 px.** Un canvas de 1080 px se ve a ~390 px en un teléfono. El factor es 0,36: 14 px se convierten en 5 px reales.

### Story — 1080×1920

Marca MAYÚSCULAS 26 Bold · Título 84 Bold (68 con 3+ líneas) · Cuerpo 34 Regular · CTA 30 Bold · Firma 24 Regular.

### Layout

Formato estándar de feed 1080×1350. Márgenes: 80 px a los lados, 90 arriba, 110 abajo; los últimos 140 px sin contenido crítico. Máximo un título y cuatro ítems por slide. En el feed se alternan fondo navy y gris claro.

### Señal de alarma en Canva

Tamaños con decimales en el CDF —`106.665`, `47.5383`— significan que el diseño se autoescaló y perdió la escala de marca. Corregir a los valores redondos de la tabla, verificar que haya un solo `fontRef` (Montserrat) y que no queden elementos fuera del canvas.

---

## Capa WEB — valeriayashan.com.ar

| Rol | Hex |
|---|---|
| Acento | `#2D6A4F` |
| Fondo | `#FAFAF8` — nunca blanco puro |
| Superficie | `#F2F1EE` |
| Texto | `#1A1A1A` |
| Muted | `#6B6B6B` |
| Borde | `#E0DFDB` |
| Compra Amazon | `#FF9900` — solo en botones |

**Tipografía:** Fraunces (serif) **solo** en H1 y H2. Inter (sans) en todo lo demás.

**Brand kit de Canva del sitio:** `kAGVPgXIHTM`.

### Portadas del blog — sistema medido, reproducible

```
Canvas           1200 × 630, JPEG calidad 88
Fondo            #2D6A4F plano
Barra vertical   x=60, ancho 11px, de y=75 a y=560, color #4EB887
Eyebrow          Inter Bold 30px MAYÚSCULAS #B5D7C7, x=102, y=101, tracking +0,5
Título           Inter Bold 70px blanco, x=102, líneas en y=202 y y=291
                 máximo 2 líneas, ancho máximo 740px
Sin footer
```

**Las portadas usan Inter, no Fraunces.** Verificado comparando bitmaps del título renderizado contra el original: Inter 70 px da 0,63 de coincidencia; Fraunces 72 px da 0,24. La regla "Fraunces solo en H1/H2" vale para el sitio renderizado, no para las piezas de imagen.

---

## La frontera

Nunca navy ni Montserrat en una pieza del sitio. Nunca verde ni Fraunces/Inter en una pieza de redes.

**Excepción documentada:** el hero del blog (1200×630) es capa web aunque lo produzca el mismo pipeline que genera el thumbnail de YouTube, que es capa redes. El hub etiqueta cada pieza con su capa: *Redes · Web · Texto · Mixta*.
