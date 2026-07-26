# Flujo Canva vía MCP

Dos flujos distintos: crear un diseño nuevo y editar uno existente. Confundirlos es la causa más frecuente de una sesión perdida.

---

## Premisa

**La generación con IA de Canva no respeta los colores de marca.** Da igual que se especifiquen los hex, que el Brand Kit esté cargado o que la instrucción sea explícita: aplica su propia paleta. Salida confiable solo por dos caminos —HTML con hex hardcodeados para importar a mano, o el flujo de base en blanco que sigue.

Caso testigo: el post `DAHQVhBkbP8`, generado por Canva AI, salió con imágenes de fondo, `#0066CC` como fondo de página, tipografía que no es Montserrat, tamaños con decimales y seis bloques de texto fuera del canvas. No es recuperable editando. Se rehace.

---

## Flujo A — crear un carrusel o diseño multipágina

1. `generate-design` con la query `"blank solid navy #003087 background, no text no images"`
2. `create-design-from-candidate`
3. `read-design` con `open_transaction: true` → devuelve los IDs de página
4. `edit-design` con operaciones `add_page`, pasando `background_color="#003087"` en cada slide nuevo
5. `add_text`, página por página
6. Segunda pasada de `edit-design` con `format_text` para aplicar colores y tamaños
7. `finalize: "commit"`

**Nunca** usar `generate-design` con el contenido completo para un carrusel.

---

## Flujo B — editar un diseño existente

1. `read-design` con `open_transaction: true` → devuelve `transaction_id` y el CDF con un `locator_id` por elemento
2. `edit-design`, **una llamada por página**, agrupando `format_text`, `replace_text`, `find_and_replace_text` y `resize_element`. Todas las operaciones de una llamada tienen que apuntar al mismo `page_index`
3. Revisar la miniatura que devuelve cada llamada
4. `edit-design` con `finalize: "commit"` y **sin operaciones**

Combinar operaciones con `finalize: "commit"` hace que la llamada se rechace.

---

## Trampas conocidas

**El fondo de página no se puede cambiar por MCP después de crear la página.** Se define en `add_page` o no se define. Rodeo posible: `insert_shape` con un rectángulo 1080×1350, path `M0 0H1080V1350H0Z` en el color de marca, y en una segunda llamada `layer_element` con `position: "back"` —el ID recién aparece después de la primera llamada, no se puede agrupar—. El fondo original queda debajo: hay que corregirlo a mano en Canva y borrar el rectángulo.

**`add_text` siempre crea texto negro y mal posicionado.** Siempre requiere la segunda pasada de `format_text`. No es opcional.

**`position_element` en páginas FIXED invierte las coordenadas** top/left. No usarlo ahí.

**Las coordenadas del CDF en páginas FIXED pueden verse fuera de rango** —por ejemplo, posición 1260 en un canvas de 1080— y renderizar bien igual. No corregirlas.

**Los IDs de páginas nuevas solo aparecen después de un `read-design` nuevo.**

**Al redimensionar texto, redimensionar también el contenedor** con `resize_element`. Para elementos TEXT se pasa únicamente `width`: la altura se recalcula sola.

**`upload-asset-from-url` solo acepta URLs públicas.** Las fotos de Valeria se suben manualmente desde Canva.

---

## Stories

Siempre en Canva vía MCP, con `generate-design` y `design_type: "your_story"`. Si Canva AI no respeta los colores, se genera el HTML como referencia visual y se replica a mano en Canva.

**Nunca** exportar un PNG desde HTML como entregable final para redes. El destino siempre es Canva.

---

## Referencias

| Recurso | ID |
|---|---|
| Brand Kit de redes | `kAGVPgXIHTM` |
| Plantilla base | `DAHMxLBzp18` — nunca editar la original |
| Carpeta de plantillas | `FAHMxE640Yo` |
| Carrusel PMP 2026 | `DAHQVoMCxpA` |
| Storie teaser | `DAHQVr3RlVc` |
| Post IG a rehacer | `DAHQVhBkbP8` |
