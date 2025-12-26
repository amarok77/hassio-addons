#!/usr/bin/env sh
set -e

ARCH=$(uname -m)
echo "Arch rilevata: $ARCH"

case "$ARCH" in
  x86_64)
    URL="https://github.com/amir20/dozzle/releases/latest/download/dozzle_linux_amd64.tar.gz"
    ;;
  aarch64)
    URL="https://github.com/amir20/dozzle/releases/latest/download/dozzle_linux_arm64.tar.gz"
    ;;
  armv7* | armv7l)
    URL="https://github.com/amir20/dozzle/releases/latest/download/dozzle_linux_armv7.tar.gz"
    ;;
  *)
    echo "Arch non supportata: $ARCH"
    exit 1
    ;;
esac

echo "Scarico Dozzle da $URL"
curl -fsSL "$URL" | tar -xz -C /usr/local/bin
