---
type: log
title: "Status"
description: "Archivo volátil. Se sobreescribe completamente en cada sesión de Claude Code."
tags: [documentation]
timestamp: 2026-06-25
volatile: true
---

# STATUS — Kairuvë

> Archivo volátil. Se sobreescribe completamente en cada sesión de Claude Code.
> Propósito: contexto en tiempo real para toma de decisiones estratégicas.

## Sesión activa
- **Fecha:** 2026-06-25
- **Tareas completadas:** Creación estructura brain separada
- **Fase actual:** ✅ FASE 1 — Prototipo mínimo (en preparación)

---

## Estado del sistema

| Componente | Estado |
|-----------|--------|
| Diseño CAD brazo 4 DOF | ⏳ Pendiente crear cad/ en FreeCAD |
| Firmware Arduino Mega 2560 | ⏳ Estructura creada (firmware/arduino) |
| ROS Melodic packages | ⏳ Estructura creada (ros/) |
| Control steppers (AccelStepper) | ⏳ Por implementar |
| Stack IA (Vosk + OpenCV) | ⏳ Heredado de Makinor — por integrar |
| Hardware físico | ❌ Sin ensamblar — solo diseño |

---

## Stack tecnológico

### Plataforma principal
- **NVIDIA Jetson Nano 4GB** — compute + ROS master
- **ROS Melodic** — framework robótica
- **Orbbec Astra Pro Plus** — cámara RGB-D para visión

### Microcontrolador
- **Arduino Mega 2560** — control steppers (STEP/DIR vía UART 115200 baud)
- **Firmware:** C++ con AccelStepper library
- **Drivers:** 3× TMC2209 (modo STEP/DIR, uno por joint NEMA)

### Actuadores
- **Joint 1 (Base):** NEMA 17 + reductor cicloidal 1:9
- **Joint 2 (Hombro):** NEMA 23 + reductor cicloidal 1:16
- **Joint 3 (Codo):** NEMA 23 + reductor cicloidal 1:16
- **Joint 4 (Gripper):** Servo MG996R (no stepper)

### Software IA (heredado Makinor)
- **Vosk** — speech-to-text
- **OpenCV** — visión computacional
- **Python** — scripts de control

---

## Decisiones vigentes

### DEC-001 — Configuración mecánica 4 DOF
- **4 DOF:** base + hombro + codo + gripper servo
- **Razón:** Caso uso primario = sostener piezas + alcanzar herramientas en taller
- **Ahorro:** ~$56–80 USD vs 6 DOF, simplifica firmware + MoveIt IK
- **Muñeca (pitch/roll):** diferida Fase 4 si caso uso lo exige

### DEC-002 — MCU Arduino Mega 2560
- **Razón:** Mayor disponibilidad Huancayo/Perú, pines sobrados, AccelStepper documentado
- **Alternativa descartada:** Raspberry Pi Pico ($8 USD más barato, ecosistema menos maduro)

### DEC-003 — Stack IA heredado de Makinor
- **Decisión:** Reusar Jetson Nano + ROS Melodic + Vosk + OpenCV
- **Razón:** Misma plataforma, código reutilizable, no duplicar inversión

---

## Pendiente

| Tarea | Prioridad | Bloqueante |
|-------|-----------|-----------|
| Diseño CAD brazo 4 DOF en FreeCAD | ALTA | No |
| Crear carpeta cad/ con modelos | ALTA | CAD previo |
| Firmware Arduino (AccelStepper + UART) | ALTA | No |
| ROS package kairuve_control | MEDIA | Firmware |
| ROS package kairuve_vision | MEDIA | No |
| Integración stack IA Makinor | MEDIA | Firmware + ROS |
| Adquisición hardware (NEMA + reductores + TMC2209) | ALTA | Presupuesto |

---

## Deuda técnica

_(Ninguna — proyecto en fase conceptual)_

---

## Contexto del proyecto

**Kairuvë** es un sistema de brazos robóticos fijos de mesa para makers y reparadores.

- **Caso uso primario:** Sostener piezas y alcanzar herramientas en taller
- **Configuración:** 4 DOF (base + hombro + codo + gripper)
- **Plataforma:** NVIDIA Jetson Nano 4GB + Arduino Mega 2560
- **Relación con Makinor:** Módulo periférico independiente, mismo stack IA

---

## Estructura repositorio

```
kairuve-workspace/
├── firmware/
│   ├── arduino/          ← Control steppers STEP/DIR (AccelStepper)
│   └── pico/             ← Descartado (DEC-002)
├── ros/
│   ├── kairuve_control/  ← ROS package control brazo
│   └── kairuve_vision/   ← ROS package visión
├── scripts/              ← Scripts Python auxiliares
├── docs/                 ← Documentación técnica
├── cad/                  ← ⏳ Pendiente crear (modelos FreeCAD)
├── STATUS.md             ← Legacy (root)
├── DECISIONS.md          ← Legacy (root)
├── ROADMAP.md            ← Legacy (root)
└── SESSIONS.md           ← Legacy (root)
```

---

## Alertas para usuario

- **kairuve-workspace/ NO tiene estructura CURRENT/ARCHIVE** — archivos planos en root
- **kairuve-brain/ creado como brain técnico separado** — seguir modelo zhinova
- **Fase 1 en preparación** — sin código funcional todavía
- **Proyecto robótica educativa** — makers + reparadores en Huancayo/Perú
- **Stack IA heredado de Makinor** — reutilizar código existente

---

*Última actualización: 2026-06-25 por Claude Code*
