# ==============================================================================
# FUNÇÕES DE INSTALAÇÃO - Ferramentas de produtividade
# ==============================================================================

install_productivity_tools() {
  echo -e "${b_cyan}[INFO]${nc} Instalando ferramentas de produtividade..."
  
  sudo snap install bitwarden && sudo snap connect bitwarden:password-manager-service
  sudo snap install obsidian --classic
  sudo snap install todoist 
  sudo snap install notion-desktop
  sudo apt install -y httrack kiwix flatpak
  sudo apt install -y okular 
  
  echo -e "${b_green}[SUCESSO]${nc} Ferramentas de produtividade instaladas!"
}

# Ferramentas LaTeX: TeXLive, TeXStudio, xclip
install_latex_tools() {
  echo -e "${b_cyan}[INFO]${nc} Instalando ferramentas LaTeX..."
  
  sudo apt install texlive-base texstudio -y
  sudo apt install xclip -y
  
  echo -e "${b_green}[SUCESSO]${nc} LaTeX instalado!"
}


