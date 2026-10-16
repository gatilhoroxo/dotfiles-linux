#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_PATH="$SCRIPT_DIR/../bin/jq"

chosen=""

case $1 in 
  build)      chosen="0" ;;
  download)   chosen="1" ;;
  *)          chosen="" ;;
esac

if [ "$chosen" = "" ]; then
  # 1. Se o binario ja existir na pasta bin/, executa diretamente 
  if [ -f "$BIN_PATH" ]; then
    exec "$BIN_PATH" "$@"
  elif [ -f "$BIN_PATH-bin" ]; then
    exec "$BIN_PATH-bin" "$@"
  fi

elif [ "$chosen" = "0" ]; then 
  # 2. Tenta compilar via submodulo se o ambiente possuir ferramentas de build
  SUBMODULE_DIR="$SCRIPT_DIR/../submodules/jq"
  if [ -d "$SUBMODULE_DIR" ] && command -v make >/dev/null 2>&1 ; then
    echo "[info] Tentando compilar jq via submódulo..."
    (
      cd "$SUBMODULE_DIR"
      git submodule update --init --recursive >/dev/null 2>&1 || true
      if [ ! -f "configure" ]; then
        autoreconf -i >/dev/null 2>&1 || true
      fi
      if [ -f "configure" ]; then
        ./configure >/dev/null 2>&1 || true
        make -j2  || true
      fi
    )
    if [ -f "$SUBMODULE_DIR/jq" ]; then
      echo "bash $SUBMODULE_DIR/jq \"\$@\"" > "$BIN_PATH"
      chmod +x "$BIN_PATH"
      #exec "$BIN_PATH" "$@"
    fi
  fi
  
elif [ "$chosen" = "1" ]; then 
  # 3. Fallback: Baixa a versao oficial pre-compilada do GitHub Releases
  echo "[info] Baixando binário oficial do jq..."
  OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
  ARCH="$(uname -m)"

  ARCH_NAME="amd64"
  if [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
      ARCH_NAME="arm64"
  fi

  URL="https://github.com/jqlang/jq/releases/latest/download/jq-${OS}-${ARCH_NAME}"

  curl -sL -o "$BIN_PATH-bin" "$URL" || wget -q -O "$BIN_PATH-bin" "$URL"
  chmod +x "$BIN_PATH-bin"

  #exec "$BIN_PATH-bin" "$@"
fi
