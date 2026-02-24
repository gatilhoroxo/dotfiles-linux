# ==============================================================================
# FUNÇÕES DE INSTALAÇÃO - Ferramentas de desenvolvimento
# ==============================================================================

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

# Ferramentas de containerização: Docker
install_containers() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Docker e Docker Compose..."
  
  sudo apt install docker.io docker-compose -y
  sudo usermod -aG docker $USER
  
  echo -e "${b_green}[SUCESSO]${nc} Docker instalado!"
  echo -e "${b_yellow}[AVISO]${nc} Faça logout e login novamente para usar Docker sem sudo"
}
