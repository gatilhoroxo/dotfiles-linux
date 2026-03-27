# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Extração manual de alguns navegadores (binários)
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

#export INSTALL_DIR="$HOME/files/tools"
#export ALIAS_FILE="$INSTALL_DIR/tools.bash"

install_vivaldi_portable() {
  echo -e "${b_cyan}[INFO]${nc} Instalando Vivaldi (Portable)..."
  
  cd "$HOME/files/tools"
  rm -rf vivaldi-dir
  mkcd vivaldi-dir

  echo "Baixando Vivaldi Portable..."
  # Link da versão estável mais recente
  wget -c "https://downloads.vivaldi.com/stable/vivaldi-stable_7.9.3970.45-1_amd64.deb" -O vivaldi.deb || return 1
  
  echo "Extraindo..."
  ar p vivaldi.deb data.tar.xz | tar xJ --strip 2 ./opt/vivaldi
  rm vivaldi.deb
  
  if ! grep -q "alias vivaldi=" "$ALIAS_FILE"; then
      echo "alias vivaldi='$HOME/files/tools/vivaldi-dir/vivaldi/vivaldi --no-sandbox --user-data-dir=$HOME/files/tools/vivaldi-dir/perfil --disable-gpu > /dev/null 2>&1 &'" >> "$ALIAS_FILE"
  fi

  echo -e "${b_green}[SUCESSO]${nc} Vivaldi (Portable) instalado manualmente!"
}
