# CLAUDE.md — Kairuvë Workspace

Instrucciones para Claude Code al trabajar en este proyecto.

---

## Ruta del workspace

`/home/rodri/kairuve-workspace/`

---

## Repositorios identificados

| Repo | Propósito | Estado |
|------|-----------|--------|
| `kairuve-workspace` (es .git root) | Monorepo — firmware + ROS packages + scripts | ⏳ Fase 1 en preparación |
| `kairuve-brain` | Documentación técnica (fuente verdad operativa) | ✅ Creado 2026-06-25 |

---

## Brain repo

`kairuve-brain/` — fuente de verdad técnica operativa.

**IMPORTANTE:** `kairuve-workspace/` tiene archivos MD planos en root (STATUS.md, DECISIONS.md, etc.).
Usar `kairuve-brain/` como brain separado siguiendo modelo zhinova.

---

## Stack tecnológico

### Plataforma principal
- **NVIDIA Jetson Nano 4GB** — compute + ROS master
- **ROS Melodic** — framework robótica
- **Orbbec Astra Pro Plus** — cámara RGB-D para visión

### Microcontrolador
- **Arduino Mega 2560** — control steppers (STEP/DIR vía UART 115200 baud)
- **Firmware:** C++ con AccelStepper library
- **Drivers:** 3× TMC2209 (modo STEP/DIR)

### Actuadores (4 DOF)
- **Joint 1 (Base):** NEMA 17 + reductor cicloidal 1:9
- **Joint 2 (Hombro):** NEMA 23 + reductor cicloidal 1:16
- **Joint 3 (Codo):** NEMA 23 + reductor cicloidal 1:16
- **Joint 4 (Gripper):** Servo MG996R (no stepper)

### Software IA (heredado Makinor)
- **Vosk** — speech-to-text
- **OpenCV** — visión computacional
- **Python** — scripts de control

---

## Protocolo de inicio de sesión

**Orden obligatorio de lectura:**
1. `kairuve-brain/CURRENT/STATUS.md` — estado actual, pendientes, hardware
2. `kairuve-brain/CURRENT/DECISIONS.md` — decisiones técnicas vigentes (DEC-001/002/003)

**Para referencia histórica:**
- `kairuve-brain/ARCHIVE/SESSIONS.md`

**Archivos legacy (root):**
- `STATUS.md`, `DECISIONS.md`, `ROADMAP.md`, `SESSIONS.md` — pueden deprecarse

---

## Reglas de escritura al finalizar sesión

1. **Actualizar `kairuve-brain/CURRENT/STATUS.md`** con estado real:
   - Componentes implementados
   - Pendientes (CAD, firmware, ROS packages)
   - Hardware adquirido vs pendiente

2. **Si se toma decisión técnica nueva:**
   - Agregar en `kairuve-brain/CURRENT/DECISIONS.md` con formato DEC-NNN

3. **Agregar entrada en `kairuve-brain/ARCHIVE/SESSIONS.md`:**
   ```markdown
   ## Sesión NNN — YYYY-MM-DD
   **Duración:** Xh
   **Completado:** ...
   **Pendiente:** ...
   ```

4. **NO modificar** archivos MD en root (legacy)

---

## Convenciones de commit

| Repo | Formato |
|------|---------|
| `kairuve-brain` | `docs: sesión NNN — [resumen]` |
| `kairuve-workspace` | `feat: [feature]` / `fix: [bug]` / `docs: [doc]` |

**Semántica:**
- `feat:` — nueva funcionalidad
- `fix:` — corrección bug
- `refactor:` — cambio sin afectar funcionalidad
- `docs:` — documentación únicamente

---

## Gestores de paquetes

- **Arduino:** Arduino IDE / PlatformIO
- **ROS:** `apt` (ROS Melodic packages)
- **Python:** `pip` (Jetson Nano)

---

## Fase actual

**Fase 1 — Prototipo mínimo** (en preparación)

