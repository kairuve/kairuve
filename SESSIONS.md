# SESSIONS.md — Kairuvë

Log de sesiones de trabajo. Una entrada por sesión.

***

## SESIÓN 001 — 2026-06-10
**Participantes**: Anderson + Perplexity
**Temas debatidos**:
- Concepto del proyecto: tercer brazo inteligente para makers/reparadores
- Nombre: Kairuvë (del quenya, "instrumento que fluye/alcanza")
- Plataforma: reusar Jetson Nano + stack Makinor
- Motores: NEMA 17/23 + reductores cicloidales AliExpress
- Stack de software: ROS + MoveIt + Vosk + OpenCV
- Estimado de costo: ~$135–213 USD por sistema de 2 brazos

**Decisiones tomadas**:
- [DEC-003](DECISIONS.md#dec-003): Stack de IA heredado de Makinor (Jetson Nano + ROS)

**Pendiente para próxima sesión**:
- [DEC-001](DECISIONS.md#dec-001): Definir DOF del primer brazo
- [DEC-002](DECISIONS.md#dec-002): Elegir MCU (Pico vs. Mega)
- Levantar BOM inicial

***

## SESIÓN 002 — 2026-06-12
**Participantes**: Claude Code (autónomo, Anderson no disponible)
**Temas trabajados**:
- Construcción autónoma de fase 0→1: documentación técnica derivada del
  stack ya decidido ([DEC-003](DECISIONS.md#dec-003)), scripts de setup, estructura de firmware
  y nodos ROS base

**Tareas completadas**:
- `scripts/setup_jetson.sh`
- `docs/ARCHITECTURE.md`
- `docs/BOM.md`
- `firmware/pico/README.md`
- `firmware/arduino/README.md`
- `ros/kairuve_control/README.md`
- `ros/kairuve_vision/README.md`

**Decisiones tomadas**: ninguna (Anderson no disponible)

**Archivos modificados**:
- `scripts/setup_jetson.sh` (nuevo)
- `docs/ARCHITECTURE.md`
- `docs/BOM.md`
- `firmware/pico/README.md` (nuevo)
- `firmware/arduino/README.md` (nuevo)
- `ros/kairuve_control/README.md` (nuevo)
- `ros/kairuve_vision/README.md` (nuevo)
- `STATUS.md`
- `SESSIONS.md`

**Pendiente para próxima sesión**:
- [DEC-001](DECISIONS.md#dec-001): Definir DOF del primer brazo (con Anderson)
- [DEC-002](DECISIONS.md#dec-002): Elegir MCU (con Anderson)

***

## SESIÓN 003 — 2026-06-15
**Participantes**: Anderson + Claude Code
**Tareas completadas**:
- [DEC-001](DECISIONS.md#dec-001) cerrada: 4 DOF (base + hombro + codo + gripper servo)
- [DEC-002](DECISIONS.md#dec-002) cerrada: Arduino Mega 2560 con AccelStepper
- BOM.md actualizado con cantidades definitivas para Fase 1

**Decisiones tomadas**: [DEC-001](DECISIONS.md#dec-001), [DEC-002](DECISIONS.md#dec-002)

**Archivos modificados**:
- `DECISIONS.md`
- `docs/BOM.md`
- `STATUS.md`
- `SESSIONS.md`

**Próxima sesión**: Diseño CAD en FreeCAD + crear estructura cad/freecad/ y cad/stl/

***

## SESIÓN 004 — 2026-06-20
**Participantes**: Claude Code (autónomo)
**Tareas completadas**:
- Sistema de referencias cruzadas implementado en todos los .md
- `scripts/validate-refs.sh` creado y ejecutado (✅ sin referencias sueltas)

**Decisiones tomadas**: ninguna

**Archivos modificados**:
- `DECISIONS.md`
- `STATUS.md`
- `ROADMAP.md`
- `SESSIONS.md`
- `CONTRIBUTING.md`
- `docs/ARCHITECTURE.md`
- `docs/BOM.md`
- `docs/GRAPHIFY.md`
- `firmware/pico/README.md`
- `firmware/arduino/README.md`
- `ros/kairuve_control/README.md`
- `scripts/validate-refs.sh` (nuevo)

**Próxima sesión**: Diseño CAD del brazo en FreeCAD (4 DOF) + crear cad/
