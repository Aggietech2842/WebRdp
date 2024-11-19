# Gebruik een noVNC-afbeelding gebaseerd op Ubuntu
FROM dorowu/ubuntu-desktop-lxde-vnc

# Stel de poort in waarop noVNC draait (standaard 80)
EXPOSE 80

# Stel de resolutie van het scherm in
ENV RESOLUTION=1707x1067

# Start het VNC- en noVNC-proces automatisch
CMD ["/startup.sh"]
