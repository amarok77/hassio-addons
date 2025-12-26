#!/usr/bin/with-contenv sh
set -e

# Rileva architettura
ARCH=$(uname -m)
echo "Arch rilevata: $ARCH"

# Seleziona binario corretto
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

# Scarica e installa Dozzle
echo "Scarico Dozzle da $URL"
curl -fsSL "$URL" | tar -xz -C /usr/local/bin

# Avvia Dozzle agent
exec /usr/local/bin/dozzle agent
