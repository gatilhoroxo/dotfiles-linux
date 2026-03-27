# ================================================================
# Funções de instalação de softwares de eletrônica
# ================================================================

# Ferramentas de eletrônica: KiCad, Arduino, PlatformIO, Octave
install_electronics() {
  echo -e "${b_cyan}[INFO]${nc} Instalando ferramentas de eletrônica..."
  
  # Shell/Terminal melhorado
  sudo apt install zsh -y 
  
  # Design de PCB
  sudo add-apt-repository --yes ppa:kicad/kicad-9.0-releases && sudo apt update
  sudo apt install --install-recommends kicad
  
  # Computação científica
  sudo apt install octave gnuplot gnuplot-x11 -y
  
  # Plataformas de desenvolvimento embarcado
  sudo snap install arduino 
  sudo apt install platformio -y
  
  echo -e "${b_green}[SUCESSO]${nc} Ferramentas de eletrônica instaladas!"
}
