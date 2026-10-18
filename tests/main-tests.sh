# 
# ferramenta bats instalada para os testes
#  tutorial: https://bats-core.readthedocs.io/en/stable/ 
# 
# Sobre os testes de unidade, 
                  #  integração, 
                  #  end-to-end e 
                  #  sistema
# ver para os testes de unidade: https://github.com/kward/shunit2 
# also see this: https://shellspec.info/ 
#
# ESTADO: iniciado
#

set -o pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BATS_RUNNER="$PROJECT_ROOT/tools/scripts/run-bats.sh"
TESTS_DIR="$PROJECT_ROOT/tests"


# Categorias disponíveis.
ALL_TYPES=(units integration e2e system)

# Resultados por categoria.
declare -a PASSED=()
declare -a FAILED=()
declare -a SKIPPED=()


# ========================================
# Verificações iniciais

if [[ ! -x "$BATS_RUNNER" ]]; then
  printf 'Erro: executor do Bats não encontrado ou não executável: %s\n' \
    "$BATS_RUNNER" >&2
  exit 1
fi

# ========================================
# Execução de uma categoria

run_test_group() {
  local type="$1"
  local test_dir
  local -a test_files=()
  local result

  case "$type" in
    units)
      test_dir="$TESTS_DIR/unit-tests"
      ;;
    integration)
      test_dir="$TESTS_DIR/integration-tests"
      ;;
    e2e)
      test_dir="$TESTS_DIR/e2e-tests"
      ;;
    system)
      test_dir="$TESTS_DIR/system-tests"
      ;;
    *)
      printf 'Categoria desconhecida: %s\n' "$type" >&2
      return 2
      ;;
  esac

  printf '\n========================================\n'
  printf 'Categoria: %s\n' "$type"
  printf '========================================\n'

  # Uma categoria sem diretório ou sem testes será ignorada.
  if [[ ! -d "$test_dir" ]]; then
    printf 'SKIP: diretório não encontrado: %s\n' "$test_dir"
    SKIPPED+=("$type")
    return 0
  fi

  mapfile -d '' test_files < <(
    find "$test_dir" -type f -name '*.bats' -print0 | sort -z
  )

  if [[ ${#test_files[@]} -eq 0 ]]; then
    printf 'SKIP: nenhum arquivo .bats encontrado em %s\n' "$test_dir"
    SKIPPED+=("$type")
    return 0
  fi

  printf 'Executando %d arquivo(s) de teste...\n\n' "${#test_files[@]}"

  # Executa o Bats e registra o resultado sem encerrar o script.
  "$BATS_RUNNER" --allow-empty-suite "${test_files[@]}"
  result=$?

  if [[ "$result" -eq 0 ]]; then
    printf '\nResultado de %s: PASSOU\n' "$type"
    PASSED+=("$type")
  else
    printf '\nResultado de %s: FALHOU (código %d)\n' "$type" "$result"
    FAILED+=("$type")
  fi

  return 0
}

# ========================================
# Seleção das categorias
# ========================================

if [[ $# -eq 0 ]]; then
  # Sem argumentos: executar tudo.
  SELECTED_TYPES=("${ALL_TYPES[@]}")
else
  SELECTED_TYPES=()

  for arg in "$@"; do
    if [[ "$arg" == "all" ]]; then
      SELECTED_TYPES=("${ALL_TYPES[@]}")
      break
    fi

    case "$arg" in
      units|integration|e2e|system)
        SELECTED_TYPES+=("$arg")
        ;;
      -h|--help)
        printf 'Uso: %s [units] [integration] [e2e] [system] [all]\n' "$0"
        printf '\nSem argumentos, executa todas as categorias.\n'
        exit 0
        ;;
      *)
        printf 'Argumento inválido: %s\n' "$arg" >&2
        printf 'Use --help para consultar as opções.\n' >&2
        exit 2
        ;;
    esac
  done
fi

# ========================================
# Executar os testes
# ========================================

for type in "${SELECTED_TYPES[@]}"; do
  run_test_group "$type"
done

# ========================================
# Resumo final
# ========================================

printf '\n\n========================================\n'
printf 'RESUMO DA SUÍTE DE TESTES\n'
printf '========================================\n'

printf 'Categorias aprovadas: %d\n' "${#PASSED[@]}"
printf 'Categorias com falhas: %d\n' "${#FAILED[@]}"
printf 'Categorias ignoradas: %d\n' "${#SKIPPED[@]}"

if [[ ${#PASSED[@]} -gt 0 ]]; then
  printf '\nPASSOU: %s\n' "${PASSED[*]}"
fi

if [[ ${#FAILED[@]} -gt 0 ]]; then
  printf '\nFALHOU: %s\n' "${FAILED[*]}"
fi

if [[ ${#SKIPPED[@]} -gt 0 ]]; then
  printf '\nIGNORADO: %s\n' "${SKIPPED[*]}"
fi

if [[ ${#FAILED[@]} -gt 0 ]]; then
  printf '\nA suíte terminou com falhas.\n'
  exit 1
fi

if [[ ${#PASSED[@]} -eq 0 ]]; then
  printf '\nNenhuma categoria de testes foi executada.\n'
  exit 1
fi

printf '\nA suíte terminou sem falhas.\n'
exit 0

