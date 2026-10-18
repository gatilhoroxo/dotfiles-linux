#!/usr/bin/env bats
#
# ESTADO: incompleto
PROJECT_ROOT="$(cd "$BATS_TEST_DIRNAME/../.." && pwd)"

setup() {
    source "$PROJECT_ROOT/lib/configs/colors.sh"
    source "$PROJECT_ROOT/lib/configs/log.sh"
    source "$PROJECT_ROOT/lib/utils/command.sh"
    source "$PROJECT_ROOT/lib/utils/archive.sh"

    SOURCE_DIR="$BATS_TEST_TMPDIR/source"
    EXTRACT_DIR="$BATS_TEST_TMPDIR/extracted"
    FILE="$SOURCE_DIR/example.txt"
    EXPECTED_CONTENT="la la la la"

    mkdir -p "$SOURCE_DIR" "$EXTRACT_DIR"

    # Criar arquivo base de teste
    printf '%s\n' "$EXPECTED_CONTENT" > "$FILE"
}


# ===================================================
# Testes para extract_file
# ===================================================
# Para Arquivos Tarball (.tar, .tar.gz, .tgz, .tar.bz2, .tbz2) =====================

@test "extract_file extrai corretamente um arquivo .tar.bz2" {
    command -v tar >/dev/null 2>&1 ||
        skip "Utilitário 'tar' não instalado; não é possível realizar o teste"

    local archive="$BATS_TEST_TMPDIR/example.tar.bz2"
    tar -cjf "$archive" -C "$SOURCE_DIR" example.txt 

    cd "$EXTRACT_DIR"
    run extract_file "$archive"

    [ "$status" -eq 0 ]
    [ -f "$EXTRACT_DIR/example.txt" ]
    [ "$(cat "$EXTRACT_DIR/example.txt")" = "$EXPECTED_CONTENT" ]
}

@test "extract_file extrai corretamente um arquivo .tbz2" {
    command -v tar >/dev/null 2>&1 ||
        skip "Utilitário 'tar' não instalado; não é possível realizar o teste"

    local archive="$BATS_TEST_TMPDIR/example.tbz2"
    tar -cjf "$archive" -C "$SOURCE_DIR" example.txt

    cd "$EXTRACT_DIR"
    run extract_file "$archive"

    [ "$status" -eq 0 ]
    [ -f "$EXTRACT_DIR/example.txt" ]
    [ "$(cat "$EXTRACT_DIR/example.txt")" = "$EXPECTED_CONTENT" ]
}

@test "extract_file extrai corretamente um arquivo .tar.gz" {
    command -v tar >/dev/null 2>&1 ||
        skip "Utilitário 'tar' não instalado; não é possível realizar o teste"

    local archive="$BATS_TEST_TMPDIR/example.tar.gz"
    tar -czf "$archive" -C "$SOURCE_DIR" example.txt

    cd "$EXTRACT_DIR"
    run extract_file "$archive"

    [ "$status" -eq 0 ]
    [ -f "$EXTRACT_DIR/example.txt" ]
    [ "$(cat "$EXTRACT_DIR/example.txt")" = "$EXPECTED_CONTENT" ]
}

@test "extract_file extrai corretamente um arquivo .tgz" {
    command -v tar >/dev/null 2>&1 ||
        skip "Utilitário 'tar' não instalado; não é possível realizar o teste"

    local archive="$BATS_TEST_TMPDIR/example.tgz"
    tar -czf "$archive" -C "$SOURCE_DIR" example.txt

    cd "$EXTRACT_DIR"
    run extract_file "$archive"

    [ "$status" -eq 0 ]
    [ -f "$EXTRACT_DIR/example.txt" ]
    [ "$(cat "$EXTRACT_DIR/example.txt")" = "$EXPECTED_CONTENT" ]
}

@test "extract_file extrai corretamente um arquivo .tar" {
    command -v tar >/dev/null 2>&1 ||
        skip "Utilitário 'tar' não instalado; não é possível realizar o teste"

    local archive="$BATS_TEST_TMPDIR/example.tar"
    tar -cf "$archive" -C "$SOURCE_DIR" example.txt

    cd "$EXTRACT_DIR"
    run extract_file "$archive"

    [ "$status" -eq 0 ]
    [ -f "$EXTRACT_DIR/example.txt" ]
    [ "$(cat "$EXTRACT_DIR/example.txt")" = "$EXPECTED_CONTENT" ]
}

# Para Compactadores de Arquivo Único (.gz, .bz2, .xz, .Z) =====================

@test "extract_file extrai corretamente um arquivo .gz" {
    command -v gzip >/dev/null 2>&1 ||
        skip "Utilitário 'gzip' não instalado; não é possível realizar o teste"
    command -v gunzip >/dev/null 2>&1 ||
        skip "Utilitário 'gunzip' não instalado; não é possível realizar o teste"

    local archive="$BATS_TEST_TMPDIR/example.txt.gz"
    gzip -c "$FILE" > "$archive"

    cd "$EXTRACT_DIR"
    run extract_file "$archive"

    [ "$status" -eq 0 ]
    [ -f "$EXTRACT_DIR/example.txt" ]
    [ "$(cat "$EXTRACT_DIR/example.txt")" = "$EXPECTED_CONTENT" ]
}

