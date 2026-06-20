# firmware/pico — Firmware Raspberry Pi Pico

## Descripción
Firmware para Raspberry Pi Pico encargado del control de motores stepper
vía señales STEP/DIR hacia drivers TMC2209, recibiendo comandos desde
Jetson Nano por puerto serial.

## Requisitos
- MicroPython o C/C++ SDK (Pico SDK) — **a definir en [DEC-002](../../DECISIONS.md#dec-002)**

## Protocolo de comunicación serial con Jetson
- Formato de comandos: **a definir** (depende de [DEC-001](../../DECISIONS.md#dec-001) y [DEC-002](../../DECISIONS.md#dec-002))
- Transporte: UART sobre USB-Serial, ver [docs/ARCHITECTURE.md](../../docs/ARCHITECTURE.md)

## Estado
Firmware principal pendiente de [DEC-002](../../DECISIONS.md#dec-002).
