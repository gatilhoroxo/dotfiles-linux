#!/usr/bin/env bats
#
# ESTADO: incompleto

PROJECT_ROOT="$(cd "$BATS_TEST_DIRNAME/../.." && pwd)"

setup() {
    source "$PROJECT_ROOT/lib/configs/colors.sh"
    source "$PROJECT_ROOT/lib/configs/log.sh"
    source "$PROJECT_ROOT/lib/utils/archive.sh"

    file="$BATS_TEST_TMPDIR/example.txt"
}


# ===================================================
# testes para a função extract_file

@test "extract_file extrai um arquivo .tar.bz2 ou tbz2" {
    echo "la la la la" > "$file"

    # .tar.bz2 e .tbz2
    zipado="$BATS_TEST_TMPDIR/zipado"
    tar -cjvf "$zipado" "$file"

    # ------------------------
    run extract_file "$zipado"
    [ "$status" -eq 0 ]
    # ------------------------

    rm "$file" 
    rm "$zipado"
}


# ===================================================
# ===================================================

    # .tar.gz e .tgz
    #filetgz="$BATS_TEST_TMPDIR/filetgz"
    #tar -czvf "$filetgz" "$file"
    #rm "$filetgz"

    # .tar
    #filetar="$BATS_TEST_TMPDIR/filetar"
    #tar -cvf "$filetar" "$file"
    #rm "$filetar"

    # .bz2
    #filebzip="$BATS_TEST_TMPDIR/filebzip"
    #bzip2 -k "$file"
    #mv "$BATS_TEST_TMPDIR/example.txt.bz2" "$filebzip"
    #rm "$filebzip"

    # .rar
    #filerar="$BATS_TEST_TMPDIR/filerar"
    #rar a "$filerar" "$file" 
    #rm "$filerar"

    # .zip
    #filezip="$BATS_TEST_TMPDIR/filezip"
    #zip -r "$filezip" "$file"
    #rm "$filezip"

    # .xz
    #filexz="$BATS_TEST_TMPDIR/filexz"
    #xz -k "$file"
    #mv "$BATS_TEST_TMPDIR/example.txt.xz" "$filexz"
    #rm "$filexz"

    # .gz
    #filegz="$BATS_TEST_TMPDIR/filegz"
    #gzip -k "$file"
    #mv "$BATS_TEST_TMPDIR/example.txt.gz" "$filegz"
    #rm "$filegz"

    # .7z
    #filesetez="$BATS_TEST_TMPDIR/filesetez"
    #7z a "$filesetez" "$file"
    #rm "$filesetez"

    # .Z
    #filezz="$BATS_TEST_TMPDIR/filezz"
    #compress -k "$file"
    #mv "$BATS_TEST_TMPDIR/example.txt.Z" "$filezz"
    #rm "$filezz"

# ===================================================
# ===================================================

