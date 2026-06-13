#!/bin/bash
set -e  # detener si cualquier comando falla
echo "=== Kairuvë — Setup Jetson Nano ==="
echo "JetPack 4.6.x requerido. Ejecutar como usuario normal (no root)."

# ─────────────────────────────────────────────────────────
# 1. Expandir swap a 4GB (necesario para compilar ROS + MoveIt en 4GB RAM)
# ─────────────────────────────────────────────────────────
echo ""
echo "--- 1/10: Expandiendo swap a 4GB ---"
sudo fallocate -l 4G /var/swapfile
sudo chmod 600 /var/swapfile
sudo mkswap /var/swapfile
sudo swapon /var/swapfile
echo '/var/swapfile swap swap defaults 0 0' | sudo tee -a /etc/fstab

# ─────────────────────────────────────────────────────────
# 2. Actualizar sistema
# ─────────────────────────────────────────────────────────
echo ""
echo "--- 2/10: Actualizando sistema ---"
sudo apt-get update && sudo apt-get upgrade -y

# ─────────────────────────────────────────────────────────
# 3. Instalar ROS Melodic Desktop-Full
#    fuente: http://wiki.ros.org/melodic/Installation/Ubuntu
# ─────────────────────────────────────────────────────────
echo ""
echo "--- 3/10: Instalando ROS Melodic Desktop-Full ---"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get update
sudo apt-get install -y ros-melodic-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

# ─────────────────────────────────────────────────────────
# 4. Instalar MoveIt para Melodic
# ─────────────────────────────────────────────────────────
echo ""
echo "--- 4/10: Instalando MoveIt ---"
sudo apt-get install -y ros-melodic-moveit

# ─────────────────────────────────────────────────────────
# 5. Crear workspace catkin
# ─────────────────────────────────────────────────────────
echo ""
echo "--- 5/10: Creando workspace catkin ---"
source /opt/ros/melodic/setup.bash
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
catkin_make
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

# ─────────────────────────────────────────────────────────
# 6. Instalar Orbbec Astra SDK + nodo ROS
# ─────────────────────────────────────────────────────────
echo ""
echo "--- 6/10: Instalando driver Orbbec Astra ---"
sudo apt-get install -y ros-melodic-astra-camera ros-melodic-astra-launch

# ─────────────────────────────────────────────────────────
# 7. Instalar dependencias Python 3
# ─────────────────────────────────────────────────────────
echo ""
echo "--- 7/10: Instalando dependencias Python 3 ---"
pip3 install pyserial vosk pyttsx3 opencv-python

# ─────────────────────────────────────────────────────────
# 8. Descargar modelo Vosk español (small, ~50MB)
# ─────────────────────────────────────────────────────────
echo ""
echo "--- 8/10: Descargando modelo Vosk español ---"
mkdir -p ~/models/vosk
cd ~/models/vosk
wget https://alphacephei.com/vosk/models/vosk-model-small-es-0.42.zip
unzip vosk-model-small-es-0.42.zip
rm vosk-model-small-es-0.42.zip

# ─────────────────────────────────────────────────────────
# 9. Habilitar acceso al puerto serial USB (para MCU vía USB-UART)
# ─────────────────────────────────────────────────────────
echo ""
echo "--- 9/10: Habilitando acceso al puerto serial USB ---"
sudo usermod -a -G dialout $USER
echo "NOTA: Reiniciar el Jetson para aplicar cambios de grupo serial y swap."

# ─────────────────────────────────────────────────────────
# 10. Resumen final
# ─────────────────────────────────────────────────────────
echo ""
echo "--- 10/10: Setup completado ---"
echo "=== Kairuvë — Resumen de instalación ==="
echo "  [OK] Swap expandido a 4GB"
echo "  [OK] Sistema actualizado"
echo "  [OK] ROS Melodic Desktop-Full instalado"
echo "  [OK] MoveIt instalado"
echo "  [OK] Workspace catkin creado en ~/catkin_ws"
echo "  [OK] Driver Orbbec Astra instalado"
echo "  [OK] Dependencias Python 3 (pyserial, vosk, pyttsx3, opencv-python) instaladas"
echo "  [OK] Modelo Vosk español descargado en ~/models/vosk"
echo "  [OK] Usuario agregado al grupo dialout (acceso serial)"
echo ""
echo "IMPORTANTE: Reiniciar el Jetson Nano para aplicar todos los cambios."
