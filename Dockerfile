FROM linuxserver/transmission
MAINTAINER carlba

COPY root/ /
VOLUME /config /downloads /watch /storage
