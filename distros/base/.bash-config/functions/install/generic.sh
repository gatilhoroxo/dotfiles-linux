# !/bin/bash
 
# ==============================================================================
# FUNÇÕES DE INSTALAÇÃO DE ...
# ==============================================================================

# Navegador: Google Chrome
install_browser() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Google Chrome..."
  
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb || return 1
  sudo apt install ./google-chrome*.deb -y
  rm google-chrome*.deb
  
  echo -e "${b_green}[SUCESSO]${nc} Google Chrome instalado!"
}


# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Extração manual de alguns aplicativos (binários)
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

install_calibre_manual() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Calibre manualmente..."
  
  cd "$INSTALL_DIR"
  rm -rf calibre-dir
  mkdir -p calibre-dir
  cd calibre-dir

  echo "Baixando Calibre..."
  # Link da versão estável mais recente
  wget -c "https://download.calibre-ebook.com/linux64-installer.sh" -O calibre-installer.sh || return 1
  chmod +x calibre-installer.sh
  # wget -c "https://download.calibre-ebook.com/6.29.0/calibre-6.29.0-x86_64.txz" -O calibre.txz || return 1
  # tar -xvf calibre.txz > /dev/null
  # rm calibre.txz

  echo "Instalando..."
  ./calibre-installer.sh --destdir "$INSTALL_DIR/calibre-dir" > /dev/null
  
  if ! grep -q "alias calibre=" "$ALIAS_FILE"; then
      echo "alias calibre=\"$INSTALL_DIR/calibre-dir/calibre > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
      # O executável fica direto dentro da pasta extraída
      #  echo "alias calibre=\"$INSTALL_DIR/calibre-dir/calibre\"" >> "$ALIAS_FILE"
  fi

  echo -e "${b_green}[SUCESSO]${nc} Calibre instalado manualmente!"
}

install_gimp_manual() {
  echo -e "${b_cyan}[INFO]${nc} Instalando GIMP manualmente..."
  
  cd "$INSTALL_DIR"
  rm -rf gimp-dir
  mkdir -p gimp-dir
  cd gimp-dir

  echo "Baixando GIMP..."
  # Link da versão 2.10.34 (Estável)
  wget -c "https://github.com/aferrero2707/gimp-appimage/releases/download/continuous/GIMP_AppImage-git-2.10.21-20201001-x86_64.AppImage" -O gimp.AppImage || return 1
  chmod +x gimp.AppImage

  echo "Extraindo..."
  ./gimp.AppImage --appimage-extract > /dev/null
  mv squashfs-root gimp-files

  if ! grep -q "alias gimp=" "$ALIAS_FILE"; then
    echo "alias gimp=\"$INSTALL_DIR/gimp-dir/gimp-files/AppRun > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
  fi

  echo -e "${b_green}[SUCESSO]${nc} GIMP instalado manualmente!"
}

install_drawio_manual() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Draw.io manualmente..."
  
  cd "$INSTALL_DIR"
  rm -rf drawio-dir
  mkdir -p drawio-dir
  cd drawio-dir

  echo "Baixando Draw.io..."
  # Versão 29.0.3
  wget -c "https://github.com/jgraph/drawio-desktop/releases/download/v29.0.3/drawio-x86_64-29.0.3.AppImage" -O drawio.AppImage || return 1
  chmod +x drawio.AppImage
  
  echo "Extraindo..."
  ./drawio.AppImage --appimage-extract > /dev/null
  mv squashfs-root drawio-files
  rm drawio.AppImage
  
  if ! grep -q "alias drawio=" "$ALIAS_FILE"; then
    echo "alias drawio=\"$INSTALL_DIR/drawio-dir/drawio-files/drawio --no-sandbox > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
  fi
  echo -e "${b_green}[SUCESSO]${nc} Draw.io instalado manualmente!"
}




