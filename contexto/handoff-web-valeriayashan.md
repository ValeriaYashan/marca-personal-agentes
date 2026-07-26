# Handoff — valeriayashan.com.ar
**Para:** agente hub-marca personal
**De:** proyecto web (Astro + Cloudflare Pages)
**Fecha:** 24 de julio de 2026
**Última actualización:** 24 de julio de 2026 — resueltas las deudas técnicas 1 y 2
**Estado del sitio:** en producción, activo

---

## 0. Cómo usar este documento

Este documento describe **el sitio web** como activo de la marca personal de Valeria Yashan: cómo está construido, qué reglas no se pueden romper, cómo se publica contenido y qué está pendiente.

No cubre LinkedIn, YouTube, Instagram, Amazon KDP ni Substack como canales — solo los puntos donde esos canales tocan el sitio.

Los datos marcados con ⚠️ **requieren verificación antes de usarse como base de una decisión**: pueden haber cambiado desde la fecha de este documento.

---

## 1. Perfil y posicionamiento

**Valeria Yashan** — PMP® #1613335 (activa desde 2013), MBA, Ingeniera Industrial.

- Project Manager en ejercicio (IMR Consulting, cliente YPF)
- Docente universitaria (USI · EGCI Escuela de Gerencia, España)
- Autora de 4 libros sobre Project Management publicados en Amazon
- Consultora en gestión de proyectos e IA aplicada

**Mercados:** Argentina, LATAM, España.

**Posicionamiento diferencial:** la combinación PM + IA aplicada + docencia + libros publicados. Ningún competidor directo del nicho hispanohablante cubre las cuatro.

**Objetivos comerciales del sitio, en orden:**
1. Consultoría y dirección de proyectos
2. Capacitación corporativa
3. Preparación para certificación PMP®
4. Productos digitales (libros, simulador, cursos)

---

## 2. El activo técnico

| Elemento | Valor |
|---|---|
| Dominio | `valeriayashan.com.ar` |
| Stack | Astro `^6.4.6` + Markdown, sin backend, sin base de datos |
| Dependencias | `@astrojs/sitemap ^3.7.3` — nada más |
| Node requerido | `>= 22.12.0` |
| Hosting | Cloudflare Pages (dash.cloudflare.com → Compute → Pages) |
| Repositorio | GitHub `ValeriaYashan/ValeriaYashan`, rama `main` |
| Deploy | Automático en cada push a `main` |
| Build command | `npm run build` · output `dist` |
| Ruta local | `C:\Users\rootless\Desktop\valeriayashan` |
| Entorno local | Windows · PowerShell 7.5.5 · VS Code |

**Criterio arquitectónico:** sitio estático, mínimo JavaScript, mantenible por una persona no desarrolladora. No introducir frameworks pesados, bases de datos ni backend sin justificación técnica explícita.

### Mapa de rutas

```
/                          Home
/sobre-mi                  Bio y credenciales
/servicios                 Índice de servicios
  /servicios/consultoria-pm
  /servicios/direccion-proyectos
  /servicios/capacitacion-pm
  /servicios/consultoria-ia
  /servicios/certificacion-pmp
  /servicios/clases-ia
/capacitaciones
/libro                     Los 4 libros + botones Amazon    ← URL CRÍTICA
/blog                      Listado con buscador y filtro por categoría
/blog/[slug]               Artículo individual
/recursos                  Descargables y lead magnets
/herramientas              Guías de herramientas (Asana, ClickUp, Trello,
                           Monday, Power BI, Notion, Zoho, Miro, Mural, Lucidchart)
/simulador                 Simulador PMP®
/cursos                    Cursos en Udemy
/webinars
/contenido                 Índice del dropdown de contenido
/contacto
/intensivo-pmp-2026        Landing de campaña
/pmp/c*                    Rutas de QR de los libros           ← URLs CRÍTICAS
/404
```

### Navegación principal

`Inicio · Sobre mí · Servicios ⌄ · Capacitaciones · Contenido ⌄ · Blog · Contacto`

