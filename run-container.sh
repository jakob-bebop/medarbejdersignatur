#! /usr/bin/env bash

if [ -z "$(groups | grep docker)" ]; then
	echo "Not in 'docker' group."
	exit 1
fi

if ! which xhost > /dev/null 2>1 ; then 
	echo "'xhost' is not installed."
	exit 1
fi


DOWNLOAD_FOLDER=$(xdg-user-dir DOWNLOAD)
FIREFOX_FOLDER="$HOME/.mozilla-mid"
OCES_FOLDER="$HOME/.oces"

if ! [ -d "$OCES_FOLDER" ]; then
	echo "Put your key files in $OCES_FOLDER."
	exit 1
fi

mkdir -p "$FIREFOX_FOLDER"

xhost +local:docker

docker run --rm --name firefox-mid \
   -e DISPLAY=unix$DISPLAY \
   -v "$OCES_FOLDER":/home/firefox/.oces \
   -v "$DOWNLOAD_FOLDER":/home/firefox/Downloads \
   -v "$FIREFOX_FOLDER":/home/firefox/.mozilla \
   --privileged \
   -v /tmp/.X11-unix:/tmp/.X11-unix firefox-medarbejdersignatur \
   --net=host \
   --shm-size=2g




