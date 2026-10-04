# 
# 
# As funções que fazem parte do que a minha ferramenta vai chamar
# 
# ESTADO: incompleto
# 

PROJECT_ROOT="$(find_project_root)"
readonly LIB_DIR="$PROJECT_ROOT/lib"
readonly STATE_DIR="$PROJECT_ROOT/state"
readonly TOOLS_DIR="$PROJECT_ROOT/tools"

#scripts de dependencia
#nessa ordem
source "$LIB_DIR/config/*"       #primeiro
source "$LIB_DIR/command.sh"     #segundo
source "$LIB_DIR/filesystem.sh"  #terceiro
source "$LIB_DIR/utils.sh"       #quarto

doctor(){

}

setup(){}

install(){}

enter(){}

update(){}

clean(){}