Seis ítems con dos dropdowns. Ya está en el límite superior recomendado: **cualquier sección nueva se agrupa dentro de un dropdown existente, no se agrega al nivel principal.**

---

## 3. Reglas críticas — no negociables

1. **`/libro` nunca se elimina ni se renombra.** Está impresa en códigos QR dentro de los libros físicos que ya circulan.
2. **Las rutas `/pmp/c*` nunca se eliminan ni se renombran.** Mismo motivo.
3. **Ningún push sin `npm run build` local exitoso.** Un error de schema rompe el deploy completo y congela el sitio en la versión anterior, incluidos todos los cambios no relacionados que viajen en el mismo commit.
4. **Los títulos de artículos no superan los 60 caracteres.** Google trunca a partir de ahí, y el layout agrega `— Valeria Yashan` al `<title>`.
5. **No se agregan colores fuera de las variables CSS definidas.** Si hace falta uno nuevo, se documenta primero.
6. **No se publica contenido que suene a IA.** Ver sección 5.

---

## 4. Sistema visual

### Variables CSS en producción

```css
--color-accent:  #2D6A4F   /* verde — acción, énfasis, marca */
--color-bg:      #FAFAF8   /* fondo general — nunca #FFFFFF */
--color-surface: #F2F1EE   /* cards, secciones alternadas */
--color-text:    #1A1A1A
--color-muted:   #6B6B6B
--color-border:  #E0DFDB
```

Color de excepción: `#FF9900` — solo para botones de compra en Amazon (clase `btn-amazon`).

**Decisión de marca (24/07/2026): el sitio y las redes son dos capas visuales distintas y deliberadas.** El sitio usa verde `#2D6A4F` sobre `#FAFAF8` con Fraunces + Inter. Las redes usan la paleta PMI (navy `#003087`, naranja `#F7941D`) con Montserrat. No se mezclan: nada de navy en piezas del sitio, nada de verde en piezas de redes. El hub de marca personal etiqueta cada pieza con su capa.

### Tipografía

| Rol | Fuente | Peso |
|---|---|---|
| Títulos (H1, H2) | **Fraunces** (serif) | 700 / 900 |
| Todo lo demás | **Inter** (sans) | 400 / 500 / 600 |

Fraunces **solo** en títulos. Nunca en cuerpo, botones ni navegación. No se mezcla una tercera fuente.

### Lo que el diseño nunca hace

- Gradientes llamativos o fondos oscuros en páginas de contenido
- Animaciones de entrada en texto
- Sombras pesadas (la separación es por borde y fondo)
- Texto de plantilla o placeholder visible

### Canva

Brand kit ID: `kAGVPgXIHTM`. Al generar piezas, especificar siempre *"solid flat background color only, no gradients, no decorative shapes"* y repetir el hex `#2D6A4F` de forma explícita. Para insertar una página nueva en un diseño existente: generar aparte y después hacer merge.

---

## 5. Voz y criterio editorial

**Regla central: Valeria rechaza el texto que suena a IA.**

Lo que funciona:

- Primera persona, directo, sin pulir de más
- Voseo argentino
- Ejemplos concretos de proyectos reales, no genéricos
- Afirmaciones con costo: decir qué no funciona, no solo qué sí
- Párrafos cortos, sin relleno

Lo que no funciona:

- "En el mundo actual de la gestión de proyectos…"
- Listas de beneficios sin criterio de decisión
- Cierres motivacionales
- Adjetivos apilados ("robusto, potente y flexible")
- Simetría artificial (tres bullets porque quedan lindos tres)

**Delegación:** Valeria delega la mayoría de las decisiones de diseño y edición al criterio del agente ("lo que más convenga"). No espera que se le consulte cada elección menor. Sí espera que se le señale cuando algo tiene un costo real.

---

## 6. Blog — estructura y publicación

### Schema de contenido ⚠️ punto de falla más frecuente

El único archivo de configuración es `src/content.config.ts` (loader glob de Astro 6). El legacy `src/content/config.ts` fue eliminado el 24/07/2026: ya no existe en el repo y no debe recrearse.

