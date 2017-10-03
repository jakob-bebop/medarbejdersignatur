## startede containeren med

docker run --name firefox-mid \
   -e DISPLAY=unix$DISPLAY \
   -v $HOME/.oces:/home/firefox/.oces \
   -v $HOME/Hentede\ Filer:/home/firefox/Downloads \
   -v $HOME/.mozilla-mid:/home/firefox/.mozilla \
   --privileged \
   -v /tmp/.X11-unix:/tmp/.X11-unix firefox-medarbejdersignatur


## Brug docker rm hvis den allerede kører
#  ref. https://hub.docker.com/r/chrisdaish/firefox/
#  xhost +local:docker

