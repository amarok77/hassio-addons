ARG amir20/dozzle:latest

FROM amir20/dozzle:latest

# Set shell
#SHELL ["/bin/bash", "-o", "pipefail", "-c"]


# Build arguments
#ARG BUILD_ARCH
#ARG BUILD_DATE
#ARG BUILD_DESCRIPTION
#ARG BUILD_NAME
#ARG BUILD_REF
#ARG BUILD_REPOSITORY
#ARG BUILD_VERSION
#VOLUME ["/var/run/docker.sock", "/var/run/docker.sock"]

# Setup base
# RUN apt-get update && apt-get install --no-cache docker
#    mariadb-client=10.11.6-r0 \
#    nginx=1.24.0-r15 \ 
 

# Copy data for add-on
COPY run.sh /

RUN chmod a+x /run.sh

EXPOSE 8080

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Amarok <caltaste@gmail.com>" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="Amarok Hassio-Addons" \
    org.opencontainers.image.authors="Amarok <caltaste@gmail.com>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://github.com/amarok77/hassio-addons" \
    org.opencontainers.image.source="https://github.com/amir20" \
    org.opencontainers.image.documentation="https://github.com/amir20/dozzle/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}


CMD [ "/run.sh" ]
