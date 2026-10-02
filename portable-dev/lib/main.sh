#!/bin/bash
#
# Carrega configurações fundamentais
# Define constantes
# Localiza a raiz do projeto
# Define caminhos internos
# Inicializa variáveis globais
# 
# ESTADO do script: desenvolvendo, não testado
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
  #scripts de dependencia
  #nessa ordem
  source "$LIB_DIR/colors.sh"      #primeiro
  source "$LIB_DIR/log.sh"         #segundo
  source "$LIB_DIR/command.sh"     #terceiro
  source "$LIB_DIR/filesystem.sh"  #quarto

  if [ $# -eq 0 ]; then
    log_info "Help about the use of this tool."
  else
    local cmd="$1"
    case "$cmd" in
      clean)
        log_warning "Command $cmd not implemented yet."
      ;;
      doctor)
        log_info "Running $cmd..."
      ;;
      enter)
        log_warning "Command $cmd not implemented yet."
      ;;
      install)
        log_warning "Command $cmd not implemented yet."
      ;;
      setup)
        log_info "Running $cmd..."
      ;;
      update)
        log_warning "Command $cmd not implemented yet."
      ;;
      *)
        log_error "Unknown command: $cmd"
      ;;
    esac
  fi

}

# ==================================
