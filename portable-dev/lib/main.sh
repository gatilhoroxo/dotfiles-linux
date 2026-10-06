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

find_project_root(){
  local temp="$(realpath "${BASH_SOURCE[0]}")"
  temp="$(dirname "$temp")"
  echo "$(dirname "$temp")"
}

PROJECT_ROOT="$(find_project_root)"

source "$PROJECT_ROOT/lib/configs/var.sh"
source "$PROJECT_ROOT/lib/configs/colors.sh"
source "$PROJECT_ROOT/lib/configs/log.sh"


# --------------------------------

#Função principal do script bin/mdev
main(){

  source "$ENGINE_DIR/main-engine.sh"

  if [ $# -eq 0 ]; then
    log_info "Help about the use of this tool."
  else
    local cmd="$1"
    case "$cmd" in
      clean)
        log_warning "Command $cmd not implemented yet."
      ;;
      doctor)
        doctor "$1"
      ;;
      enter)
        log_warning "Command $cmd not implemented yet."
        enter "$1"
      ;;
      install)
        log_warning "Command $cmd not implemented yet."
        install "$1"
      ;;
      setup)
        log_info "Running $cmd..."
        setup "$1"
      ;;
      update)
        log_warning "Command $cmd not implemented yet."
        update "$1"
      ;;
      *)
        log_error "Unknown command: $cmd"
      ;;
    esac
  fi

}

# ==================================
