
# ==============================================================================
# Configuração de Novo Desktop Ubuntu - Funções de Instalação e Desinstalação
# ==============================================================================

# Criar estrutura de diretórios para desenvolvimento
setup_directories() {
  echo -e "${b_cyan}[INFO]${nc} Criando estrutura de diretórios..."
  
  cd ~
  mkdir -p ~/dev/{notas,projects,ufpe} ~/tools/{arduino-dir,python-dir,godot-dir}
  
  echo -e "${b_green}[SUCESSO]${nc} Diretórios criados!"
}

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# FUNÇÕES AUXILIARES
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

# Mostrar resumo do que será instalado
show_install_plan() {
  echo -e "\n${b_purple}════════════════════════════════════════════════════════${nc}"
  echo -e "${b_purple}   RESUMO DO PLANO DE INSTALAÇÃO${nc}"
  echo -e "${b_purple}════════════════════════════════════════════════════════${nc}\n"
  
  local install_count=0
  
  if [ "$SETUP_DIRECTORIES" = true ]; then
    echo -e "${b_green}✓${nc} Estrutura de Diretórios: ~/dev/{notas,projects,ufpe}, ~/tools/{arduino-dir,python-dir,godot-dir}"
    ((install_count++))
  fi
  
  if [ "$INSTALL_SYSTEM_BASE" = true ]; then
    echo -e "${b_green}✓${nc} Sistema Base: GRUB Customizer, GNOME Tweaks, Shell Extensions, Ubuntu Extras"
    ((install_count++))
  fi
  
  if [ "$INSTALL_PRODUCTIVITY" = true ]; then
    echo -e "${b_green}✓${nc} Produtividade: Bitwarden, Flatpak, Obsidian, Todoist, HTTrack"
    ((install_count++))
  fi
  
  if [ "$INSTALL_DEV_COMPILERS" = true ]; then
    echo -e "${b_green}✓${nc} Compiladores: GCC, G++, GDB, Valgrind, Clang, Make, Git, Curl, Wget"
    ((install_count++))
  fi
  
  if [ "$INSTALL_LANGUAGES" = true ]; then
    echo -e "${b_green}✓${nc} Linguagens: Python 3 + pip + venv, OpenJDK 21 + Maven, Rust"
    ((install_count++))
  fi
  
  if [ "$INSTALL_DEV_TOOLS" = true ]; then
    echo -e "${b_green}✓${nc} Dev Tools: Qt Framework (Creator + libs), GitHub CLI"
    ((install_count++))
  fi
  
  if [ "$INSTALL_ELECTRONICS" = true ]; then
    echo -e "${b_green}✓${nc} Eletrônica: Zsh, KiCad, Octave, Gnuplot, Arduino, PlatformIO"
    ((install_count++))
  fi
  
  if [ "$INSTALL_BROWSER" = true ]; then
    echo -e "${b_green}✓${nc} Navegador: Google Chrome (stable)"
    ((install_count++))
  fi
  
  if [ "$INSTALL_CONTAINERS" = true ]; then
    echo -e "${b_green}✓${nc} Containers: Docker + Docker Compose (usuário adicionado ao grupo docker)"
    ((install_count++))
  fi
  
  if [ "$INSTALL_LATEX" = true ]; then
    echo -e "${b_green}✓${nc} LaTeX: TeXLive Base, TeXStudio, xclip"
    ((install_count++))
  fi
  
  if [ $install_count -eq 0 ]; then
    echo -e "${b_yellow}⚠${nc} Nenhuma categoria selecionada para instalação!"
  fi
  
  echo -e "\n${b_cyan}Total de categorias a instalar: ${b_white}$install_count${nc}"
  echo -e "${b_purple}════════════════════════════════════════════════════════${nc}\n"
  
  if [ $install_count -gt 0 ]; then
    read -p "Deseja continuar com a instalação? (s/n): " confirm
    if [[ ! $confirm =~ ^[Ss]$ ]]; then
      echo -e "${b_yellow}[CANCELADO]${nc} Instalação abortada pelo usuário."
      return 1
    fi
  else
    return 1
  fi
  
  return 0
}

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# FUNÇÃO ORQUESTRADORA - Iniciando um novo usuário em um novo desktop Ubuntu
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
beginUser(){

  # Mostrar plano de instalação e confirmar
  show_install_plan || return 1

  echo -e "${b_purple}════════════════════════════════════════════════════════${nc}"
  echo -e "${b_purple}   Configuração de Novo Desktop Ubuntu - Setup Completo${nc}"
  echo -e "${b_purple}════════════════════════════════════════════════════════${nc}\n"

  # Executar instalações conforme variáveis de controle
  [ "$SETUP_DIRECTORIES" = true ] && setup_directories
  [ "$INSTALL_SYSTEM_BASE" = true ] && setup_system_base
  [ "$INSTALL_PRODUCTIVITY" = true ] && install_productivity_tools
  [ "$INSTALL_DEV_COMPILERS" = true ] && install_dev_compilers
  [ "$INSTALL_LANGUAGES" = true ] && install_languages
  [ "$INSTALL_DEV_TOOLS" = true ] && install_dev_tools
  [ "$INSTALL_ELECTRONICS" = true ] && install_electronics
  [ "$INSTALL_BROWSER" = true ] && install_browser
  [ "$INSTALL_CONTAINERS" = true ] && install_containers
  [ "$INSTALL_LATEX" = true ] && install_latex_tools

  # Limpeza final
  echo -e "\n${b_green}════════════════════════════════════════════════════════${nc}"
  echo -e "${b_green}   ✓ Configuração Completa! Sistema pronto para uso.${nc}"
  echo -e "${b_green}════════════════════════════════════════════════════════${nc}"
}

