
echo -e "${b_cyan}[INFO]${nc} Instalando Logisim Evolution..."

INSTALL_DIR="$HOME/files/tools"
ALIAS_FILE="$INSTALL_DIR/alias-tools.sh"

cd "$INSTALL_DIR"
rm -rf logisim-evolution-dir
mkdir -p logisim-evolution-dir
cd logisim-evolution-dir

echo "Baixando Logisim Evolution..."
wget https://github.com/logisim-evolution/logisim-evolution/releases/download/v4.0.0/logisim-evolution-4.0.0-all.jar -O logisim.jar || return 1

if ! grep -q "alias logisim=" "$ALIAS_FILE"; then
  echo "alias logisim=\"java -jar ~/$INSTALL_DIR/logisim-dir/logisim.jar > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
fi

echo -e "${b_green}[SUCESSO]${nc} Logisim Evolution instalado manualmente!"
