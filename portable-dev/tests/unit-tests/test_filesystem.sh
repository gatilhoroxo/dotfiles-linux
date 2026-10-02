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

echo "Teste: file_exists com arquivo inexistente"

if file_exists "$TEST_DIR/teste.txt"; then
    echo "ERRO"
else
    echo "OK"
fi

echo "Teste: file_exists com arquivo existente"

touch "$TEST_DIR/teste.txt"

if file_exists "$TEST_DIR/teste.txt"; then
    echo "OK"
else
    echo "ERRO"
fi

rm "$TEST_DIR/teste.txt"

# ================================= ok

echo "Teste: directory_exists com diretório inexistente"

if directory_exists "$TEST_DIR/pasta"; then
    echo "ERRO"
else
    echo "OK"
fi

mkdir "$TEST_DIR/pasta"

echo "Teste: directory_exists com diretório existente"

if directory_exists "$TEST_DIR/pasta"; then
    echo "OK"
else
    echo "ERRO"
fi

rm -rf "$TEST_DIR/pasta"

# ================================= ok

echo "Teste: is_symlink com link simbólico inexistente"

if is_symlink "$TEST_DIR/meu_link"; then
    echo "ERRO"
else
    echo "OK"
fi

echo "Teste: is_symlink com link simbólico existente"

ln -s "$TEST_DIR/meu_arquivo.txt" "$TEST_DIR/meu_link"

if is_symlink "$TEST_DIR/meu_link"; then
    echo "OK"
else
    echo "ERRO"
fi

rm "$TEST_DIR/meu_link"

# ================================= ok

echo "Teste: ensure_directory com diretório inexistente"

ensure_directory "$TEST_DIR/minha_pasta"

if [ -d "$TEST_DIR/minha_pasta" ]; then
    echo "OK"
else
    echo "ERRO"
fi

echo "Teste: ensure_directory com diretório existente"

ensure_directory "$TEST_DIR/minha_pasta"

rm -rf "$TEST_DIR/minha_pasta"

# ================================= ok

echo "Teste: ensure_file com arquivo inexistente"

ensure_file "$TEST_DIR/meu_arquivo.txt"

if [ -f "$TEST_DIR/meu_arquivo.txt" ]; then
    echo "OK"
else
    echo "ERRO"
fi

echo "Teste: ensure_file com arquivo existente"

ensure_file "$TEST_DIR/meu_arquivo.txt"

#rm "$TEST_DIR/meu_arquivo.txt"

# ================================= ok

echo "Teste: ensure_symlink com link simbólico inexistente"

ensure_symlink "$TEST_DIR/meu_arquivo.txt" "$TEST_DIR/meu_link"

if [ -L "$TEST_DIR/meu_link" ]; then
    echo "OK"
else
    echo "ERRO"
fi

echo "Teste: ensure_symlink com link simbólico existente"

ensure_symlink "$TEST_DIR/meu_arquivo.txt" "$TEST_DIR/meu_link"

rm "$TEST_DIR/meu_link"

# ------------------ ok

echo "Teste: ensure_symlink com link simbólico existente apontando para outro destino"

ln -s "$TEST_DIR/outro_arquivo.txt" "$TEST_DIR/meu_link"

ensure_symlink "$TEST_DIR/meu_arquivo.txt" "$TEST_DIR/meu_link"

rm "$TEST_DIR/meu_link"

# ------------------ ok

echo "Teste: ensure_symlink com link simbólico existente apontando para o mesmo destino"

ln -s "$TEST_DIR/meu_arquivo.txt" "$TEST_DIR/meu_link"

ensure_symlink "$TEST_DIR/meu_arquivo.txt" "$TEST_DIR/meu_link"

rm "$TEST_DIR/meu_link"

# ------------------ ok

echo "Teste: ensure_symlink com arquivo que não é um link simbólico"

touch "$TEST_DIR/file.txt"

touch "$TEST_DIR/meu_arquivo.txt"

ensure_symlink "$TEST_DIR/file.txt" "$TEST_DIR/file.txt"

rm "$TEST_DIR/meu_arquivo.txt" "$TEST_DIR/file.txt"

# ================================= ok

echo "Teste: ensure_copy com arquivo inexistente"

echo "Texto de teste" > "$TEST_DIR/meu_arquivo.txt"

ensure_copy "$TEST_DIR/meu_arquivo.txt" "$TEST_DIR/copia_arquivo.txt"

if [ -f "$TEST_DIR/copia_arquivo.txt" ]; then
    echo "OK"
else
    echo "ERRO"
fi

echo "Teste: ensure_copy com arquivo existente"

ensure_copy "$TEST_DIR/meu_arquivo.txt" "$TEST_DIR/copia_arquivo.txt"

rm "$TEST_DIR/copia_arquivo.txt"

# ================================= 

rm -rf "$TEST_DIR"
