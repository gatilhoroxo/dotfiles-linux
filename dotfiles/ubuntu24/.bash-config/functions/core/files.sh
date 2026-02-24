# extrair arquivos comuns
extract() {
  if [ -f "$1" ]; then
    local file="$1"          # ← Salva o nome do arquivo
    shift                    # ← Remove apenas para pegar flags extras
    case "$file" in          # ← Usa a variável salva
      *.tar.bz2) tar xjf "$file" "$@" ;;
      *.tar.gz)  tar xzf "$file" "$@" ;;  
      *.tbz2)    tar xjf "$file" "$@" ;;
      *.tgz)     tar xzf "$file" "$@" ;;
      *.tar)     tar xf "$file" "$@" ;;
      *.bz2)     bunzip2 "$file" "$@" ;;
      *.rar)     unrar x "$file" "$@" ;;
      *.zip)     unzip "$file" "$@" ;;
      *.gz)      gunzip "$file" "$@" ;;
      *.7z)      7z x "$file" "$@" ;;
      *.Z)       uncompress "$file" "$@" ;;
      *)         echo "'$file' formato não suportado" ;;
    esac
  else 
    echo "'$1' não é um arquivo válido"
  fi
}

# Copia o conteúdo de um arquivo para o clipboard (requer xclip)
# Instale antes: sudo apt install xclip
# Uso: copyfile id_rsa.pub
copyfile() {
  if [ -f "$1" ]; then
    xclip -selection clipboard < "$1"
    echo "Conteúdo de '$1' copiado para a área de transferência."
  else
    echo "Arquivo não encontrado."
  fi
}
