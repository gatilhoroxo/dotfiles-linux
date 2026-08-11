echo -e "${b_cyan}[INFO]${nc} Instalando SimulIDE manualmente..."

INSTALL_DIR="$HOME/files/tools"
ALIAS_FILE="$INSTALL_DIR/alias-tools.sh"

cd "$INSTALL_DIR"
rm -rf simulide-dir
mkdir -p simulide-dir
cd simulide-dir

echo "Baixando SimulIDE..."
# Link da versão 1.1.0 (AppImage)
wget -c "https://osdn.net/dl/simulide/SimulIDE_1.1.0-R1973_Linux64.AppImage" -O simulide.AppImage || echo "Download automático falhou. Se o arquivo não existir, coloque-o manualmente nesta pasta." && return 1 

# Verifica se o arquivo existe (seja pelo download ou colocado manualmente)
if [ -f "simulide.AppImage" ]; then
  echo "Arquivo encontrado. Iniciando extração (Bypass FUSE)..."
  
  chmod +x simulide.AppImage
  
  # Extrai o conteúdo (Isso resolve o erro 'AppImages require FUSE')
  ./simulide.AppImage --appimage-extract > "$BLACK_WHOLE"
  
  # Renomeia a pasta extraída para algo padrão
  rm -rf simulide-files
  mv squashfs-root simulide-files
  
  # Remove o arquivo compactado para economizar espaço
  rm simulide.AppImage

  # Cria o Alias apontando para o AppRun dentro da pasta extraída
  if ! grep -q "alias simulide=" "$ALIAS_FILE"; then
    echo "alias simulide=\"$INSTALL_DIR/simulide-dir/simulide-files/AppRun > /dev/null 2>&1 &\"" >> "$ALIAS_FILE"
    echo -e "${GREEN}Alias do SimulIDE configurado com sucesso.${NC}"
  fi

else
  echo -e "${YELLOW}ERRO: O arquivo 'simulide.AppImage' não foi encontrado.${NC}"
  echo "Por favor, baixe manualmente em https://simulide.com/p/downloads/"
  echo "Salve o arquivo na pasta: $INSTALL_DIR/simulide-dir/ com o nome 'simulide.AppImage' e rode o script novamente."
fi

echo -e "${b_green}[SUCESSO]${nc} SimulIDE instalado manualmente!"
