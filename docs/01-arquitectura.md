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
