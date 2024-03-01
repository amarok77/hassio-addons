#ARG BUILD_FROM=hassioaddons/base:7.0.2
## hadolint ignore=DL3006
#FROM ${BUILD_FROM}

FROM php:8.3-apache
RUN apt-get update && apt-get install -y curl wget

# Copy root filesystem
#COPY rootfs /

# Change docroot to /data
RUN sed -ri -e 's!/var/www/html!/data!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!/data!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Setup base
#RUN apk add --no-cache \
#    coreutils=8.31-r0 \
#    wget=1.20.3-r0

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="PHP" \
    io.hass.description="PHP add-on for Home Assistant" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Stefano C. <caltaste@gmail.com>" \
    org.label-schema.description="PHP 8.3 and apache add-on for Home Assistant" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="PHP" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://addons.community" \
    org.label-schema.usage="https://github.com/amarok77/hassio-addons/blob/master/php-apache/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/amarok77/home-assistant-addons/blob/master/php-apache/" \
    org.label-schema.vendor="Community Hass.io Addons"
