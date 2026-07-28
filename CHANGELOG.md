# Changelog

Formato: fecha, qué cambió y por qué. Sin versiones semánticas — esto no es una librería.

## 2026-07-27 (madrugada, sesión 4) — Tres fuentes, tres números de hashtags: se resolvió a favor del más específico

Quedó anotado en la entrada anterior como hallazgo sin resolver: el hub y `PROFILE`
decían 3 hashtags máximo para Instagram, el skill `instagram-posts` decía máximo 5,
y la memoria del proyecto decía 8-12. Resuelto a favor del **3**, por ser la cifra
con el año explícito ("Instagram 2026") junto a otras reglas de plataforma verificadas
esa misma sesión (Originality Score, grabar a cámara directa) — el "8-12" no tenía
esa especificidad y encajaba con el patrón de cifra genérica sin fuente que el propio
filtro anti-IA del hub está diseñado para marcar.

Corregidas las cuatro menciones a "5" en `instagram-posts-SKILL.md` (máximo por post,
la combinación 2-3+1-2 que sumaba 5, el paso 3 del flujo, la regla crítica final),
sincronizado el skill instalado y la copia de este repo, y corregida la memoria del
proyecto. LinkedIn se mantiene en 3-5, eso no estaba en discusión.

## 2026-07-27 (madrugada, sesión 4) — El filtro anti-IA entra al hub, y un regex propio casi hace lo mismo que trataba de evitar

**Motivo.** Un carrusel generado desde el hub (Módulo P4) salió con guión largo decorativo,
una cita a GPT-4 como "la" herramienta actual, cifras inventadas sin fuente y un ángulo
que no sostenía la tesis fijada esa semana. Ninguno de esos problemas lo detecta el hub,
porque las reglas de calidad viven en los skills del proyecto — que el motor aislado
del hub nunca lee. Solo lee `PROFILE`.

**Extendido `PROFILE`** con el filtro anti-IA completo (las tres categorías del skill:
lenguaje de influencer automático, estructura mecánica —incluida la prohibición explícita
del guión largo como viñeta—, falta de autenticidad), una regla contra cifras sin fuente,
y una regla contra nombrar modelos de IA específicos como "la herramienta actual" — el
motor no tiene forma de saber cuál es la versión vigente en el momento en que se lee.

**Chequeo automático post-generación**, sin llamada extra a la API: `verificarSalida()`
corre sobre cada texto generado y busca guión largo, frases prohibidas, tres patrones
de cliché de IA, nombres de modelos, cifras sin palabra de fuente cerca, y ausencia de
tema de sesión fijado en los módulos de Producción. Los avisos se pintan en un bloque
naranja debajo de la salida — no bloquean, solo marcan qué revisar antes de publicar.

**Bug propio, encontrado probando contra el texto real de hoy:** el regex de "cifra sin
fuente" buscaba la palabra "según" sin límites de palabra — `/según/i` hace match dentro
de "segundos" (s-e-g-u-n-d-o-s contiene literalmente "segun"). El texto que decía
"en 40 segundos" pasaba como si dijera "según una fuente", exactamente el caso que el
chequeo debía atrapar. Corregido con `\bseg[uú]n\b`. Es el mismo principio que la
disciplina de verificación ya tiene registrado — un chequeo con un patrón demasiado
laxo puede fallar en silencio, y solo se detecta probándolo contra un caso real, no
contra el caso feliz.

**Bug propio #2, más chico:** al escribir el ejemplo de hook con un dato ("El 70%..."),
un escape de más (`%%` en vez de `%`) quedó en el texto del prompt de P1. Detectado y
corregido antes de commitear.

**Extendidos con contenido de calidad de los skills:** `p1` ganó la anatomía completa
de hooks con ejemplos y la lista de hooks a evitar. `p2` ganó el pool de hashtags por
pilar. `p4` se revisó y ya tenía la escala tipográfica completa — no hizo falta tocarlo,
mejor encontrarlo así que duplicar.

**Hallazgo sin resolver, para la próxima sesión:** hay tres números distintos para la
cantidad de hashtags de Instagram — el hub y `PROFILE` dicen 3 exactos, el skill
`instagram-posts` dice máximo 5, y la memoria del proyecto dice 8-12. No se resolvió
cuál es la regla vigente; se mantuvo el 3 del hub por ser el más específico, pero
falta confirmar y corregir las otras dos fuentes.

