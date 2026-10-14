#!/usr/bin/env bats

PROJECT_ROOT="$(cd "$BATS_TEST_DIRNAME/../.." && pwd)"

setup() {
    source "$PROJECT_ROOT/lib/utils/filesystem.sh"
}

# testes para a função file_exists

@test "file_exists retorna sucesso para um arquivo existente" {
    local file="$BATS_TEST_TMPDIR/example.txt"

    touch "$file"

    run file_exists "$file"

    [ "$status" -eq 0 ]
}

# testes para a função directory_exists

# testes para a função is_symlink

# testes para a função ensure_file

# testes para a função ensure_directory

# testes para a função ensure_symlink

# testes para a função ensure_copy