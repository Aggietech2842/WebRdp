#!/bin/bash

# Start VNC-server
vncserver :1 -geometry 1280x800 -depth 24

# Start noVNC
/opt/noVNC/utils/launch.sh --vnc localhost:5901 --listen 6080
