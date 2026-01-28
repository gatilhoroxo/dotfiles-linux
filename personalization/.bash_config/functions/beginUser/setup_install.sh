
# ==============================================================================
# FUNÇÕES MODULARES POR CATEGORIA DE INSTALAÇÃO
# ==============================================================================

# Configuração base do sistema: GRUB, atualizações e ferramentas GNOME
setup_system_base() {
  echo -e "${b_cyan}[INFO]${nc} Configurando sistema base..."
  
  # Configuração do GRUB
  sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
  sysupdate
  sudo apt install grub-customizer -y
  sudo update-grub

  # Ferramentas do sistema
  sudo apt install -y gnome-tweaks gnome-shell-extensions 
  sudo apt-get install -y ubuntu-restricted-extras 
  sysupdate
  
  echo -e "${b_green}[SUCESSO]${nc} Sistema base configurado!"
}

# Ferramentas de produtividade: gerenciador de senhas, notas, tarefas
install_productivity_tools() {
  echo -e "${b_cyan}[INFO]${nc} Instalando ferramentas de produtividade..."
  
  sudo snap install bitwarden -y && sudo snap connect bitwarden:password-manager-service
  sudo apt install flatpak -y
  sudo snap install obsidian --classic
  sudo snap install todoist
  
  echo -e "${b_green}[SUCESSO]${nc} Ferramentas de produtividade instaladas!"
}

# Compiladores e ferramentas básicas de desenvolvimento
install_dev_compilers() {
  echo -e "${b_cyan}[INFO]${nc} Instalando compiladores e ferramentas de desenvolvimento..."
  
  sudo apt install -y gcc g++ gdb valgrind clang build-essential make
  sudo apt install -y git curl wget unzip zip 
  
  echo -e "${b_green}[SUCESSO]${nc} Compiladores instalados!"
}

# Linguagens de programação: Python, Java, Rust
install_languages() {
  echo -e "${b_cyan}[INFO]${nc} Instalando linguagens de programação..."
  
  # Python
  sudo apt install -y python3 python3-pip python3-venv
  
  # Java
  sudo apt install -y openjdk-21-jdk maven
  
  # Rust
  curl https://sh.rustup.rs -sSf | sh
  
  sysupdate
  echo -e "${b_green}[SUCESSO]${nc} Linguagens instaladas!"
}

# Ferramentas de desenvolvimento: Git, GitHub CLI, Qt
install_dev_tools() {
  echo -e "${b_cyan}[INFO]${nc} Instalando ferramentas de desenvolvimento..."
  
  # Framework Qt
  sudo apt install -y qtcreator qtbase5-dev qttools5-dev qt5-qmake
  
  # GitHub CLI
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
  sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
  sysupdate 
  sudo apt install gh -y
  
  echo -e "${b_green}[SUCESSO]${nc} Ferramentas de desenvolvimento instaladas!"
}

# Ferramentas de eletrônica: KiCad, Arduino, PlatformIO, Octave
install_electronics() {
  echo -e "${b_cyan}[INFO]${nc} Instalando ferramentas de eletrônica..."
  
  # Shell/Terminal melhorado
  sudo apt install zsh -y 
  
  # Design de PCB
  sudo apt install kicad -y
  
  # Computação científica
  sudo apt install octave gnuplot gnuplot-x11 -y
  
  # Plataformas de desenvolvimento embarcado
  sudo snap install arduino
  sudo apt install platformio -y
  
  echo -e "${b_green}[SUCESSO]${nc} Ferramentas de eletrônica instaladas!"
}

# Ferramentas de containerização: Docker
install_containers() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Docker e Docker Compose..."
  
  sudo apt install docker.io docker-compose -y
  sudo usermod -aG docker $USER
  
  echo -e "${b_green}[SUCESSO]${nc} Docker instalado!"
  echo -e "${b_yellow}[AVISO]${nc} Faça logout e login novamente para usar Docker sem sudo"
}

# Ferramentas LaTeX: TeXLive, TeXStudio, xclip
install_latex_tools() {
  echo -e "${b_cyan}[INFO]${nc} Instalando ferramentas LaTeX..."
  
  sudo apt install texlive-base texstudio -y
  sudo apt install xclip -y
  
  echo -e "${b_green}[SUCESSO]${nc} LaTeX instalado!"
}

# Navegador: Google Chrome
install_browser() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Google Chrome..."
  
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install ./google-chrome*.deb -y
  rm google-chrome*.deb
  
  echo -e "${b_green}[SUCESSO]${nc} Google Chrome instalado!"
}

