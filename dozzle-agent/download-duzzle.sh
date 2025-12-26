#!/usr/bin/env sh
set -e

ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then
    URL="https://github.com/amir20/dozzle/releases/latest/download/dozzle_linux_amd64.tar.gz"
elif [ "$ARCH" = "aarch64" ]; then
    URL="https://github.com/amir20/dozzle/releases/latest/download/dozzle_linux_arm64.tar.gz"
elif [ "$ARCH" = "armv7l" ]; then
    URL="https://github.com/amir20/dozzle/releases/latest/download/dozzle_linux_armv7.tar.gz"
else
    echo "Arch non supportata: $ARCH"
    exit 1
fi

echo "Scarico Dozzle da $URL"
curl -L $URL | tar -xz -C /usr/local/bin
