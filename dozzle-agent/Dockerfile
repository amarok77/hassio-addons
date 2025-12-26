ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.0.0
FROM $BUILD_FROM

ARG TARGETARCH

# installa curl e tar
RUN apk add --no-cache curl tar

# scarica Dozzle corretto
RUN if [ "$TARGETARCH" = "amd64" ]; then \
      DOZZLE_URL="https://github.com/amir20/dozzle/releases/latest/download/dozzle_linux_amd64.tar.gz"; \
    elif [ "$TARGETARCH" = "arm64" ]; then \
      DOZZLE_URL="https://github.com/amir20/dozzle/releases/latest/download/dozzle_linux_arm64.tar.gz"; \
    fi && \
    echo "Scarico Dozzle da $DOZZLE_URL" && \
    curl -L $DOZZLE_URL | tar -xz -C /usr/local/bin

