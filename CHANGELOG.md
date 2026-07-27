# Changelog

Formato: fecha, qué cambió y por qué. Sin versiones semánticas — esto no es una librería.

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
