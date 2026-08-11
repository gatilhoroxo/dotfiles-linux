
# Nota: KiCad é complexo. Considere usar um AppImage não-oficial (SSB) pois o oficial exige root.
echo -e "${b_cyan}[INFO]${nc} Instalando KiCad manualmente..."

INSTALL_DIR="$HOME/files/tools"
ALIAS_FILE="$INSTALL_DIR/alias-tools.sh"

cd "$INSTALL_DIR"
rm -rf kicad-dir
mkdir -p kicad-dir
cd kicad-dir

echo "Baixando KiCad..."
# Link da versão 7.0.6 (Estável)
wget -c "https://kicad.org/download/linux/kicad-7.0.6-x86_64.tar.bz2" -O kicad.tar.bz2 || return 1
# link da versão 7 (a mais estável) em formato AppImage - não oficial
# wget -c "https://github.com/KarlZeilhofer/kicad-appimage/releases/download/v5.1.4/KiCad-5.1.4.glibc2.27-x86_64.AppImage" -O kicad.AppImage || return 1
# chmod +x kicad.AppImage
# ./kicad.AppImage --appimage-extract > /dev/null
# mv squashfs-root kicad-files
# rm kicad.AppImage


echo "Extraindo..."
tar -xvf kicad.tar.bz2 > /dev/null
rm kicad.tar.bz2

if [ "$IS_ADMIN" = true ]; then
  find . -name "libpixman-1.so*" -delete
  find . -name "libcairo.so*" -delete
  find . -name "libstdc++.so.6" -delete

  find . -name "libglib-2.0.so*" -delete
  find . -name "libgmodule-2.0.so*" -delete
  find . -name "libgio-2.0.so*" -delete
  find . -name "libgobject-2.0.so*" -delete
  
  find . -name "libselinux.so*" -delete
fi 

if ! grep -q "alias kicad=" "$ALIAS_FILE"; then
  echo "alias kicad=\"$INSTALL_DIR/kicad-dir/kicad-7.0.6/bin/kicad --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
  # echo "alias kicad=\"$INSTALL_DIR/kicad-dir/kicad-files/AppRun > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
fi

echo -e "${b_green}[SUCESSO]${nc} KiCad instalado manualmente!"
