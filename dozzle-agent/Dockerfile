ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.0.0
FROM $BUILD_FROM

ARG TARGETARCH

# Install curl e scarica Dozzle per arch corretta
RUN apk add --no-cache curl tar \
 && if [ "$TARGETARCH" = "amd64" ]; then \
      curl -L https://github.com/amir20/dozzle/releases/latest/download/dozzle_linux_amd64.tar.gz | tar xz -C /usr/local/bin dozzle; \
    elif [ "$TARGETARCH" = "arm64" ]; then \
      curl -L https://github.com/amir20/dozzle/releases/latest/download/dozzle_linux_arm64.tar.gz | tar xz -C /usr/local/bin dozzle; \
    fi

# Script di avvio s6
COPY run.sh /etc/services.d/dozzle/run
RUN chmod +x /etc/services.d/dozzle/run
