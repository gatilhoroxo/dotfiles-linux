#!/bin/bash
#
# Carrega configurações fundamentais
# Define constantes
# Localiza a raiz do projeto
# Define caminhos internos
# Inicializa variáveis globais
# 
# ESTADO do script: desenvolvendo
# 

readonly PROJECT_NAME="Portable mDev CLI"
readonly VERSION="0.1.0"


EXEC_PATH="$HOME/.local/bin"

find_project_root(){
  local temp="$(realpath "${BASH_SOURCE[0]}")"
  temp="$(dirname "$temp")"
  echo "$(dirname "$temp")"
}

PROJECT_ROOT="$(find_project_root)"

#readonly INSTALL_ROOT="$HOME/.local/share/portable-dev"
#readonly INSTALL_BIN="$HOME/.local/bin/mdev"

readonly LIB_DIR="$PROJECT_ROOT/lib"
readonly STATE_DIR="$PROJECT_ROOT/state"
readonly TOOLS_DIR="$PROJECT_ROOT/tools"

readonly CONFIG_DIR="$PROJECT_ROOT/config"
    # ou em ~/.config/portable-dev
readonly CACHE_DIR="$PROJECT_ROOT/cache"
    # ou em ~/.cache/portable-dev

# --------------------------------

#Função principal do script bin/mdev
main(){
  if [ $# -eq 0 ]; then
    echo "Help about the use of this tool."
  else
    case "$1" in
      clean)
        echo "Command $1 not implemented yet."
      ;;
      doctor)
        echo "Running $1..."
      ;;
      enter)
        echo "Command $1 not implemented yet."
      ;;
      install)
        echo "Command $1 not implemented yet."
      ;;
      setup)
        echo "Running $1..."
      ;;
      update)
        echo "Command $1 not implemented yet."
      ;;
      *)
        echo "Unknown command: $1"
      ;;
    esac
  fi

}

# ==================================
