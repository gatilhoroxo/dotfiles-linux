
echo -e "${b_cyan}[INFO]${nc} Instalando GitLab CLI..."

INSTALL_DIR="$HOME/files/tools"
ALIAS_FILE="$INSTALL_DIR/alias-tools.sh"
cd "$INSTALL_DIR"
rm -rf glab-dir
mkdir -p glab-dir
cd glab-dir

echo "Baixando GitLab CLI v1.112.0..."
wget -c "https://gitlab.com/gitlab-org/cli/-/releases/v1.112.0/downloads/glab_1.112.0_linux_amd64.tar.gz" -O glab.tar.gz || return 1

echo "Extraindo..."
tar -xvf glab.tar.gz > /dev/null
rm glab.tar.gz

echo "alias glab='\$HOME/files/tools/glab-dir/bin/glab'" >> $ALIAS_FILE

echo -e "${b_green}[SUCESSO]${nc} GitLab CLI instalado manualmente!"
