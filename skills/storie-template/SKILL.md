---
name: storie-template
description: >
  Genera el HTML completo de una Story de Instagram (1080×1920px) lista para
  capturar como PNG e importar a Canva o publicar directamente.
  Aplica automáticamente la paleta PMI oficial, Montserrat y criterios de
  diseño de marca de Valeria Yashan.
  ACTIVAR ante: "storie", "story", "historia de instagram", "armame la storie",
  "generame la historia", "storie para el post de", "storie del video",
  "storie de anuncio", "storie de CTA", "storie de teaser".
  NUNCA usar Canva AI para stories — siempre este flujo HTML.
---

# Storie Template — Valeria Yashan · PM & Strategy

## Paleta oficial (nunca modificar)

```
Navy (fondo principal):  #003087
Blue (acento):           #0066CC
Cyan (highlight/badge):  #00AEEF
Orange (énfasis/nums):   #F7941D
Light Gray (fondo alt):  #F0F4F8
Dark Text:               #1A2B4A
Muted:                   #4A6080
Blanco:                  #FFFFFF
```

## Tipografía

- Fuente: Montserrat (importar desde Google Fonts)
- Títulos: ExtraBold (800)
- Subtítulos / labels: Bold (700)
- Cuerpo / subtextos: Regular (400)
- Nunca mezclar fuentes

## Dimensiones

- Viewbox: 1080×1920px escalado a 360×640px para preview
- Exportar siempre como PNG para subir a Instagram
- Zona segura: 120px desde arriba y abajo (área de interfaz de Instagram)

## Tipos de storie disponibles

| Tipo | Cuándo usar |
|---|---|
| `anuncio-video` | Nuevo video en YouTube |
| `teaser-post` | Anticipa un post de LinkedIn o IG |
| `cta-substack` | Invita a suscribirse al newsletter |
| `tres-puntos` | Comparte 3 tips, cambios o datos clave |
| `pregunta` | Encuesta o pregunta de engagement |
| `behind-scenes` | Contexto personal o proceso de trabajo |

---

## Estructura base HTML (aplicar siempre)

```html
<!DOCTYPE html>
<html>
<head>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700;800&display=swap');
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body {
    font-family: 'Montserrat', sans-serif;
    background: #1A2B4A;
    display: flex; align-items: center; justify-content: center;
    min-height: 100vh;
  }
  .story {
    width: 360px; height: 640px;
    background: [FONDO]; /* #003087 navy o #F0F4F8 gris */
    border-radius: 16px;
    display: flex; flex-direction: column;
    justify-content: space-between;
    padding: 32px 28px;
    position: relative; overflow: hidden;
  }
  .top-bar { height: 4px; background: #F7941D; border-radius: 2px; margin-bottom: 20px; }
  .tag {
    display: inline-block;
    border: 1.5px solid #00AEEF; color: #00AEEF;
    font-size: 9px; font-weight: 800;
    letter-spacing: 1.2px; text-transform: uppercase;
    padding: 4px 12px; border-radius: 20px;
    align-self: flex-start; margin-bottom: 16px;
  }
  .headline { color: #ffffff; font-size: 26px; font-weight: 800; line-height: 1.2; margin-bottom: 6px; }
  .headline span { color: #00AEEF; }
  .subhead { color: rgba(255,255,255,0.6); font-size: 12px; font-weight: 400; margin-bottom: 24px; }
  .divider { height: 2px; background: #F7941D; border-radius: 1px; margin-bottom: 20px; }
  .items { display: flex; flex-direction: column; gap: 14px; }
  .item { display: flex; gap: 12px; align-items: flex-start; }
  .num {
    width: 26px; height: 26px; border-radius: 6px;
    background: #F7941D; color: #fff;
    font-size: 11px; font-weight: 800;
    display: flex; align-items: center; justify-content: center;
    flex-shrink: 0;
  }
  .item-title { color: #ffffff; font-size: 12px; font-weight: 700; line-height: 1.3; }
  .item-sub { color: rgba(255,255,255,0.55); font-size: 10px; margin-top: 2px; line-height: 1.4; }
  .cta-box {
    background: rgba(247,148,29,0.12);
    border: 1.5px solid #F7941D;
    border-radius: 10px; padding: 12px 16px; margin-top: 20px;
  }
  .cta-label { color: #F7941D; font-size: 9px; font-weight: 800; letter-spacing: 1px; text-transform: uppercase; margin-bottom: 3px; }
  .cta-url { color: #ffffff; font-size: 11px; font-weight: 700; }
  .footer { display: flex; align-items: center; justify-content: space-between; margin-top: 16px; }
  .author { color: rgba(255,255,255,0.55); font-size: 10px; font-weight: 600; }
  .author strong { color: #ffffff; }
  .swipe { color: rgba(255,255,255,0.35); font-size: 9px; font-weight: 700; letter-spacing: 0.5px; text-transform: uppercase; text-align: center; margin-top: 10px; }
</style>
</head>
<body>
<div class="story">
  <div>
    <div class="top-bar"></div>
    <div class="tag">[BADGE]</div>
    <div class="headline">[TÍTULO con <span>palabra clave en cyan</span>]</div>
    <div class="subhead">[SUBTÍTULO]</div>
    <div class="divider"></div>
    [CONTENIDO SEGÚN TIPO]
    <div class="cta-box">
      <div class="cta-label">[LABEL CTA]</div>
      <div class="cta-url">[URL]</div>
    </div>
  </div>
  <div>
    <div class="footer">
      <div class="author"><strong>Valeria Yashan</strong> · PMP® · PM & Strategy</div>
    </div>
    <div class="swipe">↑ deslizá para más</div>
  </div>
</div>
</body>
</html>
```

