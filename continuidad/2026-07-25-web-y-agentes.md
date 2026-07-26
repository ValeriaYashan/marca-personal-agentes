# Continuidad — 25/07/2026

Dos proyectos trabajados: **Marca Personal (sitio web)** y **agentes-pm (repo público nuevo)**.

Para retomar en otro chat: pegar este archivo y decir en qué punto se sigue.

---

# 1 · MARCA PERSONAL — SITIO WEB

**Notion:** `38cc3df5-efcd-81f7-9e86-f2c599f22ef1`
**Repo:** `ValeriaYashan/ValeriaYashan` · working dir `C:\Users\rootless\Desktop\valeriayashan`

## Estado

El blog quedó en **cero avisos** del validador. Verificado contra `main`, no contra el reporte local.

| | Al empezar | Ahora |
|---|---|---|
| Artículos | 53 | 52 |
| Huérfanos | 15 | 0 |
| Con menos de 2 links internos | 7 | 0 |
| Descriptions fuera de 150-160 | 40 | 0 |
| Títulos de más de 60 | 9 | 0 |
| Portadas faltantes o fuera de sistema | 11 | 0 |
| Links internos rotos | 0 | 0 |
| **Avisos del validador** | **56** | **0** |

## Decisiones de esta sesión

**Portadas unificadas en una sola variante.** Existían dos: 41 con verde plano `#2D6A4F` y 11 con panel oscuro `#1A4331` ocupando los primeros 827px. Se eligió la mayoritaria y se rehicieron las 52 por código. Sin footer, a pedido.

**Fusión de contenido duplicado.** `ia-generativa-gestionar-riesgos-proyectos` e `ia-para-gestionar-riesgos-proyectos` eran el mismo artículo escrito dos veces con seis días de diferencia. Sobrevive el segundo (972 palabras, 4 links entrantes, mejor estructurado por etapas del proceso). Se rescató de la otra la sección "Cómo integrarlo al proceso real". Redirect 301 en `public/_redirects`, dos links entrantes repuntados.

**Corrección de contenido en `more-pmi`.** El título decía "el nuevo estándar del PMI" y el cuerpo del propio artículo aclara que M.O.R.E. no es certificación ni reemplaza al PMBOK. Ahora dice "marco". Es el mismo error que ya se había corregido en el slide 4 del carrusel PMP.

**Método de edición: reemplazo por cadena exacta, nunca regex.** Con modo simulación, preservación de BOM y verificación por conteo.

## Sistema visual de portadas (medido, reproducible)

```
Canvas           1200 × 630, JPEG calidad 88
Fondo            #2D6A4F plano
Barra vertical   x=60, ancho 11px, de y=75 a y=560, color #4EB887
Eyebrow          Inter Bold 30px MAYÚSCULAS #B5D7C7, x=102, y=101, tracking +0,5
Título           Inter Bold 70px blanco, x=102, líneas en y=202 y y=291
                 máximo 2 líneas, ancho máximo 740px
Sin footer
```

**Las portadas usan Inter, no Fraunces.** Verificado comparando bitmaps del título renderizado contra el original: Inter 70px da 0,63 de coincidencia, Fraunces 72px da 0,24. La regla "Fraunces solo en H1/H2" vale para el sitio renderizado, no para las piezas de imagen.

## Pendientes, por rendimiento

1. **Activar `npm run check:strict`.** Con cero avisos acumulados pasa a ser una red: cualquier artículo nuevo fuera de norma rompe el build antes de Cloudflare.
2. **Normalizar los tags.** Hay cuatro grafías del mismo concepto — `Project Management` (38 usos), `gestión de proyectos` (7), `Gestión de Proyectos` (3), `Gestión de proyectos` (2) — y también `Carrera profesional` / `Carrera Profesional`. Astro genera una URL por cada una y ninguna concentra autoridad. Commit propio.
3. **Neutralizar el `.git` suelto en `C:\Users\rootless`.** Un commit, un archivo (`src/pages/sobre-mi.astro`). Ya provocó dos `git add -A` sobre la carpeta de usuario entera. Falta comparar hashes contra el archivo del repo bueno y, si coinciden, `Rename-Item C:\Users\rootless\.git .git-desactivado` y confirmar con `Test-Path` que devuelve `False`.
4. **Estrenar el hub** con un pipeline completo acompañado.
5. **Canva:** fondo del slide 1 a `#003087`, espaciado de los slides 4-6 del carrusel PMP, y rehacer el post de Instagram `DAHQVhBkbP8` con el flujo MCP.

## Observaciones críticas

**`image: z.string().optional()` no valida que el archivo exista.** Valida que sea texto. El build compila con la ruta rota y se rompe recién en el navegador. Lo afirmé al revés dos veces. El chequeo real hay que escribirlo aparte.

**CRLF + BOM rompe cualquier edición automatizada.** Nueve `.md` tienen BOM y el working copy usa CRLF. El ancla de un reemplazo no puede incluir saltos de línea: un párrafo final arrastra el `\n` del archivo y no calza. Simular sobre copias en LF **y** en CRLF antes de aplicar.

