# ================================================================
# Funções de instalação de softwares de eletrônica
# ================================================================

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Extração manual de alguns aplicativos (binários)
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

install_arduino_manual() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Arduino IDE manualmente..."
  
  cd "$INSTALL_DIR"
  rm -rf arduino-dir
  mkdir -p arduino-dir
  cd arduino-dir

  echo "Baixando Arduino IDE..."
  # Link da versão 1.8.19 (Estável)
  wget -c "https://downloads.arduino.cc/arduino-1.8.19-linux64.tar.xz" -O arduino.tar.xz
  
  echo "Extraindo..."
  extract -xf arduino.tar.xz > /dev/null
  rm arduino.tar.xz

  #wget -c "https://downloads.arduino.cc/arduino-ide/arduino-ide_2.3.2_Linux_64bit.AppImage" -O arduino.AppImage
  # chmod +x arduino.AppImage
  # echo "Extraindo..."
  # ./arduino.AppImage --appimage-extract > /dev/null
  # mv squashfs-root arduino-files
  # rm arduino.AppImage
  #
  
  if ! grep -q "alias arduino=" "$ALIAS_FILE"; then
      echo "alias arduino=\"$INSTALL_DIR/arduino-dir/arduino-1.8.19/arduino --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
  fi

  echo -e "${b_green}[SUCESSO]${nc} Arduino IDE instalado manualmente!"
}

install_logisim_evolution() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Logisim Evolution..."
  
  cd "$INSTALL_DIR"
  rm -rf logisim-evolution-dir
  mkdir -p logisim-evolution-dir
  cd logisim-evolution-dir
  
  echo "Baixando Logisim Evolution..."
  wget https://github.com/logisim-evolution/logisim-evolution/releases/download/v4.0.0/logisim-evolution-4.0.0-all.jar -O logisim.jar
  
  if ! grep -q "alias logisim=" "$ALIAS_FILE"; then
    echo "alias logisim=\"java -jar ~/$INSTALL_DIR/logisim-dir/logisim.jar > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
  fi

  echo -e "${b_green}[SUCESSO]${nc} Logisim Evolution instalado manualmente!"
}

install_kicad_manual() {
  # Nota: KiCad é complexo. Considere usar um AppImage não-oficial (SSB) pois o oficial exige root.
  echo -e "${b_cyan}[INFO]${nc} Instalando KiCad manualmente..."
  
  cd "$INSTALL_DIR"
  rm -rf kicad-dir
  mkdir -p kicad-dir
  cd kicad-dir

  echo "Baixando KiCad..."
  # Link da versão 7.0.6 (Estável)
  wget -c "https://kicad.org/download/linux/kicad-7.0.6-x86_64.tar.bz2" -O kicad.tar.bz2
  # link da versão 7 (a mais estável) em formato AppImage - não oficial
  # wget -c "https://github.com/KarlZeilhofer/kicad-appimage/releases/download/v5.1.4/KiCad-5.1.4.glibc2.27-x86_64.AppImage" -O kicad.AppImage
  # chmod +x kicad.AppImage
  # ./kicad.AppImage --appimage-extract > /dev/null
  # mv squashfs-root kicad-files
  # rm kicad.AppImage


  echo "Extraindo..."
  extract -xvf kicad.tar.bz2 > /dev/null
  rm kicad.tar.bz2
  
  if [ "$IS_ADMIN" = true ]; then
    find . -name "libpixman-1.so*" -delete
    find . -name "libcairo.so*" -delete
    find . -name "libstdc++.so.6" -delete

    find . -name "libglib-2.0.so*" -delete
    find . -name "libgmodule-2.0.so*" -delete
    find . -name "libgio-2.0.so*" -delete
    find . -name "libgobject-2.0.so*" -delete
    
    find . -name "libselinux.so*" -delete
  fi 

  if ! grep -q "alias kicad=" "$ALIAS_FILE"; then
    echo "alias kicad=\"$INSTALL_DIR/kicad-dir/kicad-7.0.6/bin/kicad --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
    # echo "alias kicad=\"$INSTALL_DIR/kicad-dir/kicad-files/AppRun > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
  fi

  echo -e "${b_green}[SUCESSO]${nc} KiCad instalado manualmente!"
}

