---
type: concept
title: "Arquitectura Kairuve"
description: "Stack tecnológico brazo robótico 4 DOF para makers"
tags: [architecture, jetson, ros, arduino, opencv, onnx, vosk]
timestamp: 2026-06-30
resource: ../../kairuve/
---

# ARCHITECTURE.md — Kairuve

## Stack tecnológico

**Hardware:**
- Jetson Nano 4GB — SBC principal, corre ROS + IA
- Arduino Mega 2560 — control servos low-level
- NEMA 17/23 steppers — motores articulaciones
- Orbbec Astra Pro Plus — cámara RGB-D (visión + profundidad)
- Motor háptico — feedback táctil (opcional)

**Software base:**
- ROS Melodic — framework robótica (NO ROS2, compatibilidad Jetson Nano)
- Ubuntu 18.04 — SO Jetson (requerido por ROS Melodic)
- Arduino IDE/PlatformIO — firmware Mega

**IA (reutiliza stack Makinor):**
- Vosk STT — speech-to-text local offline
- OpenCV + MediaPipe — visión gestos (opcional)
- ONNX Runtime — inferencia modelos cuantizados
- (opcional) DeepSeek API — comandos complejos cloud

**Control de motores:**
- AccelStepper library (Arduino) — control steppers con aceleración
- ROS Serial — comunicación Jetson ↔ Arduino vía USB

## Módulos core

### 1. ROS Master (Jetson Nano)
Nodos ROS principales:
- `arm_controller` — cinemática inversa 4 DOF
- `vision_node` — RGB-D processing (detección objetos)
- `voice_node` — Vosk STT comandos de voz
- `trajectory_planner` — planificación movimientos suaves

### 2. Arduino Mega Firmware
- `AccelStepper` control 4 servos/steppers
- ROS Serial subscriber — recibe comandos high-level desde Jetson
- Safety limits — límites articulaciones hardware
- Emergency stop — botón físico + timeout watchdog

### 3. Visión RGB-D (Orbbec Astra Pro Plus)
- OpenCV detección objetos pick-and-place
- Cálculo coordenadas 3D (RGB + depth)
- Calibración cámara-brazo (transformación coordenadas)

### 4. IA Local (Vosk + ONNX)
- Vosk modelo español small — comandos voz offline
- ONNX modelo detección objetos cuantizado (MobileNet SSD)
- No depende cloud para operación básica

## Flujo principal

### Pick-and-place con voz
1. Usuario: "agarra el destornillador rojo"
2. Vosk STT → texto "agarra destornillador rojo"
3. `voice_node` parsea comando → objeto target + acción
4. `vision_node` identifica destornillador en RGB-D
5. Calcula coordenadas 3D objeto
6. `trajectory_planner` genera path cinemática inversa
7. `arm_controller` envía comandos → Arduino vía ROS Serial
8. AccelStepper ejecuta movimiento suave
9. Gripper cierra → objeto agarrado

### Casos de uso
- Sorting objetos pequeños (<500g)
- Assembly asistido (sostener piezas)
- Servicio café/té (posicionar taza)
- Tercer brazo inteligente para reparadores

## Integraciones externas

| Componente | Propósito | Fallback |
|-----------|-----------|----------|
| Orbbec Astra Pro Plus | Visión RGB-D | Coordenadas fijas (sin visión) |
| Vosk (local) | STT offline | Comandos manuales GUI |
| DeepSeek API (opcional) | Comandos complejos | Solo comandos simples locales |
| ROS Serial | Jetson ↔ Arduino | N/A (crítico) |

## Decisiones arquitectónicas clave

- **ROS Melodic únicamente** — NO ROS2 (compatibilidad Jetson Nano limitada)
- **Stack IA reutilizado de Makinor** — Vosk, OpenCV, ONNX idénticos (no duplicar)
- **AccelStepper en Arduino** — ROS envía high-level, Arduino ejecuta low-level
- **Visión RGB-D obligatoria** — pick-and-place requiere profundidad, no coordenadas fijas
- **Target: makers/reparadores** — "tercer brazo inteligente", no industrial

## Estado actual

**Pendiente:**
- Crear ARCHITECTURE.md, ROADMAP.md (esta sesión)
- Casos uso detallados: sorting, assembly, servicio café
- Carga útil: 500g estimada, precisión ±5mm estimada (requiere validación)
- Calibración cámara-brazo workflow
