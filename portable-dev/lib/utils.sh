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

#não testado
contains_line(){
  local line="$1"
  local file="$2"

  if [ -z "$line" ] || [ -z "$file" ]; then
    return 1
  fi

  grep -Fxq -- "$line" "$file"
}

#não testado
append_if_missing(){
  local line="$1"
  local file="$2"

  if [ -z "$line" ] || [ -z "$file" ]; then
    return 1
  fi

  if contains_line "$line" "$file"; then
    return 0
  fi

  printf '%s\n' "$line" >> "$file"
}


