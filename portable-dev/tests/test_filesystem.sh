#!/usr/bin/env bash

source ../lib/core.sh
source ../lib/colors.sh
source ../lib/log.sh
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

# ================================= ok
# vai dar erro pois não existe a função de command_exists, 
# mas o teste é para ver se a função extract_file está sendo chamada corretamente
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
