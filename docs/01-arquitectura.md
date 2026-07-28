# Arquitectura

## Las tres capas

```
┌──────────────────────────────────────────────────────────────┐
│  HUB (hub-marca-personal.html)                               │
│  Interfaz. 27 formularios, un panel por módulo.              │
│  No contiene lógica de marca: la lleva en los prompts.       │
└──────────────────────────────────────────────────────────────┘
                              │
┌──────────────────────────────────────────────────────────────┐
│  PROMPTS (constantes dentro del HTML)                        │
│  PROFILE · WEB · CAPA_REDES · CAPA_WEB · SYSTEMS[modulo]     │
│  Cada módulo compone su system prompt con las que necesita.  │
└──────────────────────────────────────────────────────────────┘
                              │
┌──────────────────────────────────────────────────────────────┐
│  EJECUCIÓN                                                   │
│  A) fetch a api.anthropic.com desde el artifact              │
│  B) el chat, con skills + MCP (Canva, Notion, Drive, repo)   │
└──────────────────────────────────────────────────────────────┘
```

## Las constantes de contexto

Están al final del HTML, antes de `SYSTEMS`. Son la parte que hay que mantener al día — el resto es interfaz.

| Constante | Contiene |
|---|---|
| `PROFILE` | Perfil, pilares, voz, horarios de publicación, reglas de LinkedIn e Instagram, mención a IMR, umbral de comunidad, playlists, frases prohibidas |
| `WEB` | URLs canónicas del sitio, contacto real, slugs de blog verificados |
| `CAPA_REDES` | Paleta PMI, Montserrat, regla de fondos sólidos |
| `CAPA_WEB` | Verde `#2D6A4F`, Fraunces + Inter, fondo `#FAFAF8` |
| `SYSTEMS[id]` | Función por módulo que arma el prompt final con los valores del formulario |

**Regla de mantenimiento:** un dato de marca se cambia en la constante, nunca en el prompt de un módulo. Si aparece dos veces, la próxima edición va a dejar una desactualizada.

Las URLs y los slugs de `WEB` están ahí por un motivo concreto: sin esa lista el modelo inventa rutas que devuelven 404. La instrucción es explícita —*nunca inventar un slug que no esté en la lista*— y hay que ampliarla cuando se publica un artículo nuevo.

## Cómo ejecuta el hub

```javascript
const res = await fetch('https://api.anthropic.com/v1/messages', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    model: 'claude-sonnet-4-6', max_tokens: 1800,
    system, messages: [{ role: 'user', content: '...' }]
  })
});
```

Sin header de autenticación. La clave la resuelve el entorno del artifact. Fuera de ahí —archivo local, Cloudflare Pages, cualquier hosting— la llamada falla con 401 y el panel muestra *"Revisá la API key"*.

**Consecuencia de diseño:** el hub no puede vivir como una app independiente sin agregarle un backend que guarde la clave. Convertirlo en app pública significaría exponer una clave de API en el navegador, que es exactamente el error que documenta el marco de gobernanza. Si algún día se quiere autónomo, va con función serverless en Cloudflare Workers y la clave del lado del servidor.

## Techo de 1800 tokens

`max_tokens: 1800` alcanza para un post, un caption o una sección. **No alcanza para las 11 piezas del pipeline completo** ni para un artículo de blog largo. Esos van por el chat.

## Lo que el motor interno no puede hacer

| Necesidad | Modo A (artifact) | Modo B (chat) |
|---|---|---|
| Post de LinkedIn A+B | ✅ | ✅ |
| Caption, guión, SEO, newsletter | ✅ | ✅ |
| Carrusel en Canva | ❌ sin MCP | ✅ |
| Storie en Canva | ❌ | ✅ |
| Artículo al repo del sitio | ❌ | ✅ |
| Actualizar Notion | ❌ | ✅ |
| Verificar slugs contra el repo | ❌ | ✅ |
| Aplicar los skills de `skills/` | ❌ | ✅ |

## Mantenimiento: el hub y los skills pueden desincronizarse

Las secciones de calidad de contenido en los prompts del hub —anatomía de hooks,
pools de hashtags, escalas tipográficas, el filtro anti-IA— son **extractos manuales**
de los skills en `skills/`. El motor del hub no lee esos archivos en vivo: cada regla
que se quiere ahí adentro hay que copiarla a mano en la constante `PROFILE` o en el
`SYSTEMS[id]` del módulo correspondiente.

Consecuencia directa: si se edita una regla de voz, estructura o límite en un skill,
esa edición **no llega al hub sola**. Ya pasó una vez con `instagram-posts-SKILL.md`
—la copia del proyecto quedó desactualizada respecto a `skills/`— y es el mismo riesgo,
un nivel más adentro.

**Qué sí se copia al hub:** voz, anatomía de hooks, estructura, filtro anti-IA, pools
de hashtags, escalas tipográficas — todo lo que mejora la calidad del texto que el
motor puede generar solo.

**Qué NUNCA se copia al hub:** flujos de herramienta (los pasos de MCP de Canva, IDs
de Notion, secuencias de tool calls). El motor del hub no tiene tools — es una llamada
de texto puro a la API. Pegarle instrucciones de herramienta no las ejecuta: en el
mejor caso las ignora, en el peor las narra como si fueran parte del contenido.

---

## Dónde tocar para cambiar algo

| Quiero cambiar | Voy a |
|---|---|
| Un dato del perfil | Constante `PROFILE` |
| Un horario de publicación | Constante `PROFILE` |
| Un color o tipografía | `CAPA_REDES` o `CAPA_WEB` + `docs/02-sistema-visual.md` |
| Un slug nuevo del blog | Constante `WEB` |
| Lo que pide un módulo | La función correspondiente en `SYSTEMS` |
| Un campo del formulario | El `<div class="panel">` de ese módulo |
| Una regla de redacción | El skill correspondiente en `skills/` |
