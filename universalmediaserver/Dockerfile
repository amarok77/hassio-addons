#FROM alpine
ARG BUILD_FROM

FROM $BUILD_FROM

LABEL org.opencontainers.image.authors="atamariya@gmail.com"

RUN apk add --no-cache coreutils ffmpeg mediainfo openjdk17-jre iputils mplayer ttf-dejavu

WORKDIR /usr/src/ums/

VOLUME /media

VOLUME /profile

EXPOSE 9001 5002 1044

COPY . /usr/src/ums/

ENTRYPOINT [ "./docker-init" ]