```ts
schema: z.object({
  title: z.string(),
  description: z.string(),
  pubDate: z.coerce.date(),
  category: z.string(),
  tags: z.array(z.string()),
  image: z.string().optional(),
})
```

**Los cinco primeros campos son obligatorios.** Falta uno y el build corta con:

```
blog → [slug] frontmatter does not match collection schema. category: Required
```

`image` es el único opcional. Sin él, `ArticleCard` muestra un placeholder con la categoría y `BlogPostLayout` oculta el contenedor de portada; ninguno de los dos rompe. Con él, la ruta debe apuntar a un archivo que exista en `public/images/blog/`: si no existe, ahí sí se ve una imagen rota.

### Plantilla de frontmatter

```yaml
---
title: "Máximo 60 caracteres"
description: "150–160 caracteres, con la keyword principal y un beneficio claro."
pubDate: "AAAA-MM-DD"
category: "Herramientas"
tags: ["Tag1", "Tag2", "Tag3", "Tag4"]
image: "/images/blog/[slug].jpg"   # opcional — solo si el archivo existe
---
```

### Categorías en uso

Solo tres, y no se agregan más hasta superar los 50 artículos:

- `Project Management`
- `IA`
- `Herramientas`

El valor va exacto, con esa capitalización. Una variante ("PM", "herramientas") rompe el filtro de la página `/blog`.

### Qué renderiza el layout — no duplicar en el cuerpo

`BlogPostLayout.astro` ya inserta automáticamente:

- El **H1** con el título del frontmatter → **el cuerpo del `.md` no lleva `# Título`**
- Categoría y fecha
- Bio de la autora con foto y link a `/sobre-mi`
- Sección "Artículos relacionados"
- Bloque CTA de contacto
- Formulario de newsletter (Brevo, embed HTML)
- Lista de tags
- Link "← Volver al blog"

Agregar cualquiera de esos elementos dentro del Markdown genera duplicados visibles.

### Estructura recomendada del cuerpo

```
Párrafo de apertura: el problema, con la keyword en las primeras 100 palabras
## Secciones H2, una por subtema
Ejemplos concretos de experiencia real
## Para llevar          ← bloque de 3 conclusiones accionables
---
CTA de contacto (email + WhatsApp)
---
Links internos: mínimo 2 a artículos existentes
Cierre con Substack + YouTube
```

### Links internos — slugs verificados

Los 53 artículos publicados, leídos del repo el 24/07/2026. Se usan **sin barra final**, con ruta relativa:

```
/blog/5-prompts-chatgpt-pm
/blog/5-tareas-ia-pm
/blog/asana-para-gestion-de-proyectos
/blog/automatizar-reportes-proyectos-con-ia
/blog/certificaciones-pm-mercado-laboral-argentina
/blog/clickup-trello-monday-comparativa
/blog/como-armar-pmo-argentina
/blog/como-elegir-una-consultora-de-proyectos
/blog/como-implementar-gestion-de-proyectos
/blog/como-leer-preguntas-simulacro-pmp
/blog/como-mapear-un-proceso-antes-de-automatizarlo
/blog/cuando-cambia-examen-pmp-2026
/blog/cuando-empresa-busca-pm-senior
/blog/cuando-una-pyme-necesita-un-pm-externo
/blog/cuanto-dura-el-examen-pmp
/blog/diferencia-pmp-prince2-scrum-master
/blog/eficiencia-administrativa-pymes-datos-decisiones
/blog/enfoque-predictivo-gestion-proyectos
/blog/errores-comunes-estudiar-pmp
/blog/experiencia-requerida-para-el-pmp
/blog/fin-del-agilismo-que-esta-cambiando
/blog/frameworks-pm-no-resuelven-el-problema
/blog/gestion-proyectos-pymes-argentina
/blog/ia-generativa-gestionar-riesgos-proyectos
/blog/ia-no-reemplaza-pm-pero-si-a-otro
/blog/ia-para-gestionar-riesgos-proyectos
/blog/implementar-jira-en-un-equipo
/blog/implementar-monday-com-argentina
/blog/iso-21500-gestion-de-proyectos
/blog/jira-para-gestion-de-proyectos
/blog/jira-vs-clickup-que-elegir-para-tu-equipo
/blog/microsoft-project-alternativas
/blog/more-pmi-futuro-gestion-proyectos
/blog/notebooklm-para-project-managers
/blog/notion-ia-para-gestionar-proyectos
/blog/notion-para-gestion-de-proyectos
/blog/notion-sistema-gestion-proyectos-ingenieria
/blog/notion-vs-clickup-cual-elegir
/blog/perfil-pm-tipo-de-proyectos
/blog/plan-de-estudio-pmp-semanas
/blog/pm-ia-perfil-profesional-redefinicion
/blog/pmbok-8-nuevo-examen-pmp-2026
/blog/pmp-error-por-que-no-aprueban
/blog/pmp-vale-la-pena-en-argentina
/blog/por-que-fallan-proyectos-empresas-medianas
/blog/por-que-los-project-managers-necesitan-entender-ia
/blog/por-que-no-aprueban-el-pmp
/blog/predictivo-agil-hibrido-como-elegir
/blog/preguntas-practica-vs-simulacros-pmp
/blog/proyectos-tecnologia-argentina-errores
/blog/que-es-la-certificacion-pmp
/blog/requisitos-examen-pmp-2026
/blog/tener-el-pmp-no-te-hace-mejor-pm
```

