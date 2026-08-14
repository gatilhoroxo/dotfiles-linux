#!/bin/bash
#
# Apenas imprime mensagens
#
# ESTADO: completo, testado e funcionando
# Depende de cores.sh
# 

# general log function
log(){
  local arg1="$1"
  local arg2="$2"
  if [ -n "$arg1" ] && [ -n "$arg2" ]; then
    local color="${!arg1}"
    echo -e "${g_black}${b_white}##${color} ${arg2} ${g_black}${b_white}##${nc}"
  elif [ -n "$arg1" ]; then
    echo -e "${g_black}${b_white}## ${arg1} ##${nc}"
  else
    echo "## Log message is empty. ##" >&2
  fi
}

log_info(){
  #mensagem em azul
  if [ -n "$1" ]; then
    log b_blue "$1"
  fi
}

log_success(){
  #mensagem em verde
  if [ -n "$1" ]; then
    log b_green "$1"
  fi
}

log_warning(){
  #mensagem em amarelo
  if [ -n "$1" ]; then
    log b_yellow "$1"
  fi
}

log_error(){
  #mensagem em vermelho
  if [ -n "$1" ]; then
    log b_red "$1" >&2
  fi
}

log_debug(){
  #mensagem em roxo
  if [ -n "$1" ]; then
    log b_purple "$1"
  fi
}

