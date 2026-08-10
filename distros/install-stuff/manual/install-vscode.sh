
echo -e "${b_cyan}[INFO]${nc} Instalando VS Code (Portable)..."

INSTALL_DIR="$HOME/files/tools"
ALIAS_FILE="$INSTALL_DIR/alias-tools.sh"

cd "$INSTALL_DIR"
rm -rf vscode-portable-dir
mkdir -p vscode-portable-dir
cd vscode-portable-dir

echo "Baixando VS Code Portable..."
# Link da versão estável mais recente
wget -c "https://update.code.visualstudio.com/latest/linux-x64-zip/stable" -O vscode.zip || return 1

#wget -c "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64" -O vscode.tar.gz || return 1

#echo "Extraindo..."
#tar -xvf vscode.tar.gz > /dev/null
#rm vscode.tar.gz

# A pasta extraída geralmente se chama "VSCode-linux-x64"
#mv VSCode-linux-x64 vscode-bin

echo "Extraindo..."
unzip vscode.zip > /dev/null
rm vscode.zip

if ! grep -q "alias codes=" "$ALIAS_FILE"; then
    echo "alias codes=\"$INSTALL_DIR/vscode-portable/code --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
fi

echo -e "${b_green}[SUCESSO]${nc} VS Code (Portable) instalado manualmente!"