**El validador cuenta links a cualquier sección interna**, no solo a `/blog/`. Por eso un artículo puede figurar con "1 link interno" teniendo cero enlaces a otros artículos. Los dos criterios coincidieron en los mismos 7 archivos, pero si algún día el número no cierra, ahí está la explicación.

---

# 2 · AGENTES-PM — REPO PÚBLICO

**Notion:** `3a8c3df5-efcd-81e4-aea0-c2f1047a7501`
**Destino:** `github.com/ValeriaYashan/agentes-pm` · público · MIT
**Objetivo:** posicionamiento para vender capacitación en agentes de IA.

## Estado

Completo y probado en local: **45 archivos, 118 pruebas verdes, CI escrito**. Sin subir todavía — conviene resolver antes el `.git` del home.

## Decisión de alcance

**No se publica el sistema de marca personal.** Expondría contactos de outreach con nombres, módulos de monetización, pipeline KDP y estrategia de posicionamiento. Y además no demuestra criterio de ingeniería: son 27 prompts largos.

**Se publica la capa de coordinación**, que es lo difícil y lo que casi nadie muestra, junto con el marco de gobernanza y los errores del agente documentados. Ese es el diferencial frente a cualquier repo de "100 prompts".

## Contenido

**Documentos:** gobernanza (4 controles no negociables), verificación (7 reglas, cada una con el caso real que la originó), arquitectura (5 capas), diseño de skills, inyección de prompt.

**Herramientas:** `auditor_enlazado.py`, `generador_portadas.py`, `editor_seguro.ps1`, `detector_inyeccion.py`. Todas generalizadas, no atadas a su sitio.

**Implementación de referencia** — el sistema de 27 módulos, anonimizado, en cuatro capas:

- `orquestador.py` — deriva el orden del grafo de artefactos, valida ciclos e incoherencias, y trata "módulo irreversible sin aprobación humana" como error de catálogo
- `validador_salidas.py` — 10 tipos de verificación, 65 criterios sobre 18 artefactos (62% de cobertura, expuesta a propósito)
- `reintento.py` — tres frenos: tope, estancamiento, regresión
- `telemetria.py` — JSONL, con la columna que importa: no cuántas veces falla un criterio sino cuántas queda sin resolver
- `adaptadores.py` — cómo conectar un modelo real, sin credenciales

**Formación:** taller de 4 horas en 6 bloques (variantes de 90 min y de 2 días), 6 ejercicios con soluciones escritas para discutir, rúbrica de 4 dimensiones que se entrega al empezar.

## Pendientes

1. Crear el repo vacío en GitHub —sin README ni licencia— y hacer el primer push
2. Agregar el badge de CI al README una vez que Actions corra en verde
3. Descripción y topics: `ai-agents`, `ai-governance`, `llm`, `project-management`, `spanish`
4. **Confirmar Actions en verde antes de compartir el link.** Un badge rojo dice exactamente lo contrario de lo que el repo demuestra
5. Cerrar los 11 contratos de salida faltantes (62% → 100%)
6. Cerrar el lazo de telemetría: umbrales declarados en el catálogo, para que la señal aparezca sola en la validación

## Comandos

```bash
make demo      # cadena completa en un comando
make test      # 118 pruebas
make catalogo  # valida el catálogo del sistema multiagente
```

---

# 3 · APRENDIZAJES DE LA SESIÓN

Ya cargados en memoria. Van acá para que estén disponibles en un chat nuevo.

**Verificar contra la fuente remota, no contra el reporte.** Hubo tres "listo" que no estaban aplicados; la consulta al remoto los detectó cada vez.

**Una consulta rara no es una conclusión.** El CDN de GitHub cachea unos minutos. Dos veces pareció que un push había fallado y era caché. Esperar el TTL o buscar un segundo indicador independiente.

**Saber qué valida cada chequeo antes de usarlo como prueba.** El caso del schema de Astro.

**Predecir el número antes de actuar.** "Esto debería llevar el conteo de 56 a 46" es falsable; "listo" no lo es. Cuando el número no cierra, hay una edición que no pasó.

**Cuando la tercera hipótesis falla, la salida es hacerlo a mano**, no una cuarta hipótesis. Se perdieron cuatro intentos con un párrafo que se resolvía en diez segundos pegándolo.

**Confirmar el directorio antes de una operación amplia.** `git rev-parse --show-toplevel` antes de cualquier `git add -A`.

---

# 4 · ARCHIVOS GENERADOS HOY

| Archivo | Para qué |
|---|---|
| `portadas-52/` | Las 52 portadas 1200×630 sin footer |
| `aplicar-metadatos.ps1` + `metadatos.json` | 39 correcciones de título y description (aplicado) |
| `aplicar-enlaces.ps1` + `enlaces.json` | 19 inserciones de links internos (aplicado, 18 por script + 1 a mano) |
| `plan-enlazado-15-huerfanos.md` | Plan de links entrantes con el razonamiento de cada donante |
| `plan-enlazado-6-emisores.md` | Plan de links salientes |
| `metadatos-49-avisos.md` | Los textos corregidos, por si hay que revisar alguno |
| `portadas-sistema-y-entrega.md` | Auditoría de portadas y sistema visual medido |
| `agentes-pm/` | El repositorio completo, 45 archivos |
