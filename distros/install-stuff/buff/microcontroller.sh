# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Extração manual de alguns aplicativos de microcontroladores (binários)
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

install_arduino_manual() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Arduino IDE manualmente..."
  
  cd "$INSTALL_DIR"
  rm -rf arduino-dir
  mkdir -p arduino-dir
  cd arduino-dir

  echo "Baixando Arduino IDE..."
  # Link da versão 1.8.19 (Estável)
  wget -c "https://downloads.arduino.cc/arduino-1.8.19-linux64.tar.xz" -O arduino.tar.xz || return 1
  
  echo "Extraindo..."
  tar -xf arduino.tar.xz > /dev/null
  rm arduino.tar.xz

  #wget -c "https://downloads.arduino.cc/arduino-ide/arduino-ide_2.3.2_Linux_64bit.AppImage" -O arduino.AppImage || return 1
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

