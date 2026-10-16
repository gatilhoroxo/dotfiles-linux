echo -e "${b_cyan}[INFO]${nc} Instalando Obsidian manualmente..."

INSTALL_DIR="$HOME/files/tools"
ALIAS_FILE="$INSTALL_DIR/alias-tools.sh"

cd "$INSTALL_DIR"
rm -rf obsidian-dir
mkdir -p obsidian-dir
cd obsidian-dir

echo "Baixando Obsidian..."
# Link da versão 1.6.7 (Estável)
wget -c "https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.7/Obsidian-1.6.7.AppImage" -O obsidian.AppImage || return 1
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
