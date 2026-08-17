#!/bin/bash
#
# Funções totalmente genéricas
# 
# ESTADO: incompleto
# Depende de ...
# 

# retorna caminho do comando?
command_path() 

#retorna se existe ou não
command_exists() {
  local cmd="$1"
  [ -z "$cmd" ] && return 1
  #verificar se o cmd existe dentro do ambiente
  command -v "$cmd" > /dev/null 2>&1
}

# retorna versão do comando?
command_version()

#requer algum comando para continuar algo
#vê se ele existe
#se n existir, mostrar modo para instalação?
#ou seguir para instalar ele?
require_command()

#requer vários comandos diferentes
#vê se eles existem
#se n existir, mostrar modo para instalação?
#ou seguir para instalar eles?
#vai depender do installer?
require_commands()

#não é a mesma coisa que o command_path?
find_command()

