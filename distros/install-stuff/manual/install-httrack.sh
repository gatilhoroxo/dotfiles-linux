echo -e "${b_cyan}[INFO]${nc} Instalando HTTrack manualmente..."

INSTALL_DIR="$HOME/files/tools"
ALIAS_FILE="$INSTALL_DIR/alias-tools.sh"

cd "$INSTALL_DIR"

echo "Baixando HTTrack..."
wget https://download.httrack.com/cserv.php3?File=httrack-3.49.2.tar.gz -O httrack.tar.gz || return 1
tar -xzf httrack.tar.gz 
mv httrack-3.49.2 httrack-dir
cd httrack-dir

./configure --prefix=$HOME/.local
make
make install

# Adicione o diretório ao PATH (se necessário)
export PATH="$HOME/.local/bin:$PATH"
echo -e "${b_green}[SUCESSO]${nc} HTTrack instalado manualmente!"
