# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# FUNÇÃO ORQUESTRADORA - Instalação de ferramentas para laboratório CIN
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

make_path(){
  # 1. Garante que o arquivo de aliases existe
  if [ ! -f "$ALIAS_FILE" ]; then
    touch "$ALIAS_FILE"
    echo "# Arquivo de Aliases para Ferramentas Locais" > "$ALIAS_FILE"
  fi
  
  # 2. Conecta o tools.bash ao .bashrc
  if ! grep -q "source $ALIAS_FILE" "$BASH_ALIASES"; then
    echo "" >> "$BASH_ALIASES"
    echo "# Carregar aliases locais" >> "$BASH_ALIASES"
    echo "if [ -f $ALIAS_FILE ]; then source $ALIAS_FILE; fi" >> "$BASH_ALIASES"
    echo -e "${green}Link criado no .bashrc para ler o tools.bash${nc}"
  fi
  
}

setup_computer_cin(){
  make_path 
  check_admin

  #install_system_base_cin

  # Install productivity tools
  install_obsidian_manual
  install_todoist_manual
  install_bitwarden_manual
  install_httrack_manual

  # Install dev tools
  install_vscode_portable
  install_github_cli
  install_godot_engine_manual

  # Install generic tools
  install_calibre_manual
  install_gimp_manual
  install_drawio_manual

}