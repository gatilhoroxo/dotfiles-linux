#!/bin/bash
# ~/.bash-config/config.sh

# Carregar Módulos de Configuração (~/.bash-config)
if [ -d ~/.bash-config ]; then
    shopt -s globstar
    # aliases folder
    for file in ~/.bash-config/aliases/**/*.sh; do
        [ -r "$file" ] && source "$file"
    done
    # functions folder
    for file in ~/.bash-config/functions/**/*.sh; do
        [ -r "$file" ] && source "$file"
    done
    # var folder
    for file in ~/.bash-config/var/**/*.sh; do
        [ -r "$file" ] && source "$file"
    done
    shopt -u globstar
fi