**Nunca inventar un slug.** Para regenerar esta lista sin clonar:

```
https://api.github.com/repos/ValeriaYashan/ValeriaYashan/git/trees/main?recursive=1
```

filtrando por `src/content/blog/`. El hub de marca personal ya hace esa llamada al abrirse.

### Auditoría de links internos

`Select-String` con patrón `"/blog/"` **no detecta** los links a `/herramientas/`, `/contacto/` o `/sobre-mi/`. Para un relevamiento completo usar el patrón `"\(/"`. Un resultado de 0 con el patrón corto no significa que no haya links internos.

---

## 7. Workflow de publicación

Los cuatro pasos, en orden. Todos los comandos arrancan desde el `cd`.

**1 — Colocar el archivo**

```powershell
cd C:\Users\rootless\Desktop\valeriayashan
Copy-Item "$env:USERPROFILE\Downloads\[nombre].md" `
          "C:\Users\rootless\Desktop\valeriayashan\src\content\blog\[slug].md" -Force
```

**2 — Verificar frontmatter**

```powershell
cd C:\Users\rootless\Desktop\valeriayashan
Get-Content "C:\Users\rootless\Desktop\valeriayashan\src\content\blog\[slug].md" -TotalCount 8
```

**3 — Build (obligatorio antes del push)**

```powershell
cd C:\Users\rootless\Desktop\valeriayashan
npm run build
```

**4 — Commit y push**

```powershell
cd C:\Users\rootless\Desktop\valeriayashan
git add -A
git commit -m "mensaje descriptivo"
git push origin main
```

Nunca `git push` a secas: siempre `git push origin main`.

### Vista previa local

```powershell
cd C:\Users\rootless\Desktop\valeriayashan
npm run dev
```

Levanta en `http://localhost:4321/`. La ventana queda tomada mientras corre; para otros comandos, abrir una segunda. Se corta con Ctrl + C.

### Notas de entorno

- **Entrega de archivos:** siempre contenido completo listo para pegar, nunca diffs parciales. El flujo de Valeria es Ctrl+A → Delete → pegar → Ctrl+S en VS Code, o `Copy-Item` desde Descargas.
- **Descargas:** clic derecho → Guardar enlace como. El clic directo a veces sirve una versión cacheada.
- **Rutas absolutas:** `[System.IO.File]::ReadAllText` / `WriteAllText` requieren ruta absoluta. Las relativas resuelven a `C:\Windows\System32`.
- **Búsqueda de archivos:** `Get-ChildItem -Path "src" -Recurse -Filter "*.astro" | Select-String -Pattern "término"`. No usar `-Recurse` como parámetro directo de `Select-String`.
- **Error `index.lock`:** `Remove-Item C:\Users\rootless\Desktop\valeriayashan\.git\index.lock -Force`
- **`simulador.astro`** (63 KB) abre en blanco si se lo llama directo. Abrir con `code .` y navegar desde el explorador interno, o editarlo solo por PowerShell.
- **Colisión de rutas Astro:** nunca crear `servicios.astro` en la raíz de `pages` si ya existe `servicios/index.astro`. Una cosa o la otra.

