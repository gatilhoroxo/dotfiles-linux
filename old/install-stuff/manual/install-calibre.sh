echo -e "${b_cyan}[INFO]${nc} Instalando Calibre manualmente..."

INSTALL_DIR="$HOME/files/tools"
ALIAS_FILE="$INSTALL_DIR/alias-tools.sh"

cd "$INSTALL_DIR"
rm -rf calibre-dir
mkdir -p calibre-dir
cd calibre-dir

echo "Baixando Calibre..."
# Link da versão estável mais recente
wget -c "https://download.calibre-ebook.com/linux64-installer.sh" -O calibre-installer.sh || return 1
chmod +x calibre-installer.sh
# wget -c "https://download.calibre-ebook.com/6.29.0/calibre-6.29.0-x86_64.txz" -O calibre.txz || return 1
# tar -xvf calibre.txz > /dev/null
# rm calibre.txz

echo "Instalando..."
./calibre-installer.sh --destdir "$INSTALL_DIR/calibre-dir" > /dev/null

if ! grep -q "alias calibre=" "$ALIAS_FILE"; then
    echo "alias calibre=\"$INSTALL_DIR/calibre-dir/calibre > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
    # O executável fica direto dentro da pasta extraída
    #  echo "alias calibre=\"$INSTALL_DIR/calibre-dir/calibre\"" >> "$ALIAS_FILE"
fi

echo -e "${b_green}[SUCESSO]${nc} Calibre instalado manualmente!"