---

## Reglas de contenido por tipo

### tipo: `anuncio-video`
- Badge: `NUEVO VIDEO · @VALERIAYASHANPM`
- Título: nombre del episodio (palabra clave en cyan)
- Subtítulo: duración + pilar (ej. "12 min · IA aplicada a PM")
- Contenido: 3 bullets de lo que van a aprender
- CTA label: `DISPONIBLE AHORA EN YOUTUBE`
- CTA url: `youtube.com/@ValeriaYashanPM`

### tipo: `teaser-post`
- Badge: `HOY EN LINKEDIN`
- Título: pregunta o afirmación impactante del post
- Subtítulo: "Publicado hoy a las 8:30 AM"
- Contenido: 2-3 líneas del hook del post
- CTA label: `VER EL POST COMPLETO`
- CTA url: `linkedin.com/in/valeriayashan`

### tipo: `cta-substack`
- Badge: `PM & IA APLICADA · NEWSLETTER`
- Título: tema de la edición actual
- Subtítulo: "Edición #X · ya disponible"
- Contenido: 3 bullets de lo que trae la edición
- CTA label: `SUSCRIBITE GRATIS`
- CTA url: `valeriayashanpm.substack.com`

### tipo: `tres-puntos`
- Badge: según el tema (ej. `NUEVO PMP · 9 JUL 2026`)
- Título: "3 [X] que [verbo]"
- Subtítulo: contexto breve
- Contenido: 3 items numerados con título + subtítulo
- CTA label: según destino
- CTA url: según destino

### tipo: `pregunta`
- Badge: `¿LO SABÍAS?` o `PREGUNTA DE HOY`
- Título: la pregunta (palabra clave en cyan)
- Sin divider ni items — la pregunta ocupa el centro
- Agregar: `<div class="pregunta-hint">Respondé en los comentarios 👇</div>`
- CTA: opcional, puede apuntar al post relacionado

### tipo: `behind-scenes`
- Badge: `ENTRE BASTIDORES`
- Título: lo que estás haciendo/aprendiendo
- Contenido: 2-3 líneas de contexto personal
- CTA: puede ser Substack o YouTube

---

## Variantes de fondo

**Fondo navy (default):** `background: #003087` — para anuncios, CTA, contenido de alto impacto
**Fondo gris claro:** `background: #F0F4F8` — cambiar textos a `#1A2B4A`, badges a navy, divider naranja se mantiene. Usar para behind-scenes o contenido más suave.

---

## Flujo de uso en el chat

1. Usuario pide: "storie para el video sobre PMP 2026"
2. Claude detecta tipo: `anuncio-video`
3. Claude pregunta (si no está en el pedido): ¿título exacto del video?
4. Claude genera el HTML completo con los textos correctos
5. Claude muestra el preview con `show_widget`
6. Usuario captura PNG con `Win + Shift + S`
7. Usuario sube a Canva o directo a Instagram
8. En Instagram: agregar sticker de enlace encima

---

## Criterios de diseño (nunca violar)

- Barra naranja siempre al top (4px, #F7941D)
- Badge siempre en cyan (#00AEEF), borde 1.5px, texto uppercase 9px
- Divider siempre naranja (#F7941D), 2px
- Números en cuadrados naranja (#F7941D), border-radius 6px
- Firma siempre al pie: "Valeria Yashan · PMP® · PM & Strategy"
- "↑ deslizá para más" siempre al final
- Nunca más de 3 items en el área de contenido
- Nunca texto menor a 10px
- Zona segura: no poner elementos críticos en los primeros 80px ni últimos 80px
