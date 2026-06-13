# ros/kairuve_vision

## Descripción
Paquete ROS de integración con la cámara Orbbec Astra Pro Plus para
detección de objetos y estimación de su posición 3D.

## Nodos planificados
- `object_detector_node.py`

## Topics ROS

### Publica
- `/kairuve/object_pose` (`geometry_msgs/PoseStamped`)

## Dependencias
- `rospy`
- `opencv-python`
- `astra_camera`

## Modelo de detección
OpenCV clásico (sin deep learning por ahora) — detección por bounding box
mediante color/forma.
