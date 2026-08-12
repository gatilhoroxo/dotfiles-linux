echo -e "${b_cyan}[INFO]${nc} Instalando Todoist manualmente..."

INSTALL_DIR="$HOME/files/tools"
ALIAS_FILE="$INSTALL_DIR/alias-tools.sh"

cd "$INSTALL_DIR"
rm -rf todoist-dir
mkdir -p todoist-dir
cd todoist-dir

echo "Baixando Todoist..."
# Link da versão 2.6.3 (Estável)
wget -c "https://github.com/todoist/todoist-linux/releases/download/v2.6.3/Todoist-2.6.3.AppImage" -O todoist.AppImage || return 1
chmod +x todoist.AppImage 

echo "Extraindo..."
./todoist.AppImage --appimage-extract > /dev/null
mv squashfs-root todoist-files
rm todoist.AppImage

if ! grep -q "alias todoist=" "$ALIAS_FILE"; then
  echo "alias todoist=\"$INSTALL_DIR/todoist-dir/todoist-files/todoist --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
fi

echo -e "${b_green}[SUCESSO]${nc} Todoist instalado manualmente!"
