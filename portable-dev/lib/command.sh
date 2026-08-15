#!/bin/bash
#
# Funções totalmente genéricas
# 
# ESTADO: incompleto
# Depende de ...
# 

command_path() 

command_exists() {
  local cmd="$1"
  [ -z "$cmd" ] && return 1
  #verificar se o cmd existe dentro do ambiente
  command -v "$cmd" > /dev/null 2>&1
}

command_version()

require_command()

require_commands()

find_command()