### Pendientes críticos
- [ ] Diseño CAD brazo 4 DOF en FreeCAD + crear cad/
- [ ] Firmware Arduino Mega 2560 (AccelStepper + UART)
- [ ] ROS package `kairuve_control`
- [ ] ROS package `kairuve_vision`
- [ ] Integración stack IA Makinor
- [ ] Adquisición hardware (NEMA 17/23 + reductores cicloidales + TMC2209)

---

## Reglas específicas de este proyecto

1. **MCU:** Arduino Mega 2560 — NO Raspberry Pi Pico (DEC-002)
2. **4 DOF únicamente** — muñeca (pitch/roll) diferida Fase 4 (DEC-001)
3. **Stack IA heredado de Makinor** — NO duplicar desarrollo (DEC-003)
4. **Comunicación Arduino-Jetson:** UART 115200 baud
5. **Control steppers:** AccelStepper library (STEP/DIR, no SPI/UART)
6. **Drivers:** TMC2209 en modo STEP/DIR (no stealthChop via UART)
7. **ROS distro:** Melodic (Ubuntu 18.04 en Jetson Nano)

---

## Contexto del proyecto

**Kairuvë** es un sistema de brazos robóticos fijos de mesa para makers y reparadores.

- **Caso uso primario:** Sostener piezas y alcanzar herramientas en taller
- **Configuración:** 4 DOF (base + hombro + codo + gripper)
- **Público objetivo:** Makers y reparadores en Huancayo/Perú
- **Relación con Makinor:** Módulo periférico independiente, mismo stack IA

---

## Notas para Claude Code

- **Proyecto robótica educativa** — fase conceptual, sin código funcional todavía
- **Prioridad:** CAD + firmware Arduino antes de ROS packages
- Archivos MD en root pueden deprecarse — usar kairuve-brain/
- Stack IA heredado de Makinor — reutilizar código existente
- Hardware no adquirido todavía — solo diseño

---

*Última actualización: 2026-06-25*
---

## Convenciones OKF — obligatorio en todo archivo MD del brain

### Frontmatter obligatorio
Todo archivo creado o modificado en CURRENT/ debe tener:
```yaml
---
type: concept | runbook | reference | log
title: "Título del documento"
description: "Descripción breve (1-2 líneas)"
tags: [tag1, tag2]   # máximo 5
timestamp: YYYY-MM-DD
# Campos opcionales:
volatile: true        # solo STATUS.md
resource: ../ruta/    # apunta a código/CAD/assets fuera del brain (DEC-002)
refs:                 # apunta a otros docs del brain (DEC-004)
  - OTRO-DOC.md
  - DECISIONS.md
---
```

### Cuándo usar resource: vs refs:
- `resource:` → el doc describe un artefacto externo al brain (código, CAD, config)
  Ejemplo: ARCHITECTURE.md que documenta src/modulo/ → resource: ../../src/modulo/
- `refs:` → el doc depende o referencia otros docs del brain
  Ejemplo: REQUIREMENTS.md que referencia GROWTH.md → refs: [GROWTH.md, ROADMAP.md]

### Cross-references entre documentos
- Siempre usar links Markdown con anclas: [DEC-014](DECISIONS.md#dec-014)
- Nunca duplicar contenido de otro doc — solo referenciar
- Decisiones superadas: marcar [SUPERSEDED por DEC-XXX] al inicio de la sección
- Antes de crear contenido nuevo, verificar que no existe ya en otro archivo del brain

### Numeración DEC
- Formato: DEC-001, DEC-002... (secuencial por proyecto)
- Scope en commit: feat(DEC-XXX): o docs(DEC-XXX):
- Consultar DECISIONS.md para saber el próximo número disponible

---

## Rutina de cierre de sesión — OBLIGATORIO

1. Actualizar STATUS.md (estado actual, commits recientes, alertas, próximos pasos)
2. git add . && git commit -m "docs: end-of-session sync $(date +%Y-%m-%d)"
3. git push (brain + repos de código que tuvieron cambios)

⚠️ Sin push al final de sesión, Perplexity lee datos desactualizados en GitHub
   la próxima vez que use MCP para tomar contexto del proyecto.
