# GRAPHIFY.md — Mapa visual del estado actual de Kairuvë

> Generado automáticamente por `/graphify` — sesión 2026-06-15.
> 45 nodos · 50 aristas · 15 comunidades detectadas.
> Fuente de verdad: ROADMAP.md, DECISIONS.md, SESSIONS.md, CONTRIBUTING.md.

---

## 1. Mapa de estado del proyecto

```mermaid
graph TD
    subgraph FASE0["✅ FASE 0 — Inicialización (completada)"]
        F0A[Nombre y concepto]
        F0B[Repositorio creado]
        F0C[Setup script Jetson]
        F0D[BOM inicial]
        F0E[ARCHITECTURE.md]
        F0F[Firmware stubs]
        F0G[ROS stubs]
    end

    subgraph FASE1["🔵 FASE 1 — Prototipo mínimo (ACTIVA — bloqueada)"]
        F1A[Modelo FreeCAD del brazo]
        F1B[Firmware STEP/DIR básico]
        F1C[Comunicación serial Jetson → MCU]
        F1D[Brazo sostiene objeto]
    end

    subgraph FASE2["⬜ FASE 2 — Control por voz"]
        F2A[Pipeline Vosk integrado]
        F2B[Brazo responde a voz]
    end

    subgraph FASE3["⬜ FASE 3 — Visión artificial"]
        F3A[Orbbec detecta posición 3D]
        F3B[MoveIt calcula IK automáticamente]
    end

    subgraph FASE4["⬜ FASE 4 — Sistema completo"]
        F4A[Segundo brazo]
        F4B[Coordinación ROS entre brazos]
    end

    subgraph FASE5["⬜ FASE 5 — Open-source release"]
        F5A[Docs completas en español]
        F5B[Video demostrativo]
    end

    subgraph DECISIONES["DECISIONES"]
        DEC001["🔴 DEC-001 PENDIENTE\nDOF del brazo\n(4 vs 6)"]
        DEC002["🔴 DEC-002 PENDIENTE\nMCU\n(Pico vs Arduino Mega)"]
        DEC003["🟢 DEC-003 VIGENTE\nStack IA heredado de Makinor\n(Jetson + ROS + Vosk + OpenCV)"]
    end

    subgraph CARPETAS["ESTADO DE CARPETAS"]
        DIR_DOCS["📁 docs/\n4 archivos"]
        DIR_FW["📁 firmware/\n2 READMEs stub"]
        DIR_ROS["📁 ros/\n2 READMEs stub"]
        DIR_SCR["📁 scripts/\nsetup_jetson.sh"]
        DIR_CAD["❌ cad/\nno existe"]
    end

    FASE0 --> FASE1
    FASE1 --> FASE2
    FASE2 --> FASE3
    FASE3 --> FASE4
    FASE4 --> FASE5

    DEC001 -. "bloquea" .-> FASE1
    DEC002 -. "bloquea" .-> FASE1
    DEC003 --> FASE1

    DEC001 -. "define cantidad" .-> DIR_DOCS
    DEC002 -. "define firmware" .-> DIR_FW
    DEC003 --> DIR_SCR

    style FASE1 fill:#dbeafe,stroke:#2563eb,color:#1e3a8a
    style DEC001 fill:#fee2e2,stroke:#dc2626,color:#7f1d1d
    style DEC002 fill:#fee2e2,stroke:#dc2626,color:#7f1d1d
    style DEC003 fill:#dcfce7,stroke:#16a34a,color:#14532d
    style DIR_CAD fill:#fef3c7,stroke:#d97706,color:#78350f
```

---

## 2. Árbol de archivos real

```
kairuve/kairuve/
│
├── README.md                          # Presentación del proyecto
├── DECISIONS.md                       # Decisiones de diseño (DEC-001, DEC-002, DEC-003)
├── ROADMAP.md                         # Fases del proyecto (0→5)
├── STATUS.md                          # Estado actual — leer primero cada sesión
├── SESSIONS.md                        # Log de sesiones de trabajo
├── CONTRIBUTING.md                    # Protocolo de sesión y destinos de escritura
│
├── docs/
│   ├── ARCHITECTURE.md                # Diagrama de bloques + interfaces de comunicación
│   ├── BOM.md                         # Lista de materiales (cantidades TBD hasta DEC-001/002)
│   ├── ASSEMBLY.md                    # Manual de ensamble (en construcción)
│   └── REFERENCES.md                  # Proyectos de referencia y recursos técnicos
│
├── firmware/
│   ├── pico/
│   │   └── README.md                  # Stub: firmware Pico pendiente de DEC-002
│   └── arduino/
│       └── README.md                  # Stub: firmware Arduino pendiente de DEC-002
│
├── ros/
│   ├── kairuve_control/
│   │   └── README.md                  # Stub: nodo brazo pendiente de DEC-001 + DEC-002
│   └── kairuve_vision/
│       └── README.md                  # Stub: nodo visión (Orbbec + OpenCV)
│
└── scripts/
    └── setup_jetson.sh                # Setup completo JetPack 4.6.x: ROS + MoveIt + Vosk

[❌ cad/]                              # No existe — pendiente hasta tener DEC-001
```

