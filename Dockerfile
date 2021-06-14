FROM ubuntu

RUN \
  apt-get update && \
  apt-get install -y firefox wget dbus-x11 && \
  wget https://www.medarbejdersignatur.dk/nemid-noglefilsprogram/download/nemidnoglefilsprogram-1.10.0.deb && \
  dpkg -i /nemidnoglefilsprogram-1.10.0.deb && \
  rm -rf /var/lib/apt/lists/*

RUN adduser firefox

USER firefox
ENV HOME /home/firefox

CMD []
ENTRYPOINT ["/usr/bin/firefox"]
