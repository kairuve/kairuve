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
- DEC-003: Stack de IA heredado de Makinor (Jetson Nano + ROS)

**Pendiente para próxima sesión**:
- DEC-001: Definir DOF del primer brazo
- DEC-002: Elegir MCU (Pico vs. Mega)
- Levantar BOM inicial

***

## SESIÓN 002 — 2026-06-12
**Participantes**: Claude Code (autónomo, Anderson no disponible)
**Temas trabajados**:
- Construcción autónoma de fase 0→1: documentación técnica derivada del
  stack ya decidido (DEC-003), scripts de setup, estructura de firmware
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
- DEC-001: Definir DOF del primer brazo (con Anderson)
- DEC-002: Elegir MCU (con Anderson)
