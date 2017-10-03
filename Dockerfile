FROM ubuntu

RUN \
  apt-get update && \
  apt-get update && \
  apt-get install -y firefox wget && \
  wget https://www.medarbejdersignatur.dk/nemid-noglefilsprogram/download/nemidnoglefilsprogram-1.5.1.deb && \
  dpkg -i /nemidnoglefilsprogram-1.5.1.deb && \
  rm -rf /var/lib/apt/lists/*

RUN adduser firefox

USER firefox
ENV HOME /home/firefox

CMD []
ENTRYPOINT ["/usr/bin/firefox"]
