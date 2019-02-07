#!/bin/bash

cd ~/dockers/docker-mopidy

/bin/bash run.sh >> mopidy.log 2>&1
/bin/bash i3_msg.sh >> mopidy.log 2>&1