---

## 8. Integraciones y endpoints

| Servicio | Detalle |
|---|---|
| Analytics | GA4 `G-DK70Z7NVB9` |
| Search Console | Verificado, sitemap enviado |
| Newsletter | Brevo — embed HTML (no iframe) en `BlogPostLayout.astro` y `recursos.astro` |
| Newsletter pública | Substack: `valeriayashanpm.substack.com` |
| Formularios | Formspree — Intensivo PMP 2026: `https://formspree.io/f/xvzeqyjq` |
| Agenda | Calendly: `calendly.com/valeriayashan/30min` |
| Email | `hola@valeriayashan.com.ar` (Cloudflare Email Routing → Gmail) |
| WhatsApp | `5491140791007` — formato correcto para `wa.me`, sin `+` ni espacios |
| LinkedIn | `linkedin.com/in/valeriayashan` |
| YouTube | `@ValeriaYashanPM` |
| Instagram | `@valeria_yashan` |
| Notion (gestión) | Página de proyecto `38cc3df5-efcd-81f7-9e86-f2c599f22ef1` |
| Calendar | Evento recurrente de blog `85u73fbicn4tvhhb3585r1igis` — martes y jueves 9 h Argentina |

**Schemas JSON-LD activos:** `Person` (home), `Book` + `ItemList` (`/libro`), `BlogPosting` + `Author` (artículos), `BreadcrumbList` (todas las páginas).

**Schemas que no se usan:** `HowTo` (depreciado por Google en 2023) y `FAQPage` (restringido a sitios de gobierno y salud desde marzo 2026).

---

## 9. Acceso al repositorio sin clonar

Para leer archivos del repo desde un agente:

```
https://raw.githubusercontent.com/ValeriaYashan/ValeriaYashan/main/[ruta]
```

Este es el método principal. La API de GitHub (`api.github.com`) alcanza el rate limit con frecuencia desde entornos compartidos. Cuando funciona, el listado completo de archivos sale en una sola llamada:

```
https://api.github.com/repos/ValeriaYashan/ValeriaYashan/git/trees/main?recursive=1
```

---

## 10. Deuda técnica conocida

**Resuelto el 24/07/2026** — las dos deudas históricas de esta sección ya no aplican: el campo `image` fue declarado en el schema activo y el `src/content/config.ts` legacy fue eliminado. Verificado en el repo, no solo en local. No volver a diagnosticarlas.

**1 — Nueve artículos tienen BOM (`EF BB BF`) antes del `---` de apertura.** Astro los tolera y el sitio compila, pero cualquier parser menos permisivo los va a leer como "sin frontmatter" y el error no va a nombrar la causa real. Afecta a: `5-tareas-ia-pm`, `clickup-trello-monday-comparativa`, `como-leer-preguntas-simulacro-pmp`, `errores-comunes-estudiar-pmp`, `por-que-los-project-managers-necesitan-entender-ia`, `por-que-no-aprueban-el-pmp`, `predictivo-agil-hibrido-como-elegir`, `preguntas-practica-vs-simulacros-pmp`, `requisitos-examen-pmp-2026`. Cualquier script que edite frontmatter debe leer con `utf-8-sig` y volver a escribir preservando el BOM.

**2 — Seis artículos sin archivo de portada.** No hay `.jpg` en `public/images/blog/` para: `como-mapear-un-proceso-antes-de-automatizarlo`, `implementar-jira-en-un-equipo`, `iso-21500-gestion-de-proyectos`, `jira-vs-clickup-que-elegir-para-tu-equipo`, `more-pmi-futuro-gestion-proyectos`, `que-es-la-certificacion-pmp`. Se ven con el placeholder de categoría, que es correcto visualmente. Cobertura actual: 47 de 53.

