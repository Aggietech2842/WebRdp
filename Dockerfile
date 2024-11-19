# Gebruik een nieuwere Ubuntu versie
FROM ubuntu:22.04

# Installeer benodigde pakketten
RUN apt-get update && apt-get install -y \
    xfce4 xfce4-goodies tightvncserver wget git python3-pip && \
    apt-get clean

# Install noVNC en websockify
RUN git clone https://github.com/novnc/noVNC.git /opt/noVNC && \
    git clone https://github.com/novnc/websockify.git /opt/noVNC/utils/websockify && \
    ln -s /opt/noVNC/vnc.html /opt/noVNC/index.html

# Configureer de VNC-server
RUN mkdir ~/.vnc && \
    echo "1234" | vncpasswd -f > ~/.vnc/passwd && \
    chmod 600 ~/.vnc/passwd

# Voeg een script toe voor het starten van de services
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Exposeer poort 6080 (voor noVNC)
EXPOSE 6080

# Start VNC-server en noVNC bij containerstart
CMD ["/start.sh"]
