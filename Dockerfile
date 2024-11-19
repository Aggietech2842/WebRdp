FROM ubuntu:22.04

# Update en upgrade de container
RUN apt-get update && apt-get upgrade -y

# Installeer benodigde pakketten
RUN apt-get install -y \
    bash \
    locales \
    x11vnc \
    xvfb \
    fluxbox \
    novnc \
    git \
    && apt-get clean

# Voeg taalondersteuning toe
RUN locale-gen nl_NL.UTF-8 && update-locale LANG=nl_NL.UTF-8

# Voeg noVNC toe
RUN git clone https://github.com/novnc/noVNC.git /opt/noVNC

# Kopieer het startscript en geef het uitvoerrechten
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Open de vereiste poorten
EXPOSE 6080

# Gebruik bash als standaard shell
SHELL ["/bin/bash", "-c"]

# Start script
CMD ["/start.sh"]