**Verificación.** Sintaxis validada con `node --check` dos veces (antes y después del
fix del regex). Prueba con el texto real del carrusel fallido de hoy: los cuatro avisos
esperados aparecen: guión largo, modelo de IA, cifra sin fuente, sin tema fijado. Prueba
con texto limpio: cero avisos, cero falsos positivos. Prueba de integración: el aviso
se pinta correctamente en el DOM al terminar `run()`.

## 2026-07-27 (madrugada) — Clave de API opcional, para usar el hub fuera del artifact

**Motivo.** El hub solo funciona sin clave dentro de un artifact de Claude.ai, donde
el entorno autentica la llamada por vos. Abierto de cualquier otra forma —doble clic
en el archivo, hosting propio— la misma llamada devuelve 401.

**Diseño elegido, de tres posibles.** Se descartó hardcodear la clave en el HTML
—queda en texto plano para cualquiera con el archivo o el repo, el mismo riesgo que
el teléfono que se sacó del fuente esta tarde, pero con costo de facturación en vez
de privacidad—. Se descartó también un backend propio que la guarde del lado del
servidor, por ser trabajo de infraestructura real, no un cambio de esta sesión.
Se implementó la opción del medio: un campo en el panel Home donde se escribe la
clave, guardada en una variable de JavaScript que vive solo mientras la pestaña
está abierta. Nunca toca el archivo, nunca `localStorage`, nunca un commit.

**Comportamiento.** Sin clave cargada, la llamada sale exactamente igual que antes
de este cambio — funciona sola dentro del artifact. Con clave cargada, se agregan
los tres headers que la API exige para llamadas directas desde el navegador:
`x-api-key`, `anthropic-version` y `anthropic-dangerous-direct-browser-access`.

**Verificación.** Sintaxis validada con `node --check`. Tres pruebas con `fetch`
simulado: sin clave el header no aparece, con clave aparecen los tres headers
correctos, y borrar limpia tanto la variable como el campo visual. Las tres pasan.

## 2026-07-27 (noche) — El fix de robustez rompía todo, por el sandbox del artifact

**Primer uso real, primer error real.** Al correr el pipeline por primera vez contra
la API de verdad —no simulada—, las 11 piezas fallaron con
`Failed to execute 'postMessage' on 'Window': AbortSignal object could not be cloned`.

**Causa: los artifacts corren en un iframe sandboxeado.** El `fetch` no llama a la
red directamente — se reenvía a la página padre por `postMessage`, que solo transporta
objetos clonables (texto, números, objetos planos). El `AbortSignal` que se había
agregado hoy mismo para el timeout de 2 minutos no es clonable, así que cada llamada
fallaba antes de llegar a la red.

**Por qué la prueba de la tarde no lo detectó.** Las seis pruebas con `fetch`
simulado validaban la lógica de reintento y encadenado, corriendo en Node — un
entorno sin la restricción de postMessage del sandbox. La prueba pasó porque no
reproducía la limitación real de donde el hub corre. Mismo error de fondo que la
disciplina de verificación ya tiene registrado: saber qué valida cada chequeo antes
de usarlo como prueba.

**Fix.** Se sacó el `AbortSignal` de la llamada a `fetch`. El timeout de 2 minutos se
logra igual, con `Promise.race` entre la petición y un temporizador — ninguno de los
dos es un objeto que necesite pasar por postMessage.

**Verificación repetida, esta vez con el sandbox simulado.** Se rehizo la suite de
pruebas con un `fetch` que rechaza cualquier campo que no sea `method`, `headers` o
`body` — reproduciendo la restricción real. Llamada individual, pipeline de 11 piezas
y reintento ante 429: las tres pasan.

**Aprendizaje de entorno, para cualquier herramienta futura con `fetch` dentro de un
artifact:** no pasar `AbortSignal`, ni ningún objeto no serializable, en las opciones
de una llamada de red. Un timeout se implementa con `Promise.race`, no con
`AbortController`.

## 2026-07-27 (tarde) — El hub estaba roto, y encadenado del pipeline

