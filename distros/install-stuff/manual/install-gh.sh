
echo -e "${b_cyan}[INFO]${nc} Instalando GitHub CLI..."

INSTALL_DIR="$HOME/files/tools"
ALIAS_FILE="$INSTALL_DIR/alias-tools.sh"

cd "$INSTALL_DIR"
rm -rf gh-dir
mkdir -p gh-dir
cd gh-dir

echo "Baixando GitHub CLI v2.63.0..."
# Link oficial do binário para Linux x64
wget -c "https://github.com/cli/cli/releases/download/v2.63.0/gh_2.63.0_linux_amd64.tar.gz" -O gh.tar.gz || return 1

echo "Extraindo..."
tar -xvf gh.tar.gz > /dev/null
rm gh.tar.gz

# O tar extrai uma pasta com nome longo, vamos achar o binário independente do nome
GH_BIN_PATH=$(find . -name "gh" -type f | head -n 1)

if ! grep -q "alias gh=" "$ALIAS_FILE"; then
# O comando é simples, não precisa de flags de GPU
echo "alias gh=\"$HOME/files/tools/gh-dir/$GH_BIN_PATH\"" >> "$ALIAS_FILE"
fi
echo -e "${b_green}[SUCESSO]${nc} GitHub CLI instalado manualmente!"
