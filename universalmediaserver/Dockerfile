ARG BUILD_FROM=ghcr.io/hassio-addons/base:15.0.7
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

RUN apk add --no-cache mediainfo dcraw vlc-nox mplayer mencoder wget tar

ARG BUILD_ARCH

RUN wget https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/13.8.1/UMS-13.8.1-${BUILD_ARCH}.tgz \
    tar xvzf UMS-13.8.1-${BUILD_ARCH}.tgz \
    cd 

WORKDIR /usr/src/UMS-13.8.1/

VOLUME /media

VOLUME /profile

EXPOSE 9001 5002 1044

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
