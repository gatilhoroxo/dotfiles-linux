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

# --------------------------------

# CORES
export GREEN='\033[0;32m'
export YELLOW='\033[1;33m'
export NC='\033[0m'

# Reset / Sem Cor
export nc='\033[0m'       # No Color (Reseta tudo)

# Cores Regulares (Texto Normal)
export black  ='\033[0;30m'
export red    ='\033[0;31m'
export green  ='\033[0;32m'
export yellow ='\033[0;33m'
export blue   ='\033[0;34m'
export purple ='\033[0;35m'
export cyan   ='\033[0;36m'
export white  ='\033[0;37m'

# Cores em Negrito / Brilhantes (Mais usadas em terminais escuros)
export b_black  ='\033[1;30m'  # Cinza escuro
export b_red    ='\033[1;31m'
export b_green  ='\033[1;32m'
export b_yellow ='\033[1;33m'
export b_blue   ='\033[1;34m'
export b_purple ='\033[1;35m'
export b_cyan   ='\033[1;36m'
export b_white  ='\033[1;37m'

# outras cores e estilos
export g_black ='\033[0;40m'   # preto de fundo
export bl_red  ='\033[1;91m'   # vermelho claro em negrito

# Estilos Extras
export italic    ='\033[3m'    # Faz o italico
export underline ='\033[4m'    # Sublinhado
export blink     ='\033[5m'    # Piscar (nem todos terminais suportam)
export reverse   ='\033[7m'    # Inverte fundo e texto
export riscado   ='\033[9m'    # Risca o texto


# ==================================
