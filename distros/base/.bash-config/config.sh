#!/bin/bash
# ~/.bash-config/config.sh

# Carregar Módulos de Configuração (~/.bash-config)
if [ -d ~/.bash-config ]; then
    shopt -s globstar
    for file in ~/.bash-config/**/*.sh; do
        if [ "$file" == '~/.bash-config/config.sh' ]
        [ -r "$file" ] && source "$file"
    done
    shopt -u globstar
fi
