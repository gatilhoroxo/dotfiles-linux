echo -e "${b_cyan}[INFO]${nc} Instalando CircuitBlocks manualmente..."

INSTALL_DIR="$HOME/files/tools"
ALIAS_FILE="$INSTALL_DIR/alias-tools.sh"

if [ "$IS_ADMIN" = true ]; then
  cd "$INSTALL_DIR"
  rm -rf circuitblocks-dir
  mkdir -p circuitblocks-dir
  cd circuitblocks-dir

  echo "Baixando CircuitBlocks..."
  # Link da versão 1.10.1
  wget -c "https://github.com/CircuitMess/CircuitBlocks/releases/download/v1.10.0/CircuitBlocks-1.10.0-Linux.AppImage" -O cb.AppImage || return 1
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
