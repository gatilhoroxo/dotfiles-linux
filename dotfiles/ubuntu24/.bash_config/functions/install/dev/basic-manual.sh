
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Extração manual de alguns aplicativos (binários)
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

install_github_cli() {
  echo -e "${b_cyan}[INFO]${nc} Instalando GitHub CLI..."
  
  cd "$INSTALL_DIR"
  rm -rf gh-dir
  mkdir -p gh-dir
  cd gh-dir
  
  echo "Baixando GitHub CLI v2.63.0..."
  # Link oficial do binário para Linux x64
  wget -c "https://github.com/cli/cli/releases/download/v2.63.0/gh_2.63.0_linux_amd64.tar.gz" -O gh.tar.gz || return 1
  
  echo "Extraindo..."
  tar -xvf gh.tar.gz > /dev/null
  rm gh.tar.gz
  
  # O tar extrai uma pasta com nome longo, vamos achar o binário independente do nome
  GH_BIN_PATH=$(find . -name "gh" -type f | head -n 1)
  
  if ! grep -q "alias gh=" "$ALIAS_FILE"; then
    # O comando é simples, não precisa de flags de GPU
    echo "alias gh=\"$INSTALL_DIR/gh-dir/$GH_BIN_PATH\"" >> "$ALIAS_FILE"
  fi
  echo -e "${b_green}[SUCESSO]${nc} GitHub CLI instalado manualmente!"
}

install_vscode_portable() {
  echo -e "${b_cyan}[INFO]${nc} Instalando VS Code (Portable)..."
  
  cd "$INSTALL_DIR"
  rm -rf vscode-portable-dir
  mkdir -p vscode-portable-dir
  cd vscode-portable-dir

  echo "Baixando VS Code Portable..."
  # Link da versão estável mais recente
  wget -c "https://update.code.visualstudio.com/latest/linux-x64-zip/stable" -O vscode.zip || return 1
  
  #wget -c "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64" -O vscode.tar.gz || return 1
  
  #echo "Extraindo..."
  #tar -xvf vscode.tar.gz > /dev/null
  #rm vscode.tar.gz
  
  # A pasta extraída geralmente se chama "VSCode-linux-x64"
  #mv VSCode-linux-x64 vscode-bin

  echo "Extraindo..."
  unzip vscode.zip > /dev/null
  rm vscode.zip
  
  if ! grep -q "alias codes=" "$ALIAS_FILE"; then
      echo "alias codes=\"$INSTALL_DIR/vscode-portable/code --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
  fi

  echo -e "${b_green}[SUCESSO]${nc} VS Code (Portable) instalado manualmente!"
}

install_miniconda3_manual() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Miniconda3 manualmente..."
  
  cd "$INSTALL_DIR"
  rm -rf miniconda3-dir
  mkdir -p miniconda3-dir
  cd miniconda3-dir

  echo "Baixando Miniconda3..."
  # Link da versão mais recente (Python 3.x)
  wget -c "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" -O miniconda3.sh || return 1
  
  echo "Instalando..."
  bash miniconda3.sh -b -p "$INSTALL_DIR/miniconda3-dir/miniconda3"
  rm miniconda3.sh
  
  if ! grep -q "alias conda=" "$ALIAS_FILE"; then
      echo "alias conda=\"$INSTALL_DIR/miniconda3-dir/miniconda3/bin/conda\"" >> "$ALIAS_FILE"
  fi

  echo -e "${b_green}[SUCESSO]${nc} Miniconda3 instalado manualmente!"
}

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

install_dbeaver_manual() {
  echo -e "${b_cyan}[INFO]${nc} Instalando DBeaver Community manualmente..."
  
  cd "$INSTALL_DIR"
  rm -rf dbeaver-dir
  mkdir -p dbeaver-dir
  cd dbeaver-dir

  echo "Baixando DBeaver..."
  # Versão CE 24.0.0 (Linux tar.gz)
  wget -c "https://dbeaver.io/files/24.0.0/dbeaver-ce-24.0.0-linux.gtk.x86_64.tar.gz" -O dbeaver.tar.gz || return 1

  echo "Extraindo..."
  tar -xvf dbeaver.tar.gz > /dev/null
  rm dbeaver.tar.gz
  # A pasta extraída chama-se 'dbeaver'
  mv dbeaver dbeaver-bin

  if ! grep -q "alias dbeaver=" "$ALIAS_FILE"; then
      echo "alias dbeaver=\"$INSTALL_DIR/dbeaver-dir/dbeaver-bin/dbeaver > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
  fi

  echo -e "${b_green}[SUCESSO]${nc} DBeaver Community instalado manualmente!"
}

install_postman_manual() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Postman manualmente..."
  
  cd "$INSTALL_DIR"
  rm -rf postman-dir
  mkdir -p postman-dir
  cd postman-dir

  echo "Baixando Postman..."
  # Link direto oficial (sempre latest, mas costuma ser estável em estrutura)
  wget -c "https://dl.pstmn.io/download/latest/linux64" -O postman.tar.gz || return 1

  echo "Extraindo..."
  tar -xvf postman.tar.gz > /dev/null
  rm postman.tar.gz
  # A pasta extraída chama-se 'Postman'
  mv Postman postman-bin

  if ! grep -q "alias postman=" "$ALIAS_FILE"; then
    # Postman também é Electron
    echo "alias postman=\"$INSTALL_DIR/postman-dir/postman-bin/Postman --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
  fi

  echo -e "${b_green}[SUCESSO]${nc} Postman instalado manualmente!"
}


