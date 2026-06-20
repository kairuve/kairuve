# CONTRIBUTING.md — Kairuvë

> Instrucciones operativas para Claude Code.
> Define destinos de escritura y protocolo de cierre de sesión.

---

## Destinos de escritura por tipo de contenido

| Tipo de contenido | Repo | Ruta |
|---|---|---|
| Decisiones de diseño | `kairuve/kairuve` | [DECISIONS.md](DECISIONS.md) |
| Bill of Materials | `kairuve/kairuve` | [docs/BOM.md](docs/BOM.md) |
| Manual de ensamble | `kairuve/kairuve` | [docs/ASSEMBLY.md](docs/ASSEMBLY.md) |
| Arquitectura HW+SW | `kairuve/kairuve` | [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) |
| Referencias y papers | `kairuve/kairuve` | [docs/REFERENCES.md](docs/REFERENCES.md) |
| Firmware Raspberry Pi Pico | `kairuve/kairuve` | [firmware/pico/](firmware/pico/README.md) |
| Firmware Arduino Mega | `kairuve/kairuve` | [firmware/arduino/](firmware/arduino/README.md) |
| Nodo ROS — control de brazo | `kairuve/kairuve` | [ros/kairuve_control/](ros/kairuve_control/README.md) |
| Nodo ROS — visión y cámara | `kairuve/kairuve` | [ros/kairuve_vision/](ros/kairuve_vision/README.md) |
| Archivos CAD (.FCStd) | `kairuve/kairuve` | `cad/freecad/` |
| Archivos STL para impresión | `kairuve/kairuve` | `cad/stl/` |
| Log de sesiones | `kairuve/kairuve` | [SESSIONS.md](SESSIONS.md) |
| Estado del proyecto | `kairuve/kairuve` | [STATUS.md](STATUS.md) |
| Hoja de ruta | `kairuve/kairuve` | [ROADMAP.md](ROADMAP.md) |

> Hoy el proyecto tiene un solo repo. Cuando se creen repos adicionales
> (ej. `kairuve/kairuve-ros`, `kairuve/kairuve-firmware`), agregar filas
> a esta tabla — no modificar el flujo.

---

## Regla de cierre de sesión (obligatoria)

Al finalizar **cualquier** sesión de trabajo, Claude Code DEBE ejecutar estos pasos
en orden antes de hacer el commit final:

1. **Actualizar [STATUS.md](STATUS.md)**
   - Campo "Última sesión": fecha de hoy (YYYY-MM-DD)
   - Campo "Última tarea completada": resumen de una línea
   - Campo "Próxima tarea": siguiente pendiente según el contexto
   - Si hay alertas resueltas: eliminarlas de "Alertas para Perplexity"

2. **Agregar entrada a [SESSIONS.md](SESSIONS.md)**
   - Formato:
     ```
     ## Sesión YYYY-MM-DD
     **Tareas completadas**: [lista]
     **Decisiones tomadas**: [DEC-XXX o "ninguna"]
     **Archivos modificados**: [lista]
     **Próxima sesión**: [qué sigue]
     ```

3. **Verificar que no hay cambios sin commit** en ningún archivo modificado durante la sesión.

**Commit de cierre**: `docs: update STATUS.md + SESSIONS.md — sesión YYYY-MM-DD`

---

## Convenciones de commit

| Tipo de cambio | Prefijo |
|---|---|
| Documentación (docs, BOM, decisiones) | `docs:` |
| Firmware nuevo o modificado | `feat:` |
| Corrección de bug en firmware/código | `fix:` |
| Nodos ROS | `feat:` o `fix:` según aplique |
| Archivos CAD | `cad:` |
| Refactor sin cambio funcional | `refactor:` |
