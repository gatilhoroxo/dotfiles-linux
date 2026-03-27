# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Extração manual de alguns aplicativos de banco de dados (binários)
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

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


