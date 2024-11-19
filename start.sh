#!/bin/bash

# Start de VNC-server
vncserver :1 -geometry 1280x800 -depth 24

# Start de noVNC server
/opt/noVNC/utils/launch.sh --vnc localhost:5901 --listen 6080
