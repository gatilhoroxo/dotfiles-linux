#!/bin/bash
#
# Carrega configurações fundamentais
# Define constantes
# Localiza a raiz do projeto
# Define caminhos internos
# Inicializa variáveis globais
# 
# ESTADO do script: incompleto
# 

readonly PROJECT_NAME="Portable mDev CLI"
readonly VERSION="0.1.0"


EXEC_PATH="$HOME/.local/bin"

TEMP="$(realpath "${BASH_SOURCE[0]}")"
TEMP="$(dirname "$TEMP")"
PROJECT_ROOT="$(dirname "$TEMP")"

#readonly INSTALL_ROOT="$HOME/.local/share/portable-dev"
#readonly INSTALL_BIN="$HOME/.local/bin/mdev"

readonly LIB_DIR="$PROJECT_ROOT/lib"
readonly STATE_DIR="$PROJECT_ROOT/state"
readonly TOOLS_DIR="$PROJECT_ROOT/tools"

readonly CONFIG_DIR="$PROJECT_ROOT/config"
    # ou em ~/.config/portable-dev
readonly CACHE_DIR="$PROJECT_ROOT/cache"
    # ou em ~/.cache/portable-dev

