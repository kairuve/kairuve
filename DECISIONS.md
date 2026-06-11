# DECISIONS.md — Kairuvë

Decisiones de diseño vigentes. Nunca modificar sin debate previo con Anderson.
Si una decisión es superada, marcarla `[SUPERSEDED por DEC-XXX]`.

***

## DEC-001 — (pendiente) Configuración mecánica del primer brazo
**Estado**: Por decidir
**Opciones en debate**:
- 4 DOF (base, hombro, codo, gripper) — más económico, suficiente para sostener
- 6 DOF (+ muñeca pitch + roll) — más versátil, mayor costo y complejidad
**Criterio de decisión**: caso de uso primario (sostener piezas fijas vs. alcanzar herramientas)

***

## DEC-002 — (pendiente) MCU de control de steppers
**Estado**: Por decidir
**Opciones en debate**:
- Raspberry Pi Pico (MicroPython/C++, económico, UART nativo)
- Arduino Mega (más pines, comunidad más amplia, fácil de conseguir en Perú)
**Criterio de decisión**: disponibilidad local en Huancayo/Perú y facilidad de firmware

***

## DEC-003 — Stack de IA (decidido — heredado de Makinor)
**Estado**: Vigente
**Decisión**: Reusar stack de Makinor (Jetson Nano + ROS Melodic + Vosk + OpenCV)
**Razón**: Misma plataforma, código reutilizable, no duplicar inversión
**Fecha**: 2026-06-10
