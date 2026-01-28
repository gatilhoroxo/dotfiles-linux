# ==============================================================================
# FUNÇÕES DE INSTALAÇÃO - Ferramentas de produtividade
# ==============================================================================

install_productivity_tools() {
  echo -e "${b_cyan}[INFO]${nc} Instalando ferramentas de produtividade..."
  
  sudo snap install bitwarden -y && sudo snap connect bitwarden:password-manager-service
  sudo apt install flatpak -y
  sudo snap install obsidian --classic
  sudo snap install todoist
  
  echo -e "${b_green}[SUCESSO]${nc} Ferramentas de produtividade instaladas!"
}

# Ferramentas LaTeX: TeXLive, TeXStudio, xclip
install_latex_tools() {
  echo -e "${b_cyan}[INFO]${nc} Instalando ferramentas LaTeX..."
  
  sudo apt install texlive-base texstudio -y
  sudo apt install xclip -y
  
  echo -e "${b_green}[SUCESSO]${nc} LaTeX instalado!"
}

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Extração manual de alguns aplicativos (AppImage)
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

install_obsidian_manual() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Obsidian manualmente..."
  
  cd "$INSTALL_DIR"
  rm -rf obsidian-dir
  mkdir -p obsidian-dir
  cd obsidian-dir

  echo "Baixando Obsidian..."
  # Link da versão 1.6.7 (Estável)
  wget -c "https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.7/Obsidian-1.6.7.AppImage" -O obsidian.AppImage
  chmod +x obsidian.AppImage 

  echo "Extraindo..."
  ./obsidian.AppImage --appimage-extract > /dev/null
  mv squashfs-root obsidian-files
  rm obsidian.AppImage
  
  if ! grep -q "alias obsidian=" "$ALIAS_FILE"; then
      # É Electron, precisa das flags de segurança
      echo "alias obsidian=\"$INSTALL_DIR/obsidian-dir/obsidian-files/obsidian --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
  fi

  echo -e "${b_green}[SUCESSO]${nc} Obsidian instalado manualmente!"
}

install_todoist_manual() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Todoist manualmente..."
  
  cd "$INSTALL_DIR"
  rm -rf todoist-dir
  mkdir -p todoist-dir
  cd todoist-dir

  echo "Baixando Todoist..."
  # Link da versão 2.6.3 (Estável)
  wget -c "https://github.com/todoist/todoist-linux/releases/download/v2.6.3/Todoist-2.6.3.AppImage" -O todoist.AppImage
  chmod +x todoist.AppImage 
  
  echo "Extraindo..."
  ./todoist.AppImage --appimage-extract > /dev/null
  mv squashfs-root todoist-files
  rm todoist.AppImage
  
  if ! grep -q "alias todoist=" "$ALIAS_FILE"; then
    echo "alias todoist=\"$INSTALL_DIR/todoist-dir/todoist-files/todoist --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
  fi
  
  echo -e "${b_green}[SUCESSO]${nc} Todoist instalado manualmente!"
}

install_bitwarden_manual() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Bitwarden manualmente..."
  
  cd "$INSTALL_DIR"
  rm -rf bitwarden-dir
  mkdir -p bitwarden-dir
  cd bitwarden-dir

  echo "Baixando Bitwarden..."
  # Link da versão 1.29.1 (Estável)
  wget -c "https://github.com/bitwarden/desktop/releases/download/v1.29.1/Bitwarden-1.29.1.AppImage" -O bitwarden.AppImage
  chmod +x bitwarden.AppImage 
  
  echo "Extraindo..."
  ./bitwarden.AppImage --appimage-extract > /dev/null
  mv squashfs-root bitwarden-files
  rm bitwarden.AppImage
  
  if ! grep -q "alias bitwarden=" "$ALIAS_FILE"; then
      echo "alias bitwarden=\"$INSTALL_DIR/bitwarden-dir/bitwarden-files/Bitwarden --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
  fi
  
  echo -e "${b_green}[SUCESSO]${nc} Bitwarden instalado manualmente!"
}
    
