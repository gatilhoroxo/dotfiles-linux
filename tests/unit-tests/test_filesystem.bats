#!/usr/bin/env bats
#
# ESTADO: implementado, mas com erros

PROJECT_ROOT="$(cd "$BATS_TEST_DIRNAME/../.." && pwd)"

setup() {
    load "$PROJECT_ROOT/tests/helper/common.sh"
    _common_setup

    load "$PROJECT_ROOT/lib/configs/colors.sh"
    load "$PROJECT_ROOT/lib/configs/log.sh"
    load "$PROJECT_ROOT/lib/utils/filesystem.sh"

    file="$BATS_TEST_TMPDIR/example.txt"
    touch "$file"

    dir="$BATS_TEST_TMPDIR/exemple"
    mkdir "$dir"

    link="$BATS_TEST_TMPDIR/linkexemple"
    ln -s "$file" "$link"

    dir2="$BATS_TEST_TMPDIR/diretorio"
    file2="$BATS_TEST_TMPDIR/arquivo.txt"
    link2="$BATS_TEST_TMPDIR/link"

    copy="$BATS_TEST_TMPDIR/copy"
}

teardown() {
    rm "$file" 
    rmdir "$dir"
    rm "$link" 

    if [ -d "$dir2" ]; then
        rmdir "$dir2"
    fi

    if [ -f "$file2" ]; then
        rm "$file2"
    fi

    if [ -f "$link2" ]; then
        rm "$link2"
    fi

    if [ -f "$copy" ]; then
        rm "$copy"
    elif [ -d "$copy" ]; then
        rmdir "$copy"
    fi 
}

# ===================================================
# testes para a função file_exists

@test "file_exists retorna sucesso para um arquivo existente" {
    run file_exists "$file"

    [ "$status" -eq 0 ]
}

@test "file_exists retorna falha para um arquivo inexistente" {
    run file_exists arquivo_inexistente_12345.txt

    [ "$status" -eq 1 ]
}

@test "file_exists retorna falha para sem argumentos" {
    run file_exists

    [ "$status" -eq 1 ]
    assert_output --partial 'Erro'
}

# ===================================================
# testes para a função directory_exists

@test "directory_exists retorna sucesso para um diretorio existente" {
    run directory_exists "$dir"

    [ "$status" -eq 0 ]
}

@test "directory_exists retorna falha para um diretorio inexistente" {
    run directory_exists diretorio_inexistente_12345

    [ "$status" -eq 1 ]
}

@test "directory_exists retorna falha para sem argumentos" {
    run directory_exists

    [ "$status" -eq 1 ]
    assert_output --partial 'Erro'
}

# ===================================================
# testes para a função is_symlink

@test "is_symlink retorna sucesso para um link existente" {
    run is_symlink "$link"

    [ "$status" -eq 0 ]
}

@test "is_symlink retorna falha para algo que não é um link" {
    run is_symlink "$dir"

    [ "$status" -eq 1 ]
}

@test "is_symlink retorna falha para um link inexistente" {
    run is_symlink link_inexistente_12345

    [ "$status" -eq 1 ]
}

@test "is_symlink retorna falha para sem argumentos" {
    run is_symlink

    [ "$status" -eq 1 ]
    assert_output --partial 'Erro'
}

# ===================================================
# testes para a função ensure_file

@test "ensure_file não cria um arquivo para um arquivo existente" {
    run ensure_file "$file"

    [ "$status" -eq 0 ]
    [ -f "$file" ]
}

@test "ensure_file cria um arquivo para um arquivo inexistente" {
    run ensure_file "$file2"

    [ "$status" -eq 0 ]
    [ -f "$file2" ]
}

@test "ensure_file retorna falha para sem argumentos" {
    run ensure_file

    [ "$status" -eq 1 ]
    assert_output --partial 'Erro'
}

# ===================================================
# testes para a função ensure_directory

@test "ensure_directory não cria um diretorio para um diretorio existente" {
    run ensure_directory "$dir"

    [ "$status" -eq 0 ]
    [ -d "$dir" ]
}

@test "ensure_directory cria um diretorio para um diretorio inexistente" {
    run ensure_directory "$dir2"

    [ "$status" -eq 0 ]
    [ -d "$dir2" ]
}

@test "ensure_directory retorna falha para sem argumentos" {
    run ensure_directory

    [ "$status" -eq 1 ]
    assert_output --partial 'Erro'
}

# ===================================================
# testes para a função ensure_symlink

@test "ensure_symlink não cria um link para um link existente" {
    run ensure_symlink "$file" "$link"

    [ "$status" -eq 0 ]
    [ -L "$link" ]
}

@test "ensure_symlink dá erro para um arquivo inexistente" {
    run ensure_symlink "$file2" "$link2"

    [ "$status" -eq 1 ]
}

@test "ensure_symlink cria um link para um link inexistente" {
    run ensure_symlink "$file" "$link2"

    [ "$status" -eq 0 ]
    [ -L "$link2" ]
}

@test "ensure_symlink retorna falha para sem argumentos" {
    run ensure_symlink

    [ "$status" -eq 1 ]
    assert_output --partial 'Erro'
}

# ===================================================
# testes para a função ensure_copy

@test "ensure_copy dá erro para um arquivo inexistente" {
    run ensure_copy "$dir2" "$copy"

    [ "$status" -eq 1 ]
}

#está dando um erro e não sei porque
@test "ensure_copy cria uma copia para um arquivo inexistente" {
    run ensure_copy "$dir" "$copy"

    [ "$status" -eq 0 ]
    [ -e "$copy" ]
}

@test "ensure_copy retorna falha para sem argumentos" {
    run ensure_copy

    [ "$status" -eq 1 ]
    assert_output --partial 'Erro'
}

