ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.0.0
FROM $BUILD_FROM

# installa curl e tar
RUN apk add --no-cache curl tar

# scarica Dozzle in base all'arch locale
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then \
        URL="https://github.com/amir20/dozzle/releases/latest/download/dozzle_linux_amd64.tar.gz"; \
    elif [ "$ARCH" = "aarch64" ]; then \
        URL="https://github.com/amir20/dozzle/releases/latest/download/dozzle_linux_arm64.tar.gz"; \
    elif [ "$ARCH" = "armv7l" ]; then \
        URL="https://github.com/amir20/dozzle/releases/latest/download/dozzle_linux_armv7.tar.gz"; \
    else \
        echo "Arch non supportata: $ARCH"; exit 1; \
    fi && \
    echo "Scarico Dozzle da $URL" && \
    curl -L $URL | tar -xz -C /usr/local/bin

