#!/usr/bin/env bats

PROJECT_ROOT="$(cd "$BATS_TEST_DIRNAME/../.." && pwd)"

setup() {
    source "$PROJECT_ROOT/lib/utils/command.sh"
}

# ===================================================
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

# ===================================================
# testes para a função command_path

@test "command_path retorna sucesso para um comando existente" {
    run command_path bash

    [ "$status" -eq 0 ]
    # rever essa decisão
    [ -n "$output" ] 
}

@test "command_path retorna falha para um comando inexistente" {
    run command_path mdev_command_inexistente_12345

    [ "$status" -eq 1 ]
    [ -z "$output" ]
}

@test "command_path retorna falha para falta de argumentos" {
    run command_path

    [ "$status" -eq 1 ]
    [ -z "$output" ]
}

# ===================================================
# testes para a função require_command

@test "require_command retorna sucesso para um comando existente" {
    run require_command bash

    [ "$status" -eq 0 ]
    [ -z "$output" ] 
}

@test "require_command retorna falha para um comando inexistente" {
    run require_command mdev_command_inexistente_12345

    [ "$status" -eq 1 ]
    # [ -z "$output" ]
}

@test "require_command retorna falha para falta de argumentos" {
    run require_command

    [ "$status" -eq 1 ]
    [ -z "$output" ]
}

# ===================================================
# testes para a função require_commands
@test "require_commands retorna sucesso para um comando existente" {
    run require_commands bash

    [ "$status" -eq 0 ]
    [ -z "$output" ] 
}

@test "require_commands retorna sucesso para dois comando existente" {
    run require_commands bash gcc

    [ "$status" -eq 0 ]
    [ -z "$output" ] 
}

@test "require_commands retorna falha para um comando inexistente no fim" {
    run require_commands bash mdev_command_inexistente_12345

    [ "$status" -eq 1 ]
    [ -n "$output" ]
}

@test "require_commands retorna falha para um comando inexistente no início" {
    run require_commands mdev_command_inexistente_12345 gcc

    [ "$status" -eq 1 ]
    [ -n "$output" ]
}

@test "require_commands retorna falha para falta de argumentos" {
    run require_commands

    [ "$status" -eq 1 ]
    [ -z "$output" ]
}

# ===================================================
# testes para a função command_version

@test "command_version retorna sucesso para um comando existente" {
    run command_version bash

    [ "$status" -eq 0 ]
    [ -n "$output" ] 
}

@test "command_version retorna falha para um comando inexistente" {
    run command_version mdev_command_inexistente_12345

    [ "$status" -eq 1 ]
    [ -n "$output" ]
}

@test "command_version retorna falha para falta de argumentos" {
    run command_version

    [ "$status" -eq 1 ]
    [ -z "$output" ]
}

# fim dos testes 
