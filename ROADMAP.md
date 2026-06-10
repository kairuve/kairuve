# ROADMAP.md — Kairuvë

## Fase 0 — Inicialización (actual)
- [x] Nombre y concepto definidos
- [x] Repositorio creado
- [ ] DEC-001: Configuración mecánica del primer brazo
- [ ] DEC-002: MCU de control elegido
- [ ] BOM inicial levantado

## Fase 1 — Prototipo mínimo (1 brazo, 2 DOF)
- [ ] Modelo FreeCAD del brazo (hombro + codo)
- [ ] Firmware básico en Pico/Arduino (control STEP/DIR)
- [ ] Comunicación serial Jetson → MCU funcionando
- [ ] Brazo físico sostiene un objeto en posición fija

## Fase 2 — Control por voz
- [ ] Pipeline Vosk integrado (comandos básicos: "sujeta", "suelta", "arriba", "abajo")
- [ ] Brazo responde a comandos de voz en español

## Fase 3 — Visión artificial
- [ ] Orbbec Astra Pro Plus detecta posición 3D del objeto
- [ ] MoveIt calcula IK y envía goal al brazo automáticamente

## Fase 4 — Sistema completo (2 brazos)
- [ ] Segundo brazo construido y calibrado
- [ ] Coordinación entre brazos vía ROS topics
- [ ] Manual de construcción publicado (ASSEMBLY.md completo)

## Fase 5 — Open-source release
- [ ] Documentación completa en español
- [ ] BOM final con precios actualizados
- [ ] Video demostrativo publicado
