---
type: reference
title: "Decisions"
description: "Próximo DEC disponible: DEC-004"
tags: [decisions]
timestamp: 2026-06-25
---

# DECISIONS — Kairuvë

> **Próximo DEC disponible: DEC-004**
> (Gaps conocidos sin asignar: ninguno)
> **Últimas agregadas:** DEC-000, DEC-001, DEC-002, DEC-003

---

## Propósito

Registro de decisiones técnicas vigentes que afectan la implementación del proyecto.

**Formato estándar:**
```markdown
## DEC-NNN — Título decisión
**Fecha:** YYYY-MM-DD
**Contexto:** ...
**Decisión:** ...
**Alternativas consideradas:** ...
**Consecuencias:** ...
**Estado:** VIGENTE | SUPERSEDED | DEPRECATED
```

---

## DEC-000 — Separación brain técnico vs repo principal

**Fecha:** 2026-06-25
**Contexto:** kairuve-workspace/ tiene archivos MD planos en root (sin CURRENT/ARCHIVE).
**Decisión:** Crear `kairuve-brain/` como fuente de verdad técnica separada siguiendo modelo zhinova.
**Alternativas consideradas:**
- Usar archivos root como brain (descartado — no sigue modelo workspace)
- Migrar todo a estructura CURRENT/ARCHIVE en root (descartado — más invasivo)
**Consecuencias:**
- kairuve-brain/ contiene documentación técnica operativa
- Archivos root (STATUS.md, DECISIONS.md, etc.) quedan legacy (pueden deprecarse)
- Modelo consistente con arandur, garendil, valdhran, silforge, ikhari, durinforge
**Estado:** VIGENTE

---

## DEC-001 — Configuración mecánica 4 DOF

**Fecha:** 2026-06-15
**Contexto:** Caso de uso primario es sostener piezas y alcanzar herramientas en taller.
**Decisión:** 4 DOF — base + hombro + codo + gripper servo
**Alternativas consideradas:**
- 6 DOF con muñeca (pitch/roll) — descartado por costo (~$56–80 USD más) y complejidad innecesaria
**Consecuencias:**
- Configuración motores:
  - Joint 1 (Base): NEMA 17 + reductor cicloidal 1:9
  - Joint 2 (Hombro): NEMA 23 + reductor cicloidal 1:16
  - Joint 3 (Codo): NEMA 23 + reductor cicloidal 1:16
  - Joint 4 (Gripper): Servo MG996R (sin stepper)
- Simplifica firmware y reduce complejidad MoveIt IK
- Muñeca (pitch/roll) diferida Fase 4 si caso uso lo exige
**Estado:** VIGENTE

---

## DEC-002 — MCU Arduino Mega 2560

**Fecha:** 2026-06-15
**Contexto:** Necesidad de MCU para control steppers STEP/DIR con 3 drivers TMC2209.
**Decisión:** Arduino Mega 2560
**Alternativas consideradas:**
- Raspberry Pi Pico ($8 USD más barato) — descartado por ecosistema menos maduro para brazos robóticos con múltiples steppers
**Consecuencias:**
- Mayor disponibilidad en Huancayo/Perú
- Pines sobrados para 3 drivers TMC2209 + señales auxiliares
- Biblioteca AccelStepper ampliamente documentada
- Debug fácil via Arduino IDE Serial Monitor
- Firmware: C++ con AccelStepper + comunicación UART 115200 baud con Jetson Nano
**Estado:** VIGENTE

---

## DEC-003 — Stack IA heredado de Makinor

**Fecha:** 2026-06-10
**Contexto:** Kairuvë es módulo periférico de Makinor, mismo stack IA.
**Decisión:** Reusar stack de Makinor (Jetson Nano + ROS Melodic + Vosk + OpenCV)
**Alternativas consideradas:**
- Stack independiente — descartado por duplicar inversión y no reutilizar código
**Consecuencias:**
- Misma plataforma (NVIDIA Jetson Nano 4GB)
- Código reutilizable entre proyectos
- No duplicar inversión en desarrollo IA
**Estado:** VIGENTE

---

*Agregar nuevas decisiones técnicas al final de este archivo.*
