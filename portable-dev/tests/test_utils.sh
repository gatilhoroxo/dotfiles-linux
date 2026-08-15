#!/usr/bin/env bash

source ../lib/core.sh
source ../lib/colors.sh
source ../lib/log.sh
source ../lib/command.sh
source ../lib/filesystem.sh

TEST_DIR="./sandbox"

rm -rf "$TEST_DIR"
mkdir -p "$TEST_DIR"

# ================================= ok
# ainda está dando erro 
echo "Teste: extract_file com arquivo inexistente"

extract_file "$TEST_DIR/arquivo_inexistente.txt" 

if [ ! -f "$TEST_DIR/arquivo_inexistente.txt" ]; then
    echo "OK"
else
    echo "ERRO"
fi

# ---------------------- ok

echo "Teste: extract_file com arquivo existente mas invalido (não é um arquivo compactado)"

touch "$TEST_DIR/arquivo_existente.txt"

extract_file "$TEST_DIR/arquivo_existente.txt"

#esse teste não faz sentido
if [ -f "$TEST_DIR/arquivo_existente.txt" ]; then
    echo "OK"
else
    echo "ERRO"
fi

# ---------------------- ok

#tar.gz
echo "Teste: extract_file com arquivo existente e válido tar.gz (arquivo compactado)"

#criar um arquivo compactado para teste
echo "Conteúdo do arquivo de teste" > "$TEST_DIR/arquivo_para_compactar.txt"
tar -czf "$TEST_DIR/arquivo_compactado.tar.gz" -C "$TEST_DIR" "arquivo_para_compactar.txt"

rm "$TEST_DIR/arquivo_para_compactar.txt"

extract_file "$TEST_DIR/arquivo_compactado.tar.gz"

if [ -f "$TEST_DIR/arquivo_para_compactar.txt" ]; then
    echo "OK"
else
    echo "ERRO"
fi

rm "arquivo_para_compactar.txt"

#tar.bz2
echo "Teste: extract_file com arquivo existente e válido tar.bz2"

#tar.xz
echo "Teste: extract_file com arquivo existente e válido tar.xz"

#bunzip2
echo "Teste: extract_file com arquivo existente e válido bunzip2"

#rar
echo "Teste: extract_file com arquivo existente e válido rar"

#zip
echo "Teste: extract_file com arquivo existente e válido zip"

#xz
echo "Teste: extract_file com arquivo existente e válido xz"

#gz com gunzip
echo "Teste: extract_file com arquivo existente e válido gz"

#7z
echo "Teste: extract_file com arquivo existente e válido 7z"

#Z com uncompress
echo "Teste: extract_file com arquivo existente e válido Z"

# ================================= 

rm -rf "$TEST_DIR"
