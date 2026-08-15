#!/bin/bash
#
# Funções totalmente genéricas
# 
# ESTADO: incompleto
#  

#lugar novo: archive.sh
download_file()

#talvez em outro lugar pois lida com vários outros comandos
#essa função está grande demais
#adicionar o local de extração também como argumento
#lugar novo: archive.sh
extract_file() {
  #TODO: ver se a extração já foi feita
  local file="$1"
  if [ -z "$file" ]; then
    log_error "Erro: Nenhum caminho de arquivo informado."
    return 1
  elif [ -f "$file" ]; then
    shift # ← Remove apenas para pegar flags extras
    case "$file" in
      *.tar.bz2 | *.tbz2)
        if command_exists tar; then
          tar xjf "$file" "$@" || return 1
          return 0
        else
          log_error "Erro 'tar' não encontrado."
        fi
        ;;
      *.tar.gz | *.tgz)
        if command_exists tar; then
          tar xzf "$file" "$@" || return 1
          return 0
        else
          log_error "Erro 'tar' não encontrado."
        fi
        ;;
      *.tar)
        if command_exists tar; then
          tar xf "$file" "$@" || return 1
          return 0
        else
          log_error "Erro 'tar' não encontrado."
        fi
        ;;
      *.bz2)
        if command_exists bunzip2; then
          bunzip2 "$file" "$@" || return 1
          return 0
        else
          log_error "Erro: 'bunzip2' não encontrado. Instale o pacote 'bzip2'."
        fi
        ;;
      *.rar)
        if command_exists unrar; then
          unrar x "$file" "$@" || return 1
          return 0
        else
          log_error "Erro: 'unrar' não encontrado. Instale o pacote 'unrar'."
        fi
        ;;
      *.zip)
        if command_exists unzip; then
          unzip "$file" "$@" || return 1
          return 0
        else
          log_error "Erro: 'unzip' não encontrado. Instale o pacote 'unzip'."
        fi
        ;;
      *.xz)
        if command_exists unxz; then
          unxz "$file" "$@" || return 1
          return 0
        else
          log_error "Erro: 'unxz' não encontrado. Instale o pacote 'xz-utils'."
        fi
        ;;
      *.gz)
        if command_exists gunzip; then
          gunzip "$file" "$@" || return 1
          return 0
        else
          log_error "Erro: 'gunzip' não encontrado. Instale o pacote 'gzip'."
        fi
        ;;
      *.7z)
        if command_exists 7z; then
          7z x "$file" "$@" || return 1
          return 0
        else
          log_error "Erro: '7z' não encontrado. Instale o pacote 'p7zip'."
        fi
        ;;
      *.Z)
        if command_exists uncompress; then
          uncompress "$file" "$@" || return 1
          return 0
        else
          log_error "Erro: 'uncompress' não encontrado. Instale o pacote 'compress'."
        fi
        ;;
      *)
        log_error "'$file' formato não suportado" 
        ;;
    esac
  else 
    log_error "'$file' não é um arquivo válido"
  fi
  return 1
}

ask_confirmation()

is_linux()

is_writable()


append_if_missing()

contains_line()