**3 — Cuatro portadas fuera del sistema tipográfico.** Usan una fuente que no es Fraunces ni Inter, centrada y sin la firma al pie: `cuando-cambia-examen-pmp-2026`, `cuanto-dura-el-examen-pmp`, `plan-de-estudio-pmp-semanas`, `notion-ia-para-gestionar-proyectos`. Son las que más desentonan en la grilla de `/blog`. Hay además un grupo intermedio con arco circular de fondo y firma solo con el dominio; ese es menos disruptivo y puede esperar.

**4 — Patrón de bug recurrente:** si `post.data.image` llega `undefined` en un componente, revisar primero la prop en la llamada (`image={post.data.image}` al invocar `ArticleCard`) antes que el schema o el frontmatter. Al 24/07/2026 las tres llamadas existentes son correctas: `blog/index.astro:152`, `blog/[...slug].astro:13` y `BlogPostLayout.astro:15`.

**5 — CSS en componentes interactivos:** cuando los estilos de un bloque `<style>` de página quedan pisados por `BaseLayout` en producción, aplicarlos vía `element.setAttribute('style', ...)` con hex hardcodeados, y envolver el JavaScript en una IIFE `(function(){ ... })()`.

**6 — Precisión SEO:** la distribución de enfoques del ECO (por ejemplo "50% ágil/híbrido") **no tiene porcentaje oficial en el PMBOK 8**. Usar "peso significativo" en lugar de cifras inventadas.


## 11. Pendientes vigentes

**Alto impacto en conversión:**

1. **Testimonios reales** para home, `/sobre-mi` y `/servicios/certificacion-pmp`. Es la palanca de conversión más grande que queda abierta. Hoy hay placeholders con iniciales. Formulario de recolección activo: `https://forms.gle/p4br1SpJkzbcKecAA`
2. **Métricas concretas en el hero:** "200+ profesionales · 4 libros · PMP® desde 2013"
3. **Pack de Prompts IA para PM** en Gumroad (USD 12, PDF terminado, sin publicar)
4. **URLs reales de Udemy** en `/cursos` — hoy apuntan a `udemy.com` genérico

**Posicionamiento:**

5. Schema `Course` en `/cursos`
6. Amazon Author Page completa
7. Secuencia de bienvenida en Brevo
8. Rehacer las 4 portadas fuera del sistema tipográfico y las 6 faltantes (ver sección 10). Capa visual **web**: verde `#2D6A4F` sobre `#FAFAF8`, Fraunces + Inter — no la paleta PMI de redes

**Escala:**

9. Paginación del blog cuando supere los 60–80 artículos
10. Breakpoint de tablet (768–1024 px) para las grillas

---

## 12. Lo que este documento no cubre

- Estrategia y calendario de contenido multiplataforma
- LinkedIn, YouTube, Instagram como canales
- Amazon KDP: maquetación, portadas, lanzamientos
- Materiales docentes (USI, EGCI)
- Proyectos de cliente (IMR, Puerto Bahía Blanca)

Cada uno de esos dominios tiene su propio skill y su propio contexto operativo.

---

## Anexo — Checklist antes de publicar un artículo

- [ ] Los cinco campos obligatorios del frontmatter están presentes
- [ ] Si lleva `image`, el `.jpg` existe en `public/images/blog/`
- [ ] `category` es exactamente `Project Management`, `IA` o `Herramientas`
- [ ] El título no supera los 60 caracteres
- [ ] La `description` está entre 150 y 160 caracteres e incluye la keyword
- [ ] El cuerpo **no** empieza con `# Título`
- [ ] Hay al menos 2 links internos con slugs verificados
- [ ] No se duplican bio, CTA, newsletter ni artículos relacionados
- [ ] No quedan comentarios `<!-- COMPLETAR -->` ni placeholders
- [ ] `npm run build` termina sin errores
- [ ] Revisado en `localhost:4321` antes del push
- [ ] Push con `git push origin main`
- [ ] Deploy en Cloudflare figura como **Success**
