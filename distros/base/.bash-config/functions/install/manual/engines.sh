# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Extração manual de algumas engines (binários)
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

install_godot_engine_manual() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Godot Engine manualmente..."
  
  cd "$INSTALL_DIR"
  rm -rf godot-dir
  mkdir -p godot-dir
  cd godot-dir
  
  echo "Baixando Godot Engine..."
  # Link da versão 3.5.1 (Estável)
  wget -c "https://downloads.tuxfamily.org/godotengine/3.5.1/mono/Godot_v3.5.1-stable_mono_x11_64.zip" -O godot.zip || return 1
  # link da versão 4.3 (Stable)
  # wget -c "https://github.com/godotengine/godot/releases/download/4.3-stable/Godot_v4.3-stable_linux.x86_64.zip" -O godot.zip || return 1

  echo "Extraindo..."
  unzip godot.zip > /dev/null
  rm godot.zip
  mv Godot_v3.5.1-stable_mono_x11_64 godot4_
  
  if ! grep -q "alias godot=" "$ALIAS_FILE"; then
      echo "alias godot=\"$INSTALL_DIR/godot-dir/godot4_ --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
  fi
  
  echo -e "${b_green}[SUCESSO]${nc} Godot Engine instalado manualmente!"
}

