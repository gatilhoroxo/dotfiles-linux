# ==============================================================================
# FUNÇÕES DE INSTALAÇÃO - Ferramentas de desenvolvimento
# ==============================================================================

# Compiladores e ferramentas básicas de desenvolvimento
install_dev_base() {
  echo -e "${b_cyan}[INFO]${nc} Instalando ferramentas de desenvolvimento, compiladores e linguagens de programação..."
  
  # sistem tools
  sudo apt install -y gnome-tweaks gnome-shell-extensions 
  sudo apt-get install -y ubuntu-restricted-extras
  
  sysupdate
  
  # shell/Terminal melhorado
  sudo apt install -y zsh 

  # utils tools
  sudo apt install -y git gh curl wget vim tmux htop btop ripgrep fd-find tree 
  #GithubCLI_pre_install 
  # classic development
  sudo apt install -y build-essential gcc g++ gdb clang make
  # making programs and software interface interaction
  sudo apt install -y qtcreator qtbase5-dev qttools5-dev qt5-qmake
  # others dev tools
  sudo apt install -y unzip zip valgrind 
  
  sysupdate

  # dev languages
  #python
  sudo apt install -y python3 python3-pip python3-venv
  #java
  sudo apt install -y openjdk-21-jdk maven
  #rust
  curl https://sh.rustup.rs -sSf | sh

  sysupdate

  echo -e "${b_green}[SUCESSO]${nc} Ferramentas, Compiladores e Linguagens instalados!"
}

# Ferramentas de containerização: Docker
install_containers() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Docker e Docker Compose..."
  
  #base
  sudo apt install -y ca-certificates curl gnupg lsb-release

  #chave de segurança e repositório oficial
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt update

  #docker
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  echo -e "${b_green}[SUCESSO]${nc} Docker instalado!"

  #sempre precisa de permissao de sudo, mas cuidado com isso  
  sudo usermod -aG docker $USER
  echo -e "${b_yellow}[AVISO]${nc} Faça logout e login novamente para usar Docker sem sudo"

}

# Ferramentas de embarcados
install_embedded(){
  echo -e "${b_cyan}[INFO]${nc} Instalando ferramentas de embarcados..."
    
  # Plataformas de desenvolvimento embarcado
  echo "deb [trusted=yes] https://dl.espressif.com/dl/eim/apt/ stable main" | sudo tee /etc/apt/sources.list.d/espressif.list
  sudo apt update
  sudo apt install -y platformio arduino eim

  echo -e "${b_green}[SUCESSO]${nc} Ferramentas de embarcados instaladas!"
}

# Ferramentas de eletronica
install_electronics() {
  echo -e "${b_cyan}[INFO]${nc} Instalando ferramentas de eletrônica..."

  # Design de PCB
  sudo add-apt-repository --yes ppa:kicad/kicad-9.0-releases && sudo apt update
  sudo apt install --install-recommends kicad
  
  # Modelagem 3D
  sudo snap install freecad

  echo -e "${b_green}[SUCESSO]${nc} Ferramentas de eletrônica instaladas!"
}

# Ferramentas de computação científica
install_comp_cientifica() {
  echo -e "${b_cyan}[INFO]${nc} Instalando ferramentas de computação científica..."

  # Computação científica
  sudo apt install -y octave gnuplot gnuplot-x11 -y

  echo -e "${b_green}[SUCESSO]${nc} Ferramentas de computação científica instaladas!"
}

# Ferramenta Ros de Robótica
install_robotics(){
  echo -e "${b_cyan}[INFO]${nc} Instalando ferramentas de robótica..."

  #passo 1
  locale  # check for UTF-8

  sudo apt update && sudo apt install locales
  sudo locale-gen en_US en_US.UTF-8
  sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
  export LANG=en_US.UTF-8

  locale  # verify settings

  #passo 2
  sudo apt install software-properties-common
  sudo add-apt-repository universe

  #passo 3
  sudo apt update && sudo apt install curl -y
  export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F'"' '{print $4}')
  curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})_all.deb"
  sudo dpkg -i /tmp/ros2-apt-source.deb

  #passo 4
  #tem um warning por causa da versao ubuntu 24, mas vê no site depois

  #passo 5
  sudo apt update && sudo apt install -y ros-dev-tools
  #passo 6: ros2
  sudo apt install -y ros-jazzy-desktop

  echo -e "${b_green}[SUCESSO]${nc} Ferramentas de robótica instaladas!"

}

# Ferramentas de fpga
install_fpga() {
  echo -e "${b_cyan}[INFO]${nc} Instalando ferramentas de circuitos digitais..."
  
  sudo apt update
  sudo apt install -y binutils
  sudo apt install -y verilator gtkwave

  echo -e "${b_green}[SUCESSO]${nc} Ferramentas de circuitos digitais instaladas!"
}

# ==================================

GithubCLI_pre_install() {
  # GitHub CLI
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
  sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null 
  sysupdate 
  sudo apt install gh -y
}

