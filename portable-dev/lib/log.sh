#!/bin/bash
#
# Apenas imprime mensagens
#
# ESTADO: desenvolvendo
# 
# 

# general log function
log(){
  if [ -n "$1" && -n "$2" ]; then
    echo "##$($1)$(g_black) $2 ##$(nc)"
  elif [ -n "$1" ]; then
    echo "## $1 ##"
  else
    echo "## Log message is empty. ##" >&2
  fi
}

log_info(){
  #mensagem em azul
  if [ -n "$1" ]; then
    log blue "$1"
  fi
}

log_success(){
  #mensagem em verde
  if [ -n "$1" ]; then
    log green "$1"
  fi
}

log_warning(){
  #mensagem em amarelo
  if [ -n "$1" ]; then
    log yellow "$1"
  fi
}

log_error(){
  #mensagem em vermelho
  if [ -n "$1" ]; then
    log red "$1" >&2
  fi
}

log_debug(){
  #mensagem em roxo
  if [ -n "$1" ]; then
    log purple "$1"
  fi
}

