#!/usr/bin/with-contenv sh
set -e

# Rileva architettura
ARCH=$(uname -m)
echo "Arch rilevata: $ARCH"

# Seleziona binario corretto
case "$ARCH" in
  x86_64)
    URL="https://github.com/amir20/dozzle/archive/refs/tags/v8.14.12.tar.gz"
    ;;
  aarch64)
    URL="https://github.com/amir20/dozzle/archive/refs/tags/v8.14.12.tar.gz"
    ;;
  armv7* | armv7l)
    URL="https://github.com/amir20/dozzle/archive/refs/tags/v8.14.12.tar.gz"
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
