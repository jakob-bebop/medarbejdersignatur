#! /usr/bin/env bash
## startede containeren med

if [ -z "$(groups | grep docker)" ]; then
	echo "Not in 'docker' group!"
	exit 1
fi

DOWNLOAD_FOLDER=$(xdg-user-dir DOWNLOAD)

xhost +local:docker

docker run --rm --name firefox-mid \
   -e DISPLAY=unix$DISPLAY \
   -v $HOME/.oces:/home/firefox/.oces \
   -v $DOWNLOAD_FOLDER:/home/firefox/Downloads \
   -v $HOME/.mozilla-mid:/home/firefox/.mozilla \
   --privileged \
   -v /tmp/.X11-unix:/tmp/.X11-unix firefox-medarbejdersignatur \
   --net=host \
   --shm-size=2g



## Brug docker rm hvis den allerede kører
#  ref. https://hub.docker.com/r/chrisdaish/firefox/
#  xhost +local:docker

