# Qué no se publica

Decisión del 25/07/2026. Vale la pena releerla antes de mover cualquier archivo de este repo a uno público.

---

## La decisión

**El sistema de marca personal no se hace público.** Dos motivos, y el segundo pesa tanto como el primero.

**Riesgo.** Expone contactos de outreach con nombre y apellido —Cecilia Boggi, Gabriel Romano, Marco Calle, Alejandro Pérez Pons, entre otros—, los módulos de monetización, el pipeline KDP y la estrategia de posicionamiento completa. Nada de eso mejora por estar a la vista.

**No luce.** Son 27 prompts largos. No demuestran criterio de ingeniería. Un repositorio así se lee como cualquier otro "100 prompts para X", que es justo el género del que conviene diferenciarse.

---

## Lo que sí va a un repo público

`github.com/ValeriaYashan/agentes-pm` — público, MIT. El objetivo es posicionamiento para vender capacitación en agentes de IA.

Se publica **la capa de coordinación**, que es lo difícil y lo que casi nadie muestra, junto con el marco de gobernanza y los errores del agente documentados. Ese es el diferencial.

**Documentos:** gobernanza (los cuatro controles no negociables), verificación (siete reglas, cada una con su caso real), arquitectura en cinco capas, diseño de skills, inyección de prompt.

**Herramientas, generalizadas y no atadas al sitio:** `auditor_enlazado.py`, `generador_portadas.py`, `editor_seguro.ps1`, `detector_inyeccion.py`.

**Implementación de referencia** — el sistema de 27 módulos, anonimizado, en cuatro capas:

- `orquestador.py` — deriva el orden del grafo de artefactos, valida ciclos e incoherencias, y trata "módulo irreversible sin aprobación humana" como error de catálogo
- `validador_salidas.py` — 10 tipos de verificación, 65 criterios sobre 18 artefactos (62% de cobertura, expuesta a propósito)
- `reintento.py` — tres frenos: tope, estancamiento, regresión
- `telemetria.py` — JSONL, con la columna que importa: no cuántas veces falla un criterio, sino cuántas queda sin resolver
- `adaptadores.py` — cómo conectar un modelo real, sin credenciales

**Formación:** taller de 4 horas en 6 bloques (con variantes de 90 minutos y de 2 días), 6 ejercicios con soluciones escritas y una rúbrica de 4 dimensiones que se entrega al empezar.

### Estado

Se generó el 24/07 —45 archivos, 118 pruebas verdes, CI escrito— y se perdió al reiniciarse la sesión sin haberlo descargado. Hay que rehacerlo. Antes de eso conviene resolver el `.git` suelto del home.

### Pendientes de `agentes-pm`

1. Crear el repo vacío en GitHub —sin README ni licencia— y hacer el primer push
2. Agregar el badge de CI al README una vez que Actions corra en verde
3. Descripción y topics: `ai-agents`, `ai-governance`, `llm`, `project-management`, `spanish`
4. Confirmar Actions en verde **antes** de compartir el link. Un badge rojo dice exactamente lo contrario de lo que el repo demuestra
5. Cerrar los 11 contratos de salida faltantes (62% → 100%)
6. Cerrar el lazo de telemetría: umbrales declarados en el catálogo, para que la señal aparezca sola en la validación

---

## Checklist antes de mover un archivo de acá a un repo público

- [ ] ¿Tiene nombres de personas que no dieron consentimiento?
- [ ] ¿Tiene precios, márgenes o cifras de facturación?
- [ ] ¿Tiene el pipeline comercial o la lista de prospectos?
- [ ] ¿Tiene IDs de Notion, Drive o Canva de trabajo real?
- [ ] ¿Tiene direcciones de correo, teléfonos o enlaces de calendario?
- [ ] ¿Demuestra criterio técnico, o es solo un prompt largo?

Cualquier "sí" en las primeras cinco: no se mueve, se anonimiza. Un "no" en la última: no se mueve, no aporta.
