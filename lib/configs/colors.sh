#!/bin/bash
#
# Define constantes de cores para o terminal
# 
# ESTADO: completo, testado e funcionando
# 


# CORES

# Reset / Sem Cor
readonly nc='\033[0m'       # No Color (Reseta tudo)

# Cores Regulares (Texto Normal)
readonly black='\033[0;30m'
readonly red='\033[0;31m'
readonly green='\033[0;32m'
readonly yellow='\033[0;33m'
export blue='\033[0;34m'
readonly purple='\033[0;35m'
readonly cyan='\033[0;36m'
readonly white='\033[0;37m'

# Cores em Negrito / Brilhantes (Mais usadas em terminais escuros)
readonly b_black='\033[1;30m'  # Cinza escuro
readonly b_red='\033[1;31m'
readonly b_green='\033[1;32m'
readonly b_yellow='\033[1;33m'
readonly b_blue='\033[1;34m'
readonly b_purple='\033[1;35m'
readonly b_cyan='\033[1;36m'
readonly b_white='\033[1;37m'

# outras cores e estilos
readonly g_black='\033[0;40m'   # preto de fundo
readonly bl_red='\033[1;91m'   # vermelho claro em negrito

# Estilos Extras
readonly italic='\033[3m'    # Faz o italico
readonly underline='\033[4m'    # Sublinhado
readonly blink='\033[5m'    # Piscar (nem todos terminais suportam)
readonly reverse='\033[7m'    # Inverte fundo e texto
readonly riscado='\033[9m'    # Risca o texto

# padrão que estão no bashrc
readonly GREEN=$green
readonly YELLOW=$yellow
readonly NC=$nc

# ==================================
