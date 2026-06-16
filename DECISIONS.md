# DECISIONS.md — Kairuvë

Decisiones de diseño vigentes. Nunca modificar sin debate previo con Anderson.
Si una decisión es superada, marcarla `[SUPERSEDED por DEC-XXX]`.

***

## DEC-001 — Configuración mecánica del primer brazo
**Estado**: Vigente
**Decisión**: 4 DOF — base + hombro + codo + gripper servo
**Razón**: Caso de uso primario es sostener piezas y alcanzar herramientas
en taller. 4 DOF es suficiente para ese uso. Reduce costo (~$56–80 USD menos
vs. 6 DOF), simplifica firmware y reduce complejidad MoveIt IK. Los joints
de muñeca (pitch/roll) quedan diferidos para Fase 4 si el caso de uso lo exige.
**Configuración de motores**:
- Joint 1 — Base: NEMA 17 + reductor cicloidal 1:9
- Joint 2 — Hombro: NEMA 23 + reductor cicloidal 1:16
- Joint 3 — Codo: NEMA 23 + reductor cicloidal 1:16
- Joint 4 — Gripper: Servo MG996R (sin stepper)
**Fecha**: 2026-06-15

***

## DEC-002 — MCU de control de steppers
**Estado**: Vigente
**Decisión**: Arduino Mega 2560
**Razón**: Mayor disponibilidad en Huancayo/Perú, pines sobrados para 3 drivers
TMC2209 + señales auxiliares, biblioteca AccelStepper ampliamente documentada
para control STEP/DIR, debug fácil via Arduino IDE Serial Monitor. El Pico es
más barato (~$8 USD) pero su ecosistema para brazos robóticos con múltiples
steppers es significativamente menos maduro.
**Firmware**: C++ con AccelStepper + comunicación UART 115200 baud con Jetson Nano
**Drivers**: 3× TMC2209 en modo STEP/DIR (uno por joint NEMA)
**Fecha**: 2026-06-15

***

## DEC-003 — Stack de IA (decidido — heredado de Makinor)
**Estado**: Vigente
**Decisión**: Reusar stack de Makinor (Jetson Nano + ROS Melodic + Vosk + OpenCV)
**Razón**: Misma plataforma, código reutilizable, no duplicar inversión
**Fecha**: 2026-06-10
