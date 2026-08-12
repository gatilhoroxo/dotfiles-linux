
echo -e "${b_cyan}[INFO]${nc} Instalando Fritzing manualmente..."

INSTALL_DIR="$HOME/files/tools"
ALIAS_FILE="$INSTALL_DIR/alias-tools.sh"

cd "$INSTALL_DIR"
rm -rf fritzing-dir
mkdir -p fritzing-dir
cd fritzing-dir

echo "Baixando Fritzing..."
# Link da versão 0.9.6b (Estável)
wget -c "https://fritzing.org/download/0.9.6b/fritzing-0.9.6b.linux.AMD64.tar.bz2" -O fritzing.tar.bz2 || return 1

echo "Extraindo..."
tar -xvf fritzing.tar.bz2 > /dev/null
rm fritzing.tar.bz2

if ! grep -q "alias fritzing=" "$ALIAS_FILE"; then
    echo "alias fritzing=\"$INSTALL_DIR/fritzing-dir/fritzing --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
fi

echo -e "${b_green}[SUCESSO]${nc} Fritzing instalado manualmente!"
