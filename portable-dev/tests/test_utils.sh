#!/usr/bin/env bash

source ../lib/core.sh
source ../lib/colors.sh
source ../lib/log.sh
source ../lib/command.sh
source ../lib/filesystem.sh
source ../lib/utils.sh

TEST_DIR="./sandbox"

rm -rf "$TEST_DIR"
mkdir -p "$TEST_DIR"

# ================================= 

echo "Teste do ask_confirmation"

echo "Teste 1: entrada qualquer"
files="$TEST_DIR/file_teste.txt"
echo "y" > $files
if ask_confirmation < $files ; then
    echo "confirmado"
else 
    echo "negado"
fi

#dando erro
echo "Teste 2: entrada afirmativa"
if ask_confirmation < $files ; then
    echo "confirmado"
else 
    echo "negado"
fi

# ================================= 

echo "Teste do is_linux"

echo "Teste 1: sem entrada"
if is_linux ; then
    echo "confirmado"
else 
    echo "negado"
fi

# ================================= 

echo "Teste do is_writable"

echo "Teste 1: sem entrada"
if is_writable ; then
    echo "confirmado"
else 
    echo "negado"
fi

echo "Teste 2: entrada inexistente"
if is_writable arquivo_inexistente.txt ; then
    echo "confirmado"
else 
    echo "negado"
fi

echo "Teste 2: entrada existente"
if is_writable $files ; then
    echo "confirmado"
else 
    echo "negado"
fi

# ================================= 

rm -rf "$TEST_DIR"
