
echo -e "${b_cyan}[INFO]${nc} Instalando Postman manualmente..."

INSTALL_DIR="$HOME/files/tools"
ALIAS_FILE="$INSTALL_DIR/alias-tools.sh"

cd "$INSTALL_DIR"
rm -rf postman-dir
mkdir -p postman-dir
cd postman-dir

echo "Baixando Postman..."
# Link direto oficial (sempre latest, mas costuma ser estável em estrutura)
wget -c "https://dl.pstmn.io/download/latest/linux64" -O postman.tar.gz || return 1

echo "Extraindo..."
tar -xvf postman.tar.gz > /dev/null
rm postman.tar.gz
# A pasta extraída chama-se 'Postman'
mv Postman postman-bin

if ! grep -q "alias postman=" "$ALIAS_FILE"; then
  # Postman também é Electron
  echo "alias postman=\"$INSTALL_DIR/postman-dir/postman-bin/Postman --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
fi

echo -e "${b_green}[SUCESSO]${nc} Postman instalado manualmente!"
