---
type: reference
title: "Visión del Producto"
description: "Documento fundacional — qué es Kairuvë, para quién, y hacia dónde va. Claude Code debe leer este archivo antes de proponer cambios de arquitectura o nuevas funcionalidades."
tags: [vision, product, estrategia]
timestamp: 2026-06-29
---

# VISION.md — Kairuvë

## ¿Qué es Kairuvë?

Brazo robot manipulador de 4 grados de libertad (DOF) con control ROS Melodic, visión por computadora (Orbbec RGB-D), y firmware Arduino. Diseñado para tareas de pick-and-place y manipulación de objetos en entornos estructurados.

**Valor diferencial:** Hereda stack IA local de Makinor (Vosk STT + OpenCV) y combina control de motores stepper de precisión con visión 3D para manipulación autónoma.

## El problema que resuelve

**Problema:** Brazos robot educativos y comerciales:
- **Caros** (UR3/UR5 >$20k) o cerrados (no modificables)
- **Sin visión integrada** — requieren hardware adicional
- **Dependen de ROS2** — incompatible con Ubuntu 18.04 / Jetson Nano legacy
- **No aptos para makers** — kits educativos simplificados sin control real

**Solución:** Kairuvë permite:
1. Diseño CAD abierto (FreeCAD) para impresión 3D
2. Control motores stepper vía AccelStepper (Arduino)
3. Visión RGB-D (Orbbec Astra Pro Plus) para detección objetos
4. ROS Melodic master en Jetson Nano (compatible JetPack 4.x)
5. Stack IA local heredado de Makinor (Vosk, OpenCV)

## Para quién

**Usuarios primarios:**
1. **Makers/desarrolladores** — prototipo de brazo robot personalizable
2. **Investigadores/educación** — plataforma open-source para algoritmos de manipulación
3. **Proyectos autónomos** — pick-and-place en líneas de producción caseras

**Contexto de uso:**
- Indoor, entorno estructurado (mesa de trabajo)
- Tareas: pick-and-place, sorting, assembly simple
- Control: ROS topics + visión RGB-D
- Autonomía: detección objetos → planificación trayectoria → ejecución

> ⚠️ Pendiente — completar con Rodhan: casos de uso específicos (sorting objetos, assembly kits, servicio café), carga útil máxima (gramos), precisión requerida (mm)

## Arquitectura de producto

**Stack tecnológico:**
- **Plataforma principal:** NVIDIA Jetson Nano 4GB (compute + ROS master)
- **Middleware:** ROS Melodic (NO ROS2)
- **Firmware:** Arduino Mega 2560 (control motores stepper)
- **Motores:** 4x steppers (4 DOF: base, hombro, codo, muñeca)
- **Control:** AccelStepper library (Arduino)
- **Cámara:** Orbbec Astra Pro Plus (RGB-D)
- **Visión:** OpenCV (detección objetos, pose estimation)
- **IA local:** Vosk STT, ONNX Runtime (heredado de Makinor)
- **Diseño CAD:** FreeCAD (brazo 4 DOF, piezas imprimibles)

**Módulos core:**
```
firmware/arduino/        # AccelStepper, serial comm con ROS
ros/                    # ROS packages (control, visión, planning)
cad/                    # Diseño FreeCAD brazo 4 DOF
scripts/                # Calibración, test motores
docs/                   # BOM, ensamblaje
```

**Flujo principal:**
```
Cámara RGB-D → OpenCV detección objeto
      ↓
ROS node calcula pose 3D
      ↓
Planning trayectoria (ROS MoveIt o custom)
      ↓
Envía comandos a Arduino vía serial
      ↓
AccelStepper ejecuta movimiento motores
      ↓
Gripper recoge objeto (servo + sensores táctiles)
```

## Principios que Claude Code debe respetar

### 1. ROS Melodic, NO ROS2
- Middleware es ROS Melodic (compatible Ubuntu 18.04 / Jetson Nano)
- NO usar paquetes ROS2
- Heredar decisiones de Makinor sobre ROS

### 2. Stack IA local heredado de Makinor
- Vosk STT, OpenCV, ONNX Runtime — mismas librerías
- NO duplicar código — referenciar módulos de Makinor si posible
- Ver [Makinor DECISIONS.md](../../makinor-workspace/CURRENT/DECISIONS.md)

### 3. AccelStepper para control motores, NO ROS control directo
- Arduino Mega 2560 ejecuta control low-level
- ROS envía comandos high-level vía serial
- AccelStepper maneja aceleración/deceleración suave

### 4. Visión RGB-D obligatoria para pick-and-place
- NO confiar solo en coordenadas pre-programadas
- Orbbec Astra Pro Plus detecta pose objeto en 3D
- OpenCV + ROS para procesamiento

### 5. Diseño CAD abierto en FreeCAD
- NO usar software propietario (Fusion 360, SolidWorks)
- Piezas imprimibles 3D (PLA/PETG)
- BOM con componentes de mercado (steppers, Arduino, Jetson)

## Estado actual

**Fase:** ✅ Fase 1 — Prototipo mínimo (en preparación)

**Componentes:**
- ⏳ **Diseño CAD brazo 4 DOF** — pendiente crear cad/ en FreeCAD
- ⏳ **Firmware Arduino Mega 2560** — estructura creada (firmware/arduino)
- ⏳ **ROS Melodic packages** — estructura creada (ros/)
- ⏳ **Control steppers (AccelStepper)** — por implementar
- ⏳ **Stack IA (Vosk + OpenCV)** — heredado de Makinor, por integrar
- ❌ **Hardware físico** — sin ensamblar, solo diseño

**Stack tecnológico:**
- ✅ Jetson Nano 4GB definido
- ✅ ROS Melodic seleccionado
- ✅ Orbbec Astra Pro Plus (cámara RGB-D)
- ⏳ Arduino Mega 2560 + steppers (BOM por completar)

**Próximos pasos:**
1. Completar diseño CAD brazo 4 DOF en FreeCAD
2. Definir BOM completo (motores, drivers, sensores)
3. Implementar firmware Arduino (AccelStepper)
4. Crear ROS packages básicos (control, visión)
5. Primer prototipo físico ensamblado

Ver [STATUS.md](STATUS.md) para estado detallado.
