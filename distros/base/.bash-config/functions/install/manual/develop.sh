# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Extração manual de alguns aplicativos úteis para desenvolvimento (binários)
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

#export INSTALL_DIR="$HOME/files/tools"
#export ALIAS_FILE="$INSTALL_DIR/tools.bash"

install_github_cli() {
  echo -e "${b_cyan}[INFO]${nc} Instalando GitHub CLI..."
  
  cd "$HOME/files/tools"
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
    echo "alias gh=\"$HOME/files/tools/gh-dir/$GH_BIN_PATH\"" >> "$ALIAS_FILE"
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
