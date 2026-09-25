
source ../lib/core.sh
source ../lib/colors.sh
source ../lib/log.sh
source ../lib/command.sh
source ../lib/filesystem.sh

TEMP_ROOT="./temp-root"
TEST_DIR="./$TEMP_ROOT/sandbox"

rm -rf "$TEMP_ROOT"
mkdir -p "$TEST_DIR"
cd "$TEST_DIR"

# ================================= 

# ok

echo "Func 1 'command_exists': Teste 1"
echo -n "   É para sair verdadeiro: "
if command_exists git; then
  echo "existe"
else 
  echo "não existe"
fi

echo "Func 1 'command_exists': Teste 2"
echo -n "   É para sair falso: "
if command_exists prog_inexistente; then
  echo "existe"
else 
  echo "não existe"
fi

echo "Func 1 'command_exists': Teste 3"
echo -n "   É para sair 'comando vazio' ou falso: "
if command_exists prog_inexistente; then
  echo "existe"
else 
  echo "não existe"
fi

# ---------------------------

# ok

echo "Func 2 'command_path': Teste 1"
echo -n "   É para sair o caminho certo: "
TEMP=$(command_path git)
echo -e "caminho em $TEMP"

echo "Func 2 'command_path': Teste 2"
echo -n "   É para sair nada: "
TEMP=$(command_path programa_inexistente)
echo -e "resposta [$TEMP]"

echo "Func 2 'command_path': Teste 3"
echo -n "   É para sair 'argumento vazio' ou não existe: "
TEMP=$(command_path)
echo -e "resposta [$TEMP]"

# ---------------------------

# T1: ok || T2: ok || T3: ok

echo "Func 3 'require_command': Teste 1"
echo -n "   É para sair certo: "
if require_command git; then
  echo -e "certo"
else
  echo -e "errado"
fi

echo "Func 3 'require_command': Teste 2"
echo -n "   É para sair errado: "
TEMP=$(require_command programa_inexistente)
echo -e "resposta [$TEMP]"

echo "Func 3 'require_command': Teste 3"
echo -n "   É para sair 'argumento vazio' ou não existe: "
TEMP=$(require_command)
echo -e "resposta [$TEMP]"

# ---------------------------

# T1: ok || T2: ok || T3: ok

echo "Func 4 'command_version': Teste 1"
echo -n "   É para sair a versão do git: "
TEMP=$(command_version git)
echo -e "resposta [$TEMP]"

echo "Func 4 'command_version': Teste 2"
echo -n "   É para sair programa inexistente: "
TEMP=$(command_version programa_inexistente)
echo -e "resposta [$TEMP]"

echo "Func 4 'command_version': Teste 3"
echo -n "   É para sair 'argumento vazio' ou não existe: "
TEMP=$(command_version)
echo -e "resposta [$TEMP]"

# ---------------------------

# T1: ok || T2: ok || T3: ok

echo "Func 5 'require_commands': Teste 1"
echo -n "   É para sair certo com tudo: "
if require_commands git gcc python3; then
  echo -e "certo com tudo"
else
  echo -e "errado"
fi

echo "Func 5 'require_commands': Teste 2.1"
echo -n "   É para sair errado: "
TEMP=$(require_commands programa_inexistente git gcc)
echo -e "resposta [$TEMP]"

echo "Func 5 'require_commands': Teste 2.2"
echo -n "   É para sair errado: "
TEMP=$(require_commands git gcc programa_inexistente python3)
echo -e "resposta [$TEMP]"

echo "Func 5 'require_commands': Teste 3"
echo -n "   É para sair 'argumento vazio' ou não existe: "
TEMP=$(require_commands)
echo -e "resposta [$TEMP]"


# ================================= 

rm -rf "$TEST_DIR"
cd ../..
rm -rf "$TEMP_ROOT"