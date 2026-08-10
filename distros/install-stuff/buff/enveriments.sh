# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Extração manual de alguns ambientes (binários)
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

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