@test "extract_file extrai corretamente um arquivo .bz2" {
    command -v bzip2 >/dev/null 2>&1 ||
        skip "Utilitário 'bzip2' não instalado; não é possível realizar o teste"

    command -v bunzip2 >/dev/null 2>&1 ||
        skip "Utilitário 'bunzip2' não instalado; não é possível realizar o teste"

    local archive="$BATS_TEST_TMPDIR/example.txt.bz2"
    bzip2 -c "$FILE" > "$archive"

    cd "$EXTRACT_DIR"
    run extract_file "$archive"

    [ "$status" -eq 0 ]
    [ -f "$EXTRACT_DIR/example.txt" ]
    [ "$(cat "$EXTRACT_DIR/example.txt")" = "$EXPECTED_CONTENT" ]
}

@test "extract_file extrai corretamente um arquivo .xz" {
    command -v xz >/dev/null 2>&1 || skip "Utilitário 'xz' não instalado no sistema"
    command -v unxz >/dev/null 2>&1 || skip "Utilitário 'unxz' não instalado no sistema"

    local archive="$BATS_TEST_TMPDIR/example.txt.xz"
    xz -c "$FILE" > "$archive"

    cd "$EXTRACT_DIR"
    run extract_file "$archive"

    [ "$status" -eq 0 ]
    [ -f "$EXTRACT_DIR/example.txt" ]
    [ "$(cat "$EXTRACT_DIR/example.txt")" = "$EXPECTED_CONTENT" ]
}

@test "extract_file extrai corretamente um arquivo .Z" {
    command -v compress >/dev/null 2>&1 || skip "Utilitário 'compress' não instalado no sistema"
    command -v uncompress >/dev/null 2>&1 || skip "Utilitário 'uncompress' não instalado no sistema"

    local archive="$BATS_TEST_TMPDIR/example.txt.Z"
    compress -c "$FILE" > "$archive"

    cd "$EXTRACT_DIR"
    run extract_file "$archive"

    [ "$status" -eq 0 ]
    [ -f "$EXTRACT_DIR/example.txt" ]
    [ "$(cat "$EXTRACT_DIR/example.txt")" = "$EXPECTED_CONTENT" ]
}

# Para Arquivos Container / Multi-formato (.zip, .7z, .rar) =====================

@test "extract_file extrai corretamente um arquivo .zip" {
    command -v zip >/dev/null 2>&1 || skip "Utilitário 'zip' não instalado no sistema"
    command -v unzip >/dev/null 2>&1 || skip "Utilitário 'unzip' não instalado no sistema"

    local archive="$BATS_TEST_TMPDIR/example.zip"
    (cd "$SOURCE_DIR" && zip -q "$archive" example.txt)

    cd "$EXTRACT_DIR"
    run extract_file "$archive"

    [ "$status" -eq 0 ]
    [ -f "$EXTRACT_DIR/example.txt" ]
    [ "$(cat "$EXTRACT_DIR/example.txt")" = "$EXPECTED_CONTENT" ]
}

@test "extract_file extrai corretamente um arquivo .7z" {
    command -v 7z >/dev/null 2>&1 || skip "Utilitário '7z' não instalado no sistema"

    local archive="$BATS_TEST_TMPDIR/example.7z"
    (cd "$SOURCE_DIR" && 7z a "$archive" example.txt >/dev/null)

    cd "$EXTRACT_DIR"
    run extract_file "$archive"

    [ "$status" -eq 0 ]
    [ -f "$EXTRACT_DIR/example.txt" ]
    [ "$(cat "$EXTRACT_DIR/example.txt")" = "$EXPECTED_CONTENT" ]
}

@test "extract_file extrai corretamente um arquivo .rar" {
    command -v rar >/dev/null 2>&1 ||
        skip "Utilitário 'rar' não instalado; não é possível criar o arquivo de teste"
    command -v unrar >/dev/null 2>&1 ||
        skip "Utilitário 'unrar' não instalado; não é possível testar a extração"

    local archive="$BATS_TEST_TMPDIR/example.rar"

    (cd "$SOURCE_DIR" && rar a -ep "$archive" example.txt >/dev/null)

    cd "$EXTRACT_DIR"
    run extract_file "$archive"

    [ "$status" -eq 0 ]
    [ -f "$EXTRACT_DIR/example.txt" ]
    [ "$(cat "$EXTRACT_DIR/example.txt")" = "$EXPECTED_CONTENT" ]
}

# ===================================================
# Testes de Casos de Erro

@test "extract_file rejeita um arquivo com extensão não suportada" {
    local unsupported_file="$BATS_TEST_TMPDIR/example.unknown"

    printf 'conteúdo de teste\n' > "$unsupported_file"

    run extract_file "$unsupported_file"

    [ "$status" -ne 0 ]
    [[ "$output" == *"formato não suportado"* ]]
}

# ===================================================
# ===================================================
