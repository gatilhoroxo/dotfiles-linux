#!/usr/bin/env bats

PROJECT_ROOT="$(cd "$BATS_TEST_DIRNAME/../.." && pwd)"

setup() {
    source "$PROJECT_ROOT/lib/utils/command.sh"
}

# testes para a função command_exists

@test "command_exists retorna sucesso para um comando existente" {
    run command_exists bash

    [ "$status" -eq 0 ]
    [ -z "$output" ]
}

@test "command_exists retorna falha para um comando inexistente" {
    run command_exists mdev_command_inexistente_12345

    [ "$status" -eq 1 ]
    [ -z "$output" ]
}

@test "command_exists retorna falha para falta de argumentos" {
    run command_exists

    [ "$status" -eq 1 ]
    [ -z "$output" ]
}


# testes para a função command_path


# testes para a função require_command


# testes para a função require_commands


# testes para a função command_version

