ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.0.0
FROM $BUILD_FROM

# Installa curl e tar
RUN apk add --no-cache curl tar

# Copia lo script di avvio
COPY run.sh /etc/services.d/dozzle/run
RUN chmod +x /etc/services.d/dozzle/run
