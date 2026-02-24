
# ==============================================================================
# FUNÇÕES MODULARES POR CATEGORIA DE DESINSTALAÇÃO
# ==============================================================================

# Remover sistema base
uninstall_system_base(){
  echo -e "${b_cyan}[INFO]${nc} Revertendo sistema base..."
  
  sudo apt remove gnome-tweaks gnome-shell-extensions -y
  sudo apt remove ubuntu-restricted-extras -y
  sudo add-apt-repository --remove ppa:danielrichter2007/grub-customizer -y
  
  echo -e "${b_green}[SUCESSO]${nc} Sistema base revertido!"
}

# Remover ferramentas de produtividade
uninstall_productivity_tools() {
  echo -e "${b_cyan}[INFO]${nc} Removendo ferramentas de produtividade..."
  
  sudo snap remove bitwarden obsidian todoist
  sudo apt remove flatpak -y
  
  echo -e "${b_green}[SUCESSO]${nc} Ferramentas de produtividade removidas!"
}

# Remover compiladores e ferramentas de desenvolvimento
uninstall_dev_compilers() {
  echo -e "${b_cyan}[INFO]${nc} Removendo compiladores..."
  echo -e "${b_yellow}[AVISO]${nc} GCC/G++ são dependências do sistema. Removendo apenas extras..."
  
  sudo apt remove valgrind clang -y
  # build-essential, make, git, curl, wget são mantidos por segurança
  
  echo -e "${b_green}[SUCESSO]${nc} Compiladores extras removidos!"
}

# Remover linguagens de programação
uninstall_languages() {
  echo -e "${b_cyan}[INFO]${nc} Removendo linguagens de programação..."
  echo -e "${b_yellow}[AVISO]${nc} Python3 é dependência do sistema e não será removido."
  
  # Remover apenas Python extras
  sudo apt remove python3-pip python3-venv -y
  
  # Remover Java
  sudo apt remove openjdk-21-jdk maven -y
  
  # Remover Rust
  if [ -d "$HOME/.cargo" ]; then
    rustup self uninstall -y
  fi
  
  echo -e "${b_green}[SUCESSO]${nc} Linguagens removidas!"
}

# Remover ferramentas de desenvolvimento
uninstall_dev_tools() {
  echo -e "${b_cyan}[INFO]${nc} Removendo ferramentas de desenvolvimento..."
  
  # Remover Qt
  sudo apt remove qtcreator qtbase5-dev qttools5-dev qt5-qmake -y
  
  # Remover GitHub CLI
  sudo apt remove gh -y
  sudo rm -f /etc/apt/sources.list.d/github-cli.list
  sudo rm -f /usr/share/keyrings/githubcli-archive-keyring.gpg
  
  echo -e "${b_green}[SUCESSO]${nc} Ferramentas de desenvolvimento removidas!"
}

# Remover ferramentas de eletrônica
uninstall_electronics() {
  echo -e "${b_cyan}[INFO]${nc} Removendo ferramentas de eletrônica..."
  
  sudo apt remove zsh kicad octave gnuplot gnuplot-x11 platformio -y
  sudo snap remove arduino
  
  echo -e "${b_green}[SUCESSO]${nc} Ferramentas de eletrônica removidas!"
}

# Remover Docker
uninstall_containers() {
  echo -e "${b_cyan}[INFO]${nc} Removendo Docker..."
  echo -e "${b_yellow}[AVISO]${nc} Isso removerá todos os containers e imagens!"
  
  sudo apt remove docker.io docker-compose -y
  sudo gpasswd -d $USER docker
  
  echo -e "${b_green}[SUCESSO]${nc} Docker removido!"
}

# Remover ferramentas LaTeX
uninstall_latex_tools() {
  echo -e "${b_cyan}[INFO]${nc} Removendo ferramentas LaTeX..."
  
  sudo apt remove texlive-base texstudio xclip -y
  
  echo -e "${b_green}[SUCESSO]${nc} LaTeX removido!"
}

# Remover Google Chrome
uninstall_browser() {
  echo -e "${b_cyan}[INFO]${nc} Removendo Google Chrome..."
  
  sudo apt remove google-chrome-stable -y
  
  echo -e "${b_green}[SUCESSO]${nc} Google Chrome removido!"
}
