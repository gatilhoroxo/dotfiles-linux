#!/usr/bin/env bats
#
# ESTADO: completo

PROJECT_ROOT="$(cd "$BATS_TEST_DIRNAME/../.." && pwd)"

setup() {
    source "$PROJECT_ROOT/lib/configs/colors.sh"
    source "$PROJECT_ROOT/lib/configs/log.sh"
    source "$PROJECT_ROOT/lib/utils/command.sh"
    source "$PROJECT_ROOT/lib/utils/filesystem.sh"
    load "$PROJECT_ROOT/lib/utils.sh"
}


# ===================================================
# testes para a função ask_confirmation

@test "ask_confirmation aceita a resposta sim" {
    run ask_confirmation <<< "s"

    [ "$status" -eq 0 ]
    [[ "$output" == *"Você confirma essa operação?"* ]]
}

@test "ask_confirmation rejeita a resposta não" {
    run ask_confirmation <<< "n"

    [ "$status" -ne 0 ]
}

@test "ask_confirmation rejeita uma resposta vazia" {
    run ask_confirmation <<< ""

    [ "$status" -ne 0 ]
}

# ===================================================
# testes para a função is_linux

@test "is_linux retorna sucesso quando o sistema é GNU/Linux" {
    uname() {
        printf '%s\n' "GNU/Linux"
    }

    run is_linux

    [ "$status" -eq 0 ]
    [ -z "$output" ]
}

@test "is_linux retorna falha quando o sistema não é GNU/Linux" {
    uname() {
        printf '%s\n' "GNU/Windows"
    }

    run is_linux

    [ "$status" -ne 0 ]
    [ -z "$output" ]
}

# ===================================================
# testes para a função is_writable

@test "is_writable retorna sucesso para um diretório gravável" {
    local test_dir="$BATS_TEST_TMPDIR/writable"

    mkdir -p "$test_dir"

    run is_writable "$test_dir"

    [ "$status" -eq 0 ]
}

@test "is_writable retorna falha para um caminho inexistente" {
    local test_path="$BATS_TEST_TMPDIR/nonexistent"

    run is_writable "$test_path"

    [ "$status" -ne 0 ]
}

@test "is_writable retorna falha quando nenhum caminho é informado" {
    run is_writable

    [ "$status" -ne 0 ]
}

# ===================================================
# testes para a função contains_line

@test "contains_line encontra uma linha existente" {
    local test_file="$BATS_TEST_TMPDIR/example.txt"

    printf '%s\n' \
        "git" \
        "curl" \
        "wget" > "$test_file"

    run contains_line "curl" "$test_file"

    [ "$status" -eq 0 ]
    [ -z "$output" ]
}

@test "contains_line encontra não uma linha existente" {
    local test_file="$BATS_TEST_TMPDIR/example.txt"

    printf '%s\n' \
        "git" \
        "curl" \
        "wget" > "$test_file"

    run contains_line "jq" "$test_file"

    [ "$status" -ne 0 ]
    [ -z "$output" ]
}

@test "contains_line não confunde uma linha com um trecho de outra" {
    local test_file="$BATS_TEST_TMPDIR/example.txt"

    printf '%s\n' \
        "git" \
        "curl-extra" \
        "wget" > "$test_file"

    run contains_line "curl" "$test_file"

    [ "$status" -ne 0 ]
    [ -z "$output" ]
}

# ===================================================
# testes para a função append_if_missing

@test "append_if_missing adiciona uma linha que ainda não existe" {
    local test_file="$BATS_TEST_TMPDIR/example.txt"

    printf '%s\n' "git" > "$test_file"

    run append_if_missing "curl" "$test_file"

    [ "$status" -eq 0 ]
    grep -Fxq "git" "$test_file"
    grep -Fxq "curl" "$test_file"
}

@test "append_if_missing não duplica uma linha existente" {
    local test_file="$BATS_TEST_TMPDIR/example.txt"

    printf '%s\n' "git" "curl" > "$test_file"

    run append_if_missing "curl" "$test_file"

    [ "$status" -eq 0 ]

    [ "$(grep -Fxc -- "curl" "$test_file")" -eq 1 ]
}

@test "append_if_missing preserva o conteúdo existente" {
    local test_file="$BATS_TEST_TMPDIR/example.txt"

    printf '%s\n' "git" "curl" > "$test_file"

    run append_if_missing "wget" "$test_file"

    [ "$status" -eq 0 ]
    [ "$(cat "$test_file")" = "$(printf '%s\n' git curl wget)" ]
}

@test "append_if_missing mostra sua indepotencia" {
    local test_file="$BATS_TEST_TMPDIR/example.txt"
    printf '%s\n' "git" > "$test_file"
    append_if_missing "curl" "$test_file"
    append_if_missing "curl" "$test_file"
    run append_if_missing "curl" "$test_file"


    [ "$status" -eq 0 ]
    grep -Fxq "git" "$test_file"
    grep -Fxq "curl" "$test_file"
    [ "$(cat "$test_file")" = "$(printf '%s\n' git curl)" ]
}
