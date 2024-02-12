ARG amir20/dozzle:latest
FROM amir20/dozzle:latest

# Set shell
#SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

# Build arguments
#ARG BUILD_ARCH
#ARG BUILD_DATE
#ARG BUILD_DESCRIPTION
#ARG BUILD_NAME
#ARG BUILD_REF
#ARG BUILD_REPOSITORY
#ARG BUILD_VERSION
VOLUME ["/var/run/docker.sock", "/var/run/docker.sock"]

# Setup base
# RUN apk add --no-cache docker
#    mariadb-client=10.11.6-r0 \
#    nginx=1.24.0-r15 \ 

#VOLUME /var/run/docker.sock:/var/run/docker.sock
EXPOSE 8080

# Copy data for add-on
COPY run.sh /

RUN chmod a+x /run.sh

#CMD [ "/run.sh" ]

ENTRYPOINT ["/run.sh"]