---

## 3. Mapa de dependencias de software

```mermaid
graph LR
    MIC["🎤 Micrófono USB"]
    ORBBEC["📷 Orbbec Astra Pro Plus\nRGB-D"]

    subgraph JETSON["NVIDIA Jetson Nano 4GB — Ubuntu 18.04 JetPack"]
        VOSK["Vosk ASR\n(español offline)"]
        TTS["pyttsx3 TTS"]
        OPENCVJ["OpenCV\n(detección color/forma)"]
        ROS["ROS Melodic"]
        MOVEIT["MoveIt\n(IK + planificación)"]
        PKG_V["kairuve_vision\nobject_detector_node.py"]
        PKG_C["kairuve_control\narm_controller_node.py"]
        PYSER["pyserial"]
    end

    subgraph MCU["MCU (DEC-002 pendiente)"]
        PICO["Raspberry Pi Pico\n(MicroPython/C++)"]
        MEGA["Arduino Mega\n(AccelStepper)"]
    end

    subgraph ACTUACION["Actuación"]
        TMC["TMC2209 Drivers\nSTEP/DIR"]
        NEMA["NEMA 17/23\n+ Reductores cicloidales"]
        GRIP["Servo Gripper\nMG996R"]
    end

    MIC --> VOSK
    VOSK --> TTS
    VOSK --> ROS
    ORBBEC -->|"USB 3.0"| OPENCVJ
    OPENCVJ --> PKG_V
    PKG_V -->|"/kairuve/object_pose"| MOVEIT
    MOVEIT --> PKG_C
    PKG_C --> PYSER
    PYSER -->|"UART 115200 baud"| PICO
    PYSER -->|"UART 115200 baud"| MEGA
    PICO -->|"STEP/DIR GPIO"| TMC
    MEGA -->|"STEP/DIR GPIO"| TMC
    TMC --> NEMA
    PKG_C --> GRIP

    style JETSON fill:#f0f9ff,stroke:#0369a1
    style MCU fill:#fefce8,stroke:#ca8a04
    style ACTUACION fill:#f0fdf4,stroke:#15803d
    style PICO stroke-dasharray: 5 5
    style MEGA stroke-dasharray: 5 5
```

---

## 4. Timeline de sesiones

```mermaid
timeline
    title Kairuvë — Sesiones de trabajo
    section 2026-06-10 — Sesión 001
        Anderson + Perplexity : Concepto del proyecto definido
                              : Nombre Kairuvë (quenya)
                              : DEC-003 tomada (stack IA Makinor)
                              : Estimado de costo ~$135-213 USD
    section 2026-06-12 — Sesión 002
        Claude Code autónomo : scripts/setup_jetson.sh creado
                             : docs/ARCHITECTURE.md completado
                             : docs/BOM.md completado
                             : firmware/pico + arduino README stubs
                             : ros/kairuve_control + vision README stubs
    section Próxima sesión — pendiente
        Anderson requerido : DEC-001 DOF del brazo (4 vs 6)
                           : DEC-002 MCU (Pico vs Arduino Mega)
```

---

## 5. Matriz de completitud

> Basada en los destinos de escritura definidos en `CONTRIBUTING.md`.

| Archivo / Carpeta esperado | Estado | Notas |
|---|---|---|
| `DECISIONS.md` | ✅ | DEC-001 y DEC-002 pendientes; DEC-003 vigente |
| `docs/BOM.md` | ✅ | Cantidades TBD bloqueadas por DEC-001/002 |
| `docs/ASSEMBLY.md` | 🚧 | Estructura prevista, sin contenido real aún |
| `docs/ARCHITECTURE.md` | ✅ | Completo con interfaces y decisiones pendientes |
| `docs/REFERENCES.md` | ✅ | 3 proyectos de referencia + recursos técnicos |
| `firmware/pico/` | 🚧 | Solo README stub — firmware pendiente DEC-002 |
| `firmware/arduino/` | 🚧 | Solo README stub — firmware pendiente DEC-002 |
| `ros/kairuve_control/` | 🚧 | Solo README stub — impl. pendiente DEC-001+002 |
| `ros/kairuve_vision/` | 🚧 | Solo README stub — impl. pendiente DEC-001 |
| `cad/freecad/` | ❌ | No existe — necesita FreeCAD + DEC-001 |
| `cad/stl/` | ❌ | No existe — necesita modelo CAD primero |
| `SESSIONS.md` | ✅ | 2 sesiones registradas |
| `STATUS.md` | ✅ | Actualizado a sesión 2026-06-12 |
| `ROADMAP.md` | ✅ | Fases 0–5 definidas |
| `scripts/setup_jetson.sh` | ✅ | Setup completo JetPack 4.6.x |

**Resumen**: 7 ✅ · 5 🚧 · 2 ❌

> Los 2 ❌ (cad/) y los 4 🚧 de firmware/ROS dependen de DEC-001 y DEC-002.
> Una vez tomadas esas decisiones con Anderson, el 🚧 se convierte en trabajo directo.
