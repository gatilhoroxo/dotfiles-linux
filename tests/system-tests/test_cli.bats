#!/usr/bin/env bats
#
# ESTADO: não iniciado

PROJECT_ROOT="$(cd "$BATS_TEST_DIRNAME/../.." && pwd)"
MDEV="$PROJECT_ROOT/bin/mdev"

@test "mdev exibe a mensagem de ajuda quando executado sem argumentos" {
    run "$MDEV"

    [ "$status" -eq 0 ]
    [[ "$output" == *"Help"* ]]
}
