#!/bin/bash
# 
# As funções que fazem parte do que a minha ferramenta vai chamar
# 
# ESTADO: incompleto
# 
# depende de configs/var.sh


#scripts de dependencia
#nessa ordem
# source "$LIB_DIR/config/*"       #primeiro # já feito na main.sh
source "$UTILS_DIR/command.sh"     #segundo
source "$UTILS_DIR/filesystem.sh"  #terceiro
source "$LIB_DIR/utils.sh"         #quarto
source "$LIB_DIR/capabilities.sh"  #quinto

doctor(){
  log_info "======================="
  log_info "Doctor Function Started"

  source "$ENGINE_DIR/doctor.sh"
  run_doctor 

  log_info "Doctor Function Finished"
  log_info "========================"
}

setup(){
  source "$ENGINE_DIR/setup.sh"
  log_warning "Functions not implemented yet..."
}

install(){
  source "$ENGINE_DIR/install.sh"
  log_warning "Functions not implemented yet..."
}

enter(){
  source "$ENGINE_DIR/enter.sh"
  log_warning "Functions not implemented yet..."
}

update(){
  source "$ENGINE_DIR/update.sh"
  log_warning "Functions not implemented yet..."
}

clean(){
  source "$ENGINE_DIR/clean.sh"
  log_warning "Functions not implemented yet..."
}

