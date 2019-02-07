#!/bin/bash

i3-msg "workspace 10:MEDIA; exec firefox --new-window localhost:6680/iris"
sleep 1
xdotool key F11 