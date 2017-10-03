Dockerimage til Danid Medarbejdersignatur på linux
===================

Institutioner i Danmark skal bruge medarbejdersignatur med nøglefil.
Systemet understøtter kun Ubuntu linux. Dette docker build kan bruges
på andre distributioner. Jeg bruger det på Arch linux.

* Tillad din docker user at bruge Xorg vha. `xhost +local:docker` 
* Start docker-imaget. Eksempel på den kommando jeg bruger ses i `run-container.sh`.
  Browseren kører som user firefox inde i containeren, så jeg har mountet
  * min "downloads" folder på /home/firefox/Downloads
  * min `~/.oces` på /home/firefox/.oces (hvor signaturen ligger)
  * en mappe jeg har oprettet på /home/firefox/.mozilla, hvor den kan gemme 
    sin NemId-firefox-extension samt indstillinger.
* når du lukker vinduet, kan du åbne det igen med `docker start <navn>`
  (i eksemplet er navnet sat til `firefox-mid`)
* Lav evt. en genvej på skrivebord med kommandoen `xhost +local:docker && docker start firefox-mid`
