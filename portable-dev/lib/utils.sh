#!/bin/bash
#
# Funções totalmente genéricas
# 
# ESTADO: incompleto
#  


ask_confirmation(){
  local input
  echo -n "Você confirma essa operação? [s/N]: "
  read input
  case "$input" in
    y|Y|yes|s|S|sim)
      return 0
      ;;
    *) 
      return 1
    ;;
  esac

}

is_linux() {
  [ "$(uname -o)" == "GNU/Linux" ]
}

is_writable(){
  local input="$1"
  [ -n "$input" ] && [ -w "$input" ]
}

#append_if_missing(){}

#contains_line(){}

