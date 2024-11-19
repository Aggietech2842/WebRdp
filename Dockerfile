FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Stel tijdzone in en installeer basistools
RUN ln -fs /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && \
    apt-get update && apt-get install -y tzdata bash locales x11vnc xvfb fluxbox git tigervnc-standalone-server tigervnc-common && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    locale-gen nl_NL.UTF-8 && update-locale LANG=nl_NL.UTF-8 && \
    apt-get clean

# Installeer noVNC
RUN git clone https://github.com/novnc/noVNC.git /opt/noVNC && \
    cd /opt/noVNC && git checkout v1.3.0 && \
    ln -s /opt/noVNC/utils/novnc_proxy /opt/noVNC/utils/launch.sh

# Kopieer startscript
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 6080

CMD ["/start.sh"]