# Remover estrutura de diretórios
remove_directories() {
  echo -e "${b_cyan}[INFO]${nc} Removendo estrutura de diretórios..."
  echo -e "${b_yellow}[AVISO]${nc} Certifique-se de fazer backup dos dados antes!"
  
  read -p "Tem certeza que deseja remover ~/dev e ~/tools? (digite 'sim' para confirmar): " confirm
  if [ "$confirm" = "sim" ]; then
    rm -rf ~/dev ~/tools
    echo -e "${b_green}[SUCESSO]${nc} Diretórios removidos!"
  else
    echo -e "${b_yellow}[CANCELADO]${nc} Diretórios mantidos."
  fi
}

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# FUNÇÃO DE DESINSTALAÇÃO COMPLETA
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
uninstallUser(){
  echo -e "${b_red}════════════════════════════════════════════════════════${nc}"
  echo -e "${b_red}   Desinstalação de Componentes do Desktop${nc}"
  echo -e "${b_red}════════════════════════════════════════════════════════${nc}\n"
  
  echo -e "${b_yellow}[AVISO]${nc} Esta operação removerá pacotes instalados."
  read -p "Tem certeza que deseja continuar? (digite 'sim' para confirmar): " confirm
  
  if [ "$confirm" != "sim" ]; then
    echo -e "${b_yellow}[CANCELADO]${nc} Operação abortada."
    return 1
  fi
  
  echo -e "\nSelecione as categorias para desinstalar:\n"
  
  read -p "Remover Sistema Base? (s/n): " resp && [[ $resp =~ ^[Ss]$ ]] && uninstall_system_base
  read -p "Remover Ferramentas de Produtividade? (s/n): " resp && [[ $resp =~ ^[Ss]$ ]] && uninstall_productivity_tools
  read -p "Remover Compiladores Extras? (s/n): " resp && [[ $resp =~ ^[Ss]$ ]] && uninstall_dev_compilers
  read -p "Remover Linguagens de Programação? (s/n): " resp && [[ $resp =~ ^[Ss]$ ]] && uninstall_languages
  read -p "Remover Ferramentas de Desenvolvimento? (s/n): " resp && [[ $resp =~ ^[Ss]$ ]] && uninstall_dev_tools
  read -p "Remover Ferramentas de Eletrônica? (s/n): " resp && [[ $resp =~ ^[Ss]$ ]] && uninstall_electronics
  read -p "Remover Google Chrome? (s/n): " resp && [[ $resp =~ ^[Ss]$ ]] && uninstall_browser
  read -p "Remover Docker? (s/n): " resp && [[ $resp =~ ^[Ss]$ ]] && uninstall_containers
  read -p "Remover LaTeX? (s/n): " resp && [[ $resp =~ ^[Ss]$ ]] && uninstall_latex_tools
  read -p "Remover Diretórios ~/dev e ~/tools? (s/n): " resp && [[ $resp =~ ^[Ss]$ ]] && remove_directories
  
  # Limpeza final
  echo -e "\n${b_cyan}[INFO]${nc} Executando limpeza final..."
  sudo apt autoremove -y
  sudo apt autoclean
  
  echo -e "\n${b_green}════════════════════════════════════════════════════════${nc}"
  echo -e "${b_green}   ✓ Desinstalação Completa!${nc}"
  echo -e "${b_green}════════════════════════════════════════════════════════${nc}"
}
