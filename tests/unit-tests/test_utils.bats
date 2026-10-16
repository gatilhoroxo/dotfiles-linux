#!/usr/bin/env bats
#
# ESTADO: incompleto

PROJECT_ROOT="$(cd "$BATS_TEST_DIRNAME/../.." && pwd)"

setup() {
    source "$PROJECT_ROOT/lib/configs/colors.sh"
    source "$PROJECT_ROOT/lib/configs/log.sh"
    source "$PROJECT_ROOT/lib/utils/command.sh"
    source "$PROJECT_ROOT/lib/utils/filesystem.sh"
    source "$PROJECT_ROOT/lib/utils.sh"
}


# ===================================================
# testes para a função ask_confirmation

@test "ask_confirmation retorna sucesso para um sim" {
    files="$BATS_TEST_TMPDIR/file_teste.txt"
    echo "y" > $files
    run ask_confirmation < "y"

    [ "$status" -eq 0 ]
}

