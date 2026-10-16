# 
# 
# As funções que fazem parte do que a minha ferramenta vai chamar
# 
# ESTADO: incompleto
# 
# depende de configs/var.sh


#scripts de dependencia
#nessa ordem
# source "$LIB_DIR/config/*"       #primeiro # já feito na main.sh
source "$LIB_DIR/command.sh"     #segundo
source "$LIB_DIR/filesystem.sh"  #terceiro
source "$LIB_DIR/utils.sh"       #quarto

doctor(){
  log_info "Doctor Function Started"
  source "$ENGINE_DIR/doctor.sh"
  log_warning "Functions not implemented yet..."
  log_info "Doctor Function Finished"
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