install_simulide_manual() {
  echo -e "${b_cyan}[INFO]${nc} Instalando SimulIDE manualmente..."
  
  cd "$INSTALL_DIR"
  rm -rf simulide-dir
  mkdir -p simulide-dir
  cd simulide-dir

  echo "Baixando SimulIDE..."
  # Link da versão 1.1.0 (AppImage)
  wget -c "https://osdn.net/dl/simulide/SimulIDE_1.1.0-R1973_Linux64.AppImage" -O simulide.AppImage || echo "Download automático falhou. Se o arquivo não existir, coloque-o manualmente nesta pasta."
  
  # Verifica se o arquivo existe (seja pelo download ou colocado manualmente)
  if [ -f "simulide.AppImage" ]; then
    echo "Arquivo encontrado. Iniciando extração (Bypass FUSE)..."
    
    chmod +x simulide.AppImage
    
    # Extrai o conteúdo (Isso resolve o erro 'AppImages require FUSE')
    ./simulide.AppImage --appimage-extract > "$BLACK_WHOLE"
    
    # Renomeia a pasta extraída para algo padrão
    rm -rf simulide-files
    mv squashfs-root simulide-files
    
    # Remove o arquivo compactado para economizar espaço
    rm simulide.AppImage

    # Cria o Alias apontando para o AppRun dentro da pasta extraída
    if ! grep -q "alias simulide=" "$ALIAS_FILE"; then
      echo "alias simulide=\"$INSTALL_DIR/simulide-dir/simulide-files/AppRun > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
      echo -e "${GREEN}Alias do SimulIDE configurado com sucesso.${NC}"
    fi

  else
    echo -e "${YELLOW}ERRO: O arquivo 'simulide.AppImage' não foi encontrado.${NC}"
    echo "Por favor, baixe manualmente em https://simulide.com/p/downloads/"
    echo "Salve o arquivo na pasta: $INSTALL_DIR/simulide-dir/ com o nome 'simulide.AppImage' e rode o script novamente."
  fi

  echo -e "${b_green}[SUCESSO]${nc} SimulIDE instalado manualmente!"
}

install_fritzing_manual() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Fritzing manualmente..."
  
  cd "$INSTALL_DIR"
  rm -rf fritzing-dir
  mkdir -p fritzing-dir
  cd fritzing-dir

  echo "Baixando Fritzing..."
  # Link da versão 0.9.6b (Estável)
  wget -c "https://fritzing.org/download/0.9.6b/fritzing-0.9.6b.linux.AMD64.tar.bz2" -O fritzing.tar.bz2

  echo "Extraindo..."
  extract -xvf fritzing.tar.bz2 > /dev/null
  rm fritzing.tar.bz2

  if ! grep -q "alias fritzing=" "$ALIAS_FILE"; then
      echo "alias fritzing=\"$INSTALL_DIR/fritzing-dir/fritzing --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
  fi

  echo -e "${b_green}[SUCESSO]${nc} Fritzing instalado manualmente!"
}

install_circuitblocks_manual() {
  echo -e "${b_cyan}[INFO]${nc} Instalando CircuitBlocks manualmente..."
  
  if [ "$IS_ADMIN" = true ]; then
    cd "$INSTALL_DIR"
    rm -rf circuitblocks-dir
    mkdir -p circuitblocks-dir
    cd circuitblocks-dir

    echo "Baixando CircuitBlocks..."
    # Link da versão 1.10.1
    wget -c "https://github.com/CircuitMess/CircuitBlocks/releases/download/v1.10.0/CircuitBlocks-1.10.0-Linux.AppImage" -O cb.AppImage
    chmod +x cb.AppImage

    echo "Extraindo..."
    ./cb.AppImage --appimage-extract > /dev/null
    mv squashfs-root cb-files
    rm cb.AppImage

    if ! grep -q "alias circuitblocks=" "$ALIAS_FILE"; then
      # É Electron, precisa das flags de segurança
      echo "alias circuitblocks=\"$INSTALL_DIR/circuitblocks-dir/cb-files/circuitblocks --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
    fi
  else
    echo -e "${yellow}CircuitBlocks requer privilégios de administrador.${nc}"
  fi
  
  echo -e "${b_green}[SUCESSO]${nc} CircuitBlocks instalado manualmente!"
}
