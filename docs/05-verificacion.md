# Verificación

Siete reglas. Ninguna es teórica: cada una salió de un error concreto que costó tiempo. Aplican a todo trabajo técnico —el sitio, el repo, Canva, Notion.

---

## 1 · Verificar contra la fuente remota, no contra el reporte

Un "listo" no confirma que el cambio se aplicó. Se confirma con el conteo del commit, un `git diff`, o un fetch a `raw.githubusercontent.com`.

**Caso:** en una sola sesión hubo tres "listo" que no estaban aplicados. La consulta al remoto los detectó las tres veces.

## 2 · Una consulta rara no es una conclusión

El CDN de GitHub cachea unos minutos. Antes de concluir que algo falló, esperar el TTL o buscar un segundo indicador independiente.

**Caso:** dos veces pareció que un push había fallado. Era caché.

## 3 · Saber qué valida cada chequeo antes de usarlo como prueba

**Caso:** en Astro, `image: z.string().optional()` valida que el campo sea texto, **no** que el archivo exista. El build compila con la ruta rota y se rompe recién en el navegador. Se afirmó lo contrario dos veces. El chequeo real hay que escribirlo aparte.

Corolario: el validador de enlazado cuenta links a cualquier sección interna, no solo a `/blog/`. Por eso un artículo puede figurar con "1 link interno" sin tener ningún enlace a otro artículo.

## 4 · Antes de reportar un error de regla, verificar que la regla siga vigente

**Caso:** tres de cada cuatro "errores" que marcó un validador eran reglas desactualizadas en la documentación, no contenido mal escrito.

## 5 · Predecir el número antes de actuar

*"Esto debería llevar el conteo de 56 a 46"* es falsable. *"Listo"* no lo es. Cuando el número no cierra, hay una edición que no pasó.

## 6 · Cuando falla la tercera hipótesis, la salida es hacerlo a mano

No una cuarta hipótesis.

**Caso:** se perdieron cuatro intentos con un párrafo que se resolvía en diez segundos pegándolo.

## 7 · Confirmar el directorio antes de una operación amplia

`git rev-parse --show-toplevel` antes de cualquier `git add -A`.

**Caso:** un `.git` suelto en `C:\Users\rootless` provocó dos veces que se stageara la carpeta de usuario entera.

---

## Regla cero — descargar antes de cerrar

Todo lo que produce el asistente vive en el contenedor y **no sobrevive al reinicio de sesión**. Un entregable que no se descargó, se perdió.

Antes de terminar cualquier sesión donde se generaron archivos: listarlos explícitamente y descargarlos. Es el primer paso del cierre, antes del archivo de continuidad y antes de Notion. No es una tarea para el día siguiente.

**Caso:** el repo `agentes-pm` —45 archivos, 118 pruebas, CI escrito— se generó el 24/07, no se descargó, y al día siguiente ya no existía. Se confirmó la pérdida con tres búsquedas independientes en el disco.

---

## Edición automatizada de archivos del sitio

CRLF + BOM es la combinación que rompe cualquier script sobre el repositorio del sitio. Nueve `.md` tienen BOM y la copia de trabajo usa CRLF por `core.autocrlf`.

Método que funciona: **reemplazo por cadena exacta, nunca regex sobre el contenido**, donde el texto "viejo" se genera leyendo el archivo real del remoto, con estas condiciones:

- El ancla **no puede incluir saltos de línea**. Un párrafo final arrastra el `\n` del archivo y no calza en CRLF.
- Leer con `[IO.File]::ReadAllText($p, [Text.Encoding]::UTF8)`, detectar BOM por bytes y reescribir con `New-Object System.Text.UTF8Encoding($conBom)`.
- Exigir que la cadena aparezca **exactamente una vez** o no tocar el archivo.
- Modo `-Simular` obligatorio antes de aplicar.
- Verificar con `git diff --shortstat` que el número de líneas sea el esperado. Si son miles, algo normalizó el archivo entero.
- Simular sobre copias en LF **y** en CRLF antes de generar los pares.

Si aun así un archivo no calza: resolverlo a mano, en vez de seguir depurando.
