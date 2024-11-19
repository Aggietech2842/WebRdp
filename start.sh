#!/bin/bash

# Stel de omgevingstaal in op Nederlands
export LANG=nl_NL.UTF-8
export LANGUAGE=nl_NL:en
export LC_ALL=nl_NL.UTF-8

# Controleer of de taal is geïnstalleerd en installeer indien nodig
locale-gen nl_NL.UTF-8
update-locale LANG=nl_NL.UTF-8

# Start de VNC-server
vncserver :1 -geometry 1280x800 -depth 24

# Start de noVNC server
/opt/noVNC/utils/launch.sh --vnc localhost:5901 --listen 6080