**Bug que impedía toda ejecución.** `run(id)` arrancaba con
`document.getElementById('btn-'+id)` y abortaba con `if (!btn||...) return;`, pero
ningún botón tenía `id`: 27 con `class="btn-run"`, cero con `id="btn-"`. La guarda se
disparaba siempre y la función salía antes de la llamada. Apretar Generar no producía
nada — ni salida, ni error, ni spinner. El hub nunca había generado una sola pieza.
Se descubrió al ir a construir el encadenado, no al usarlo: el pendiente "estrenar el
hub con un pipeline completo" llevaba tres días abierto.

**Encadenado.** Estado de sesión en memoria (`SESION`) con el tema de la semana y las
piezas ya generadas. Cada módulo recibe el tema más los primeros 320 caracteres de
cada pieza previa, con reglas explícitas de coherencia: sostener el ángulo y los datos,
no repetir el hook. El contexto queda acotado — medido, crece de 3.868 a 7.606
caracteres a lo largo de las 11 piezas.

**Pipeline en una corrida.** Botón que genera las 11 piezas secuencialmente, con
progreso pieza por pieza, botón de detener, y reporte de cuáles fallaron para
reintentarlas desde su panel. Exige tema fijado: sin tema, aborta.

**Techo de tokens por módulo.** El 1800 uniforme cortaba las piezas largas. Ahora:
4000 para el artículo del blog, 3000 para post A+B, guión y newsletter, 2500 para
carrusel, SEO, calendario, informe, competidores y los de KDP. El resto sigue en 1800.

**Robustez.** Hasta 3 intentos con espera creciente ante 429, 5xx, timeout o fallo de
red — nunca ante un error de request, que reintentar no arregla. Timeout de 2 minutos
por llamada con `AbortController`. La sesión no usa `localStorage`.

**Verificación.** Sintaxis validada con `node --check`. Seis pruebas con `fetch`
simulado: encadenado creciente, tokens por módulo, reintento ante 429, fallo definitivo
tras 3 intentos, pipeline completo de 11 piezas, y aborto sin tema. Las seis pasan y
cada predicción numérica cerró.

## 2026-07-27 — Auditoría del hub y remediación

Se auditó el hub con los cuatro controles no negociables. Veredicto: desplegar con
condiciones. Criticidad media — el hub no ejecuta nada, pero todo lo que produce sale
firmado por Valeria.

**Resuelto**
- Ownership nombrado en el README, con revisión trimestral fechada en octubre de 2026
- El control humano documentado como control deliberado, no como conveniencia, con la
  advertencia de qué cambia si algún día se conecta para publicar solo
- Teléfono sacado del fuente del hub: las dos apariciones de `wa.me/549…` pasaron a
  `valeriayashan.com.ar/wa`, el redirect 302 ya verificado contra producción. Un solo
  lugar para cambiarlo y fuera del fuente

**Pendiente de la auditoría, para la segunda iteración**
- Validador determinístico de salida: slugs contra la lista real, hex contra la capa
  declarada, las cuatro frases prohibidas. Es además el artefacto que `agentes-pm`
  necesita mostrar en público
- Delimitador explícito alrededor del texto pegado de terceros, marcándolo como dato
  y no como instrucción

**Nota:** el número sigue en la historia de git del commit `7a6fa88`. Mientras el repo
sea privado no está expuesto. Si alguna vez se hace público, sale con él.

## 2026-07-25 — Primer commit

Se versiona el sistema completo por primera vez, después de perder un repositorio entero por no haberlo descargado del contenedor.

**Incluye**
- `hub-marca-personal.html` v1.1 — 27 módulos en tres agentes, con el flujo MCP de Canva documentado en el panel Home
- 13 skills operativos de marca personal
- Seis documentos de sistema: arquitectura, sistema visual, reglas de plataforma, flujo Canva, verificación y límite público/privado
- Handoff del sitio, guía visual de posts y benchmarking de referentes
- Archivos de continuidad del 24 y 25 de julio

**Deja afuera a propósito**
- Skills de otros dominios, que tienen su propio contexto y no comparten reglas de marca
- El PDF del PMBOK 8 (material con licencia, no se versiona)

## Pendientes conocidos al momento del primer commit

- Canva: fondo del slide 1 del carrusel PMP a `#003087`; espaciado vertical de los slides 4 a 6; rehacer el post de Instagram `DAHQVhBkbP8` con el flujo MCP
- Estrenar el hub con un pipeline completo acompañado
- Neutralizar el `.git` suelto en `C:\Users\rootless`
- Rehacer el repositorio `agentes-pm` y publicarlo
