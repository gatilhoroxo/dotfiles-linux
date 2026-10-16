#!/bin/bash
# ~/.bash-config/functions/toolz.sh

# === Rust Book server ===

function rustbook_start() {
  # Se já existe PID, checa se o processo está vivo
  if [ -f "$RUSTBOOK_PID_FILE" ]; then
    local pid
    pid=$(cat "$RUSTBOOK_PID_FILE")
    if kill -0 "$pid" 2>/dev/null; then
      echo "Rust Book já está rodando (PID $pid)."
      return 0
    else
      # PID antigo não existe mais, remove arquivo
      rm "$RUSTBOOK_PID_FILE"
    fi
  fi

  local port=${1:-$RUSTBOOK_PORT}      # permite sobrescrever a porta ao chamar
  local dir=${2:-$RUSTBOOK_DIR}        # permite sobrescrever o diretório
  if [ ! -d "$dir" ]; then
    echo "Diretório '$dir' não existe."
    return 1
  fi
  cd "$dir" || return
  nohup python3 -m http.server "$port" > /dev/null 2>&1 &
  echo $! > "$RUSTBOOK_PID_FILE"
  echo "Rust Book rodando em http://localhost:$port"
  cd ~
}

function rustbook_stop() {
  if [ -f "$RUSTBOOK_PID_FILE" ]; then
    kill $(cat "$RUSTBOOK_PID_FILE") 2>/dev/null
    rm "$RUSTBOOK_PID_FILE"
    echo "Rust Book parado."
  else
    echo "Servidor não está rodando."
  fi
}
