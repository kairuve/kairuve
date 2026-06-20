# ros/kairuve_control

## Descripción
Paquete ROS que recibe goals de MoveIt y los traduce a comandos seriales
para el MCU (Pico/Arduino Mega) que controla los motores del brazo.

## Nodos planificados
- `arm_controller_node.py`

## Topics ROS

### Suscribe
- `/kairuve/arm_goal` (`geometry_msgs/Pose`)

### Publica
- `/kairuve/arm_status` (`std_msgs/String`)

## Dependencias
- `rospy`
- `pyserial`
- `geometry_msgs`

## Estado
Implementación pendiente de [DEC-001](../../DECISIONS.md#dec-001) (DOF) y [DEC-002](../../DECISIONS.md#dec-002) (MCU).
