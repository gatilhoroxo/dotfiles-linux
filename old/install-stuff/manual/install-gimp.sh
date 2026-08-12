echo -e "${b_cyan}[INFO]${nc} Instalando GIMP manualmente..."

INSTALL_DIR="$HOME/files/tools"
ALIAS_FILE="$INSTALL_DIR/alias-tools.sh"

cd "$INSTALL_DIR"
rm -rf gimp-dir
mkdir -p gimp-dir
cd gimp-dir

echo "Baixando GIMP..."
# Link da versão 2.10.34 (Estável)
wget -c "https://github.com/aferrero2707/gimp-appimage/releases/download/continuous/GIMP_AppImage-git-2.10.21-20201001-x86_64.AppImage" -O gimp.AppImage || return 1
chmod +x gimp.AppImage

echo "Extraindo..."
./gimp.AppImage --appimage-extract > /dev/null
mv squashfs-root gimp-files

if ! grep -q "alias gimp=" "$ALIAS_FILE"; then
echo "alias gimp=\"$INSTALL_DIR/gimp-dir/gimp-files/AppRun > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
fi

echo -e "${b_green}[SUCESSO]${nc} GIMP instalado manualmente!"
