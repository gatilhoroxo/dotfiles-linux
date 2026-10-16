echo -e "${b_cyan}[INFO]${nc} Instalando Bitwarden manualmente..."

INSTALL_DIR="$HOME/files/tools"
ALIAS_FILE="$INSTALL_DIR/alias-tools.sh"

cd "$INSTALL_DIR"
rm -rf bitwarden-dir
mkdir -p bitwarden-dir
cd bitwarden-dir

echo "Baixando Bitwarden..."
# Link da versão 1.29.1 (Estável)
wget -c "https://github.com/bitwarden/desktop/releases/download/v1.29.1/Bitwarden-1.29.1.AppImage" -O bitwarden.AppImage || return 1
chmod +x bitwarden.AppImage 

echo "Extraindo..."
./bitwarden.AppImage --appimage-extract > /dev/null
mv squashfs-root bitwarden-files
rm bitwarden.AppImage

if ! grep -q "alias bitwarden=" "$ALIAS_FILE"; then
    echo "alias bitwarden=\"$INSTALL_DIR/bitwarden-dir/bitwarden-files/Bitwarden --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
fi

echo -e "${b_green}[SUCESSO]${nc} Bitwarden instalado manualmente!"
