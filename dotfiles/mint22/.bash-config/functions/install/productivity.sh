# ==============================================================================
# FUNÇÕES DE INSTALAÇÃO - Ferramentas de produtividade
# ==============================================================================

install_productivity_tools() {
  echo -e "${b_cyan}[INFO]${nc} Instalando ferramentas de produtividade..."
  
  sudo snap install bitwarden -y && sudo snap connect bitwarden:password-manager-service
  sudo apt install flatpak -y
  sudo snap install obsidian --classic -y
  sudo snap install todoist -y
  sudo apt install httrack -y
  sudo apt install kiwix -y
  
  echo -e "${b_green}[SUCESSO]${nc} Ferramentas de produtividade instaladas!"
}

# Ferramentas LaTeX: TeXLive, TeXStudio, xclip
install_latex_tools() {
  echo -e "${b_cyan}[INFO]${nc} Instalando ferramentas LaTeX..."
  
  sudo apt install texlive-base texstudio -y
  sudo apt install xclip -y
  
  echo -e "${b_green}[SUCESSO]${nc} LaTeX instalado!"
}


