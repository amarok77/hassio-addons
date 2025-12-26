ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.0.0
FROM $BUILD_FROM

# Installa curl e tar
RUN apk add --no-cache curl tar

# Copia lo script che scarica Dozzle
COPY download-dozzle.sh /tmp/download-dozzle.sh
RUN chmod +x /tmp/download-dozzle.sh && /tmp/download-dozzle.sh

# Script di avvio s6
COPY run.sh /etc/services.d/dozzle/run
RUN chmod +x /etc/services.d/dozzle/run
