#!/bin/bash

name=mopidy_last


if [[ $(docker ps -a -f "name=$name" --format '{{.Names}}') = $name ]]
then
	# container existe
	if [[ $(docker ps -f "name=$name" -f "status=running" --format '{{.Names}}') = $name ]]
	then
		# container tourne déjà
		echo "$name container already running"
	else
		# container doit etre relancé
		echo "$name container restarts"
		docker container stop $name \
		&& docker container start $name
		sleep 1
	fi
else
	echo "$name container is created"
	docker run -d \
	--user $UID:$GID \
	-v /run/user/$UID/pulse:/run/user/105/pulse \
	--device /dev/snd:/dev/snd \
	-p 127.0.0.1:6600:6600 \
	-p 127.0.0.1:6680:6680 \
	--name $name \
	-v "/home/prise6/dockers/docker-mopidy/mopidy.conf:/config/mopidy.conf" mopidy:latest
fi
