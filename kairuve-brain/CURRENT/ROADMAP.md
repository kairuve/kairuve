---
type: concept
title: "Roadmap Kairuve"
description: "Fases y hitos brazo robótico 4 DOF para makers"
tags: [roadmap, phases, milestones, hardware, robotics]
timestamp: 2026-06-30
---

# ROADMAP.md — Kairuve

> ⚠️ Roadmap inicial — validar con Rodhan + Perplexity

## Estado actual
Fase Planificación — Hardware abierto brazo 4 DOF

## Fase 1 — Diseño Mecánico
- [ ] CAD completo 4 articulaciones (Onshape/FreeCAD)
- [ ] Selección motores (NEMA 17 vs NEMA 23)
- [ ] Diseño gripper pick-and-place
- [ ] BOM completo con costos
- [ ] Impresión 3D piezas prototipo (PLA/PETG)

## Fase 2 — Control Hardware
- [ ] Arduino Mega firmware AccelStepper
- [ ] Drivers steppers (A4988/TMC2208)
- [ ] Safety limits hardware + software
- [ ] Emergency stop físico
- [ ] Calibración home position

## Fase 3 — Integración ROS
- [ ] ROS Melodic setup Jetson Nano
- [ ] Nodos: arm_controller, trajectory_planner
- [ ] ROS Serial Jetson ↔ Arduino
- [ ] Cinemática inversa 4 DOF
- [ ] Movimientos básicos (up/down/left/right/grab/release)

## Fase 4 — Visión RGB-D
- [ ] Orbbec Astra Pro Plus setup
- [ ] Calibración cámara-brazo
- [ ] OpenCV detección objetos
- [ ] Cálculo coordenadas 3D pick-and-place
- [ ] Test precisión ±5mm objetivo

## Fase 5 — IA Local (Vosk + ONNX)
- [ ] Vosk STT español comandos voz
- [ ] Parser comandos → ROS actions
- [ ] ONNX MobileNet SSD detección objetos
- [ ] Integración opcional DeepSeek API comandos complejos

## Fase 6 — Casos de Uso
- [ ] Sorting objetos pequeños (<500g)
- [ ] Assembly asistido (sostener piezas)
- [ ] Servicio café/té (posicionar taza)
- [ ] Demo "tercer brazo inteligente"

## Fase 7 — Documentación Open Source
- [ ] Build guide completo
- [ ] Firmware documented
- [ ] ROS launch files + configs
- [ ] Video tutoriales ensamblaje
- [ ] GitHub release v1.0

## Próximos hitos inmediatos
- [ ] Completar CAD diseño mecánico
- [ ] Validar carga útil 500g target
- [ ] Confirmar compatibilidad ROS Melodic Jetson Nano
- [ ] Orden componentes electrónicos

## Métricas de éxito
- Precisión pick-and-place ±5mm
- Carga útil 500g mínimo
- Comandos voz 90%+ accuracy español
- Costo total <$300 USD BOM
