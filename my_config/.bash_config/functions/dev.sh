#setando um usuario git
# Uso: setUserGit "Nome" "email" [--global]
setUserGit(){
    if [ "$3" == "--global" ]; then
        git config --global user.name "$1"
        git config --global user.email "$2"
        echo "Git global configurado para: $1 <$2>"
    else 
        git config user.name "$1"
        git config user.email "$2"
        echo "Git local configurado para: $1 <$2>"
    fi 
}

# Mostra seu IP local e IP público
# Uso: myip
myip() {
    echo "IP Local: $(hostname -I | cut -d' ' -f1)"
    echo "IP Público: $(curl -s ifconfig.me)"
}

# === Rust Book server ===

# Porta padrão e diretório padrão
RUSTBOOK_PORT=8000
RUSTBOOK_DIR="$HOME/.local/share/rustup/toolchains/stable-x86_64-unknown-linux-gnu/share/doc/rust/html"
RUSTBOOK_PID_FILE="/tmp/.rustbook.pid"

rustbook_start() {

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

rustbook_stop() {
  if [ -f "$RUSTBOOK_PID_FILE" ]; then
    kill $(cat "$RUSTBOOK_PID_FILE") 2>/dev/null
    rm "$RUSTBOOK_PID_FILE"
    echo "Rust Book parado."
  else
    echo "Servidor não está rodando."
  fi
}
