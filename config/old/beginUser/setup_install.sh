
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
# Compiladores e ferramentas básicas de desenvolvimento
# Linguagens de programação: Python, Java, Rust
# Ferramentas de desenvolvimento: Git, GitHub CLI, Qt
# Ferramentas de eletrônica: KiCad, Arduino, PlatformIO, Octave
# Ferramentas de containerização: Docker
# Ferramentas LaTeX: TeXLive, TeXStudio, xclip
# Navegador: Google Chrome

