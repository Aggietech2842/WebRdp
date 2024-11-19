FROM ubuntu:22.04

# Stel de tijdzone in zonder interactieve prompts
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && \
    apt-get update && apt-get install -y tzdata && \
    dpkg-reconfigure --frontend noninteractive tzdata

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
