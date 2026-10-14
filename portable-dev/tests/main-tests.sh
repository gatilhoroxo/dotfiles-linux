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


PROJECT_ROOT="$(cd "$BATS_TEST_DIRNAME/../.." && pwd)"
BATS_BIN="$PROJECT_ROOT/tools/scripts/run-bats.sh"

# roda no inicio dos testes (nao sei se de cada teste)
setup() {
  load "$PROJECT_ROOT/tests/helper/common.sh"
  _common_setup
}

# roda no fim de cada teste do arquivo
teardown() {
  :
}

test_units(){
  ./$BATS_BIN unit_tests
}

test_integration(){}

test_e2e(){}

test_system(){}
