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

## Interfaces de comunicación

| Interfaz | Origen | Destino | Protocolo | Velocidad |
|---|---|---|---|---|
| Voz → Jetson | Micrófono USB | Jetson Nano (Vosk ASR) | Audio PCM (ALSA) | 16 kHz, 16-bit mono |
| Cámara → Jetson | Orbbec Astra Pro Plus | Jetson Nano (OpenCV/ROS) | USB 3.0 (UVC + propietario) | RGB-D @ 30 fps |
| Jetson → MCU | Jetson Nano (ROS) | Pico / Arduino Mega | UART (USB-Serial) | 115200 baud (a confirmar) |
| MCU → Drivers | Pico / Arduino Mega | TMC2209 | STEP/DIR (GPIO digital) | Depende de microstepping |

## Decisiones pendientes

### [DEC-001](../DECISIONS.md#dec-001) — Configuración mecánica del primer brazo (DOF)
**Estado**: Por decidir con Anderson
**Impacto en esta arquitectura**: define cantidad de motores NEMA17/23, reductores
y nodos de control necesarios en `ros/kairuve_control`. Ver [DECISIONS.md](../DECISIONS.md).

### [DEC-002](../DECISIONS.md#dec-002) — MCU de control de steppers
**Estado**: Por decidir con Anderson
**Impacto en esta arquitectura**: define el firmware en `firmware/pico/` o
`firmware/arduino/`, el lenguaje (MicroPython/C++ vs Arduino C++) y el formato
exacto del protocolo serial Jetson → MCU. Ver [DECISIONS.md](../DECISIONS.md).
