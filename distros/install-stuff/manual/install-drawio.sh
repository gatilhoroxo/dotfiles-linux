echo -e "${b_cyan}[INFO]${nc} Instalando Draw.io manualmente..."

INSTALL_DIR="$HOME/files/tools"
ALIAS_FILE="$INSTALL_DIR/alias-tools.sh"

cd "$INSTALL_DIR"
rm -rf drawio-dir
mkdir -p drawio-dir
cd drawio-dir

echo "Baixando Draw.io..."
# Versão 29.0.3
wget -c "https://github.com/jgraph/drawio-desktop/releases/download/v29.0.3/drawio-x86_64-29.0.3.AppImage" -O drawio.AppImage || return 1
chmod +x drawio.AppImage

echo "Extraindo..."
./drawio.AppImage --appimage-extract > /dev/null
mv squashfs-root drawio-files
rm drawio.AppImage

if ! grep -q "alias drawio=" "$ALIAS_FILE"; then
  echo "alias drawio=\"$INSTALL_DIR/drawio-dir/drawio-files/drawio --no-sandbox > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
fi
echo -e "${b_green}[SUCESSO]${nc} Draw.io instalado manualmente!"
