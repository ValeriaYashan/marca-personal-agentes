# CONTINUIDAD — Marca Personal · PM & Strategy
**Fecha:** 24/07/2026
**Proyecto Notion:** `38cc3df5-efcd-81f7-9e86-f2c599f22ef1`

---

## Estado del proyecto

Sistema de agentes completo y operativo: Hub unificado con Estrategia (10 módulos), Producción (11 piezas) y Monetización (6 módulos) funcionando en un solo HTML. Carrusel PMP 2026 de 6 slides construido en Canva vía MCP con flujo confirmado. Contenido del post PMP 2026 generado y listo para publicar.

---

## Decisiones tomadas en esta sesión

- **Orden del hub:** Estrategia → Producción → Monetización (sidebar y home en ese orden)
- **Flujo MCP Canva carruseles:** base en blanco → convertir → leer IDs → add_page → add_text → format_text → commit. Confirmado y documentado en memoria + skill + hub
- **M.O.R.E. en el carrusel:** reemplazar slide 4 item 3 por "Competencias de liderazgo ampliadas / Mindset, relaciones, criterio y expertise situacional" — M.O.R.E. no aparece con ese nombre en el ECO oficial
- **Fondo de diseño:** siempre sólido de marca, nunca imágenes de fondo. Regla consolidada en memoria
- **Stories:** siempre en Canva vía MCP `generate-design` con `design_type: "your_story"`, nunca flujo PNG directo desde HTML
- **Tipografía verificada:** tabla de tamaños confirmados en canvas 1080px (ver skill linkedin-posts actualizado)
- **Subtítulos muted:** siempre `#4A6080`, nunca cyan ni naranja

---

## Entregables generados

| Archivo | Estado |
|---|---|
| `hub-marca-personal.html` | ✅ Completo · v1.1 con flujo MCP en Home |
| `agente-monetizacion-conversion.html` | ✅ Completo · 6 módulos |
| `intake-wizard-SKILL.md` | ✅ Listo para subir al proyecto |
| `linkedin-posts-SKILL-updated.md` | ✅ Listo para reemplazar skill actual |
| `storie-template-SKILL.md` | ✅ Generado (ya existía en proyecto) |
| Carrusel PMP 2026 en Canva | ✅ `DAHQVoMCxpA` · 6 slides · fondo slide 1 pendiente corrección manual |
| Post LinkedIn PMP 2026 | ✅ Versión A + B generadas · listas para publicar |
| Caption Instagram PMP 2026 | ✅ Generado |
| Storie teaser post LinkedIn | ✅ En Canva `DAHQVr3RlVc` |
| Post feed Instagram | ✅ Generado · espacio reservado para foto de Valeria |

---

## Pendientes / Próximos pasos

1. **Subir al proyecto:** `intake-wizard-SKILL.md` + `linkedin-posts-SKILL-updated.md`
2. **Corregir slide 1 del carrusel** → abrir `DAHQVoMCxpA` en Canva → fondo de página → `#003087`
3. **Corregir slide 4 item 3** → reemplazar "Marco PMI M.O.R.E." por "Competencias de liderazgo ampliadas"
4. **Publicar post PMP 2026** en LinkedIn (L/M/V 8:30am) + Instagram (M/J/S 19:00) + storie teaser
5. **Publicar carrusel** en LinkedIn con caption generado
6. **Golden hour** del post de LinkedIn — primer comentario con link al simulador
7. **Foto de Valeria** en el post feed de Instagram — subir desde `/mnt/user-data/uploads/` a Canva manualmente
8. **Corregir typo** en slide 6: "Praticá" → "Practicá"

---

## Observaciones críticas

**Canva MCP — limitaciones confirmadas:**
- El fondo de página NO se puede cambiar vía MCP post-creación → definirlo en `add_page` con `background_color`
- `position_element` en páginas FIXED invierte top/left → posicionamiento siempre manual
- `generate-design` con contenido completo ignora colores → NUNCA usarlo para carruseles
- `add_text` crea textos en negro sin posición correcta → siempre segunda pasada con `format_text`
- IDs de páginas nuevas solo disponibles después de un nuevo `read-design`

**M.O.R.E.:** aparece mencionado en fuentes de preparación como énfasis temático del ECO 2026, pero NO figura con ese nombre en el PDF oficial del ECO. Usar formulación más precisa en contenido publicable.

**Foto de Valeria:** disponible en `/mnt/user-data/uploads/` — headshot navy, sentada silla v1, sentada silla v2. Siempre incluir en posts de Instagram. `upload-asset-from-url` de Canva MCP no acepta archivos locales — subir manualmente desde Canva.

---

## Skills activos para este proyecto

| Skill | Función |
|---|---|
| `linkedin-posts` (actualizado) | Posts + carruseles + flujo MCP tipografía |
| `storie-template` | Stories Instagram vía Canva MCP |
| `intake-wizard` | Cuestionario conversacional 27 módulos |
| `content-planner` | Calendario mensual |
| `youtube-script` + `youtube-seo` | Pipeline de video |
| `cierre-sesion` | Cierre + Notion |

---

## IDs y referencias técnicas

| Recurso | ID / URL |
|---|---|
| Carrusel PMP 2026 (Canva) | `DAHQVoMCxpA` · [editar](https://www.canva.com/d/VQ1BVXIqQiN1i5_) |
| Storie teaser (Canva) | `DAHQVr3RlVc` · [editar](https://www.canva.com/d/-vYWPAIsmHTIz4Z) |
| Post IG PMP 2026 (Canva) | `DAHQVhBkbP8` · [editar](https://www.canva.com/d/BxGHbOPzdhNF9Mk) |
| Hub unificado | `hub-marca-personal.html` (outputs) · v1.1 |
| Brand Kit Canva | `kAGVPgXIHTM` |
| Proyecto Notion Marca Personal | `38cc3df5-efcd-81f7-9e86-f2c599f22ef1` |
| Simulador PMP | `valeriayashan.com.ar/simulador` |
| Substack | `valeriayashanpm.substack.com` |

---

## Tipografía confirmada (canvas 1080px)

| Elemento | fontSize | fontWeight | color |
|---|---|---|---|
| Badge | 14px | bold | `#00AEEF` |
| Título 1-2 líneas | 80px | bold | `#ffffff` |
| Título 2-3 líneas | 52-56px | bold | `#ffffff` |
| Número destacado | 100px | bold | `#F7941D` |
| Subtítulo | 36px | normal | `#ffffff` |
| Item título | 24-26px | bold | `#ffffff` |
| Item énfasis | 24px | bold | `#F7941D` |
| Item subtítulo | 20px | normal | `#4A6080` |
| CTA URL | 24px | bold | `#F7941D` |
| CTA badge | 18px | bold | `#00AEEF` |
| Footer | 18px | normal | `#ffffff` |
| N / 6 | 18px | bold | `#4A6080` |
