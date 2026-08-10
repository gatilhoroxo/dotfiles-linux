# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Intalação de alguns navegadores
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Navegador: Google Chrome
install_browser() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Google Chrome..."
  
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb || return 1
  sudo apt install ./google-chrome*.deb -y
  rm google-chrome*.deb
  
  echo -e "${b_green}[SUCESSO]${nc} Google Chrome instalado!"
}