# ARCHITECTURE.md — Arquitectura Kairuvë

## Diagrama de bloques

```
[Voz] → [Vosk ASR] → [Intent Parser] → [ROS Topic]
                                              ↓
[Orbbec Astra] → [OpenCV + Depth] → [MoveIt IK Goal]
                                              ↓
                              [Jetson Nano — ROS Melodic]
                                              ↓
                                    [UART Serial]
                                              ↓
                              [Pico / Arduino Mega]
                                              ↓
                              [TMC2209 Drivers]
                                              ↓
                         [NEMA 17/23 + Reductores Cicloidales]
                                              ↓
                                  [Brazo Físico — DOF 4–6]
```

## Componentes

### Capa de percepción
- Voz: Vosk (modelo español offline, ~50MB) + pyttsx3 (TTS local)
- Visión: OpenCV + Orbbec Astra Pro Plus (RGB-D, profundidad)

### Capa de decisión
- Cerebro: NVIDIA Jetson Nano 4GB / Ubuntu 18.04 (JetPack)
- Middleware: ROS Melodic + MoveIt (planificación + IK)

### Capa de actuación
- MCU: Raspberry Pi Pico o Arduino Mega
- Drivers: TMC2209 (UART, silenciosos)
- Motores: NEMA 17 (muñeca/base) · NEMA 23 (hombro/codo)
- Reductores: Cicloidales AliExpress 1:9 o 1:16
