#!/bin/bash
# 
# Apenas verifica coisas de arquivos e diretórios
# 
# ESTADO: desenvolvendo, não testado, não completo
# Depende de log.sh, command.sh
# 

file_exists() {
  local file_path="$1"
  if [ -z "$file_path" ]; then
    log_error "Erro: Nenhum caminho de arquivo informado."
    return 1
  elif [ ! -f "$file_path" ]; then
    return 1 # não existe arquivo
  else
    return 0 # existe arquivo
  fi
}

directory_exists() {
  local dir_path="$1"
  if [ -z "$dir_path" ]; then
    log_error "Erro: Nenhum caminho de diretório informado."
    return 1
  elif [ ! -d "$dir_path" ]; then
    return 1 # não existe diretório
  else
    return 0 # existe diretório
  fi
}

is_symlink() {
  local path="$1"
  if [ -z "$path" ]; then
    log_error "Erro: Nenhum caminho informado."
    return 1
  elif [ ! -L "$path" ]; then
    return 1 # não é um link simbólico
  else
    return 0 # é um link simbólico
  fi
}

ensure_file() {
  local file_path="$1"
  if [ -z "$file_path" ]; then
    log_error "Erro: Nenhum caminho de arquivo informado."
    return 1
  elif file_exists "$file_path"; then
    return 0 # arquivo já existe
  fi

  local dir_path=$(dirname "$file_path")
  ensure_directory "$dir_path" || return 1

  touch "$file_path" || return 1
  log_success "Arquivo '$file_path' criado com sucesso."
  return 0 # arquivo criado com sucesso
}

ensure_directory() {
  local dir_path="$1"
  if [ -z "$dir_path" ]; then
    log_error "Erro: Nenhum caminho de diretório informado."
    return 1
  elif ! directory_exists "$dir_path"; then
    mkdir -p "$dir_path" || return 1
    log_success "Diretório '$dir_path' criado com sucesso."
  fi
  return 0
}

ensure_symlink() {
  local target="$1"
  local link_name="$2"
  if [ -z "$target" ]; then
    log_error "Erro: O caminho de destino não foi fornecido."
    return 1
  elif [ -z "$link_name" ]; then
    log_error "Erro: O nome do link simbólico não foi fornecido."
    return 1
  elif [ ! -e "$target" ]; then
    log_error "Erro: O destino '$target' não existe."
    return 1
  elif [ -e "$link_name" ] && ! is_symlink "$link_name" ; then
    log_error "Erro: O caminho '$link_name' já existe e não é um link simbólico."
    return 1
  elif is_symlink "$link_name" && [ "$(readlink "$link_name")" == "$target" ]; then
    log_info "O link simbólico '$link_name' já aponta para '$target'. Nenhuma ação necessária."
  elif is_symlink "$link_name"; then
    log_info "O link simbólico '$link_name' já existe. Atualizando para apontar para '$target'."
    ln -sf "$target" "$link_name" || return 1
  else
    log_info "Criando link simbólico '$link_name' apontando para '$target'."
    ln -s "$target" "$link_name" || return 1
    log_success "Link simbólico criado com sucesso."
  fi
  return 0
}

ensure_copy() {
  local source="$1"
  local destination="$2"
  if [ -z "$source" ] || [ -z "$destination" ]; then
    log_error "Erro: Caminho de origem ou destino não informado."
    return 1
  elif [ -z "$source" ]; then
    log_error "Erro: O caminho de origem não foi fornecido."
    return 1
  elif [ -z "$destination" ]; then
    log_error "Erro: O caminho de destino não foi fornecido."
    return 1
  elif [ ! -e "$source" ]; then
    log_error "Erro: O arquivo de origem '$source' não existe."
    return 1
  elif [ -e "$destination" ]; then
    log_info "O arquivo de destino '$destination' já existe. Nenhuma ação necessária."
  else
    log_info "Copiando '$source' para '$destination'."
    cp -r "$source" "$destination" || return 1
    log_success "Arquivo copiado com sucesso."
  fi
}

#talvez em outro lugar pois lida com vários outros comandos
extract_file() {
  #TODO: ver se a extração já foi feita
  local file="$1"
  if [ -z "$file" ]; then
    log_error "Erro: Nenhum caminho de arquivo informado."
    return 1
  elif [ -f "$file" ]; then
    shift # ← Remove apenas para pegar flags extras
    case "$file" in
      *.tar.bz2)
        tar xjf    "$file" "$@" ;;
      *.tar.gz)
        tar xzf    "$file" "$@" ;;
      *.tbz2)
        tar xjf    "$file" "$@" ;;
      *.tgz)
        tar xzf    "$file" "$@" ;;
      *.tar)
        tar xf     "$file" "$@" ;;
      *.bz2)
        if command_exists bunzip2; then
          bunzip2 "$file" "$@"
        else
          log_error "Erro: 'bunzip2' não encontrado. Instale o pacote 'bzip2'."
        fi
        ;;
      *.rar)
        if command_exists unrar; then
          unrar x "$file" "$@"
        else
          log_error "Erro: 'unrar' não encontrado. Instale o pacote 'unrar'."
        fi
        ;;
      *.zip)
        if command_exists unzip; then
          unzip "$file" "$@"
        else
          log_error "Erro: 'unzip' não encontrado. Instale o pacote 'unzip'."
        fi
        ;;
      *.xz)
        if command_exists unxz; then
          unxz "$file" "$@"
        else
          log_error "Erro: 'unxz' não encontrado. Instale o pacote 'xz-utils'."
        fi
        ;;
      *.gz)
        if command_exists gunzip; then
          gunzip "$file" "$@"
        else
          log_error "Erro: 'gunzip' não encontrado. Instale o pacote 'gzip'."
        fi
        ;;
      *.7z)
        if command_exists 7z; then
          7z x "$file" "$@"
        else
          log_error "Erro: '7z' não encontrado. Instale o pacote 'p7zip'."
        fi
        ;;
      *.Z)
        if command_exists uncompress; then
          uncompress "$file" "$@"
        else
          log_error "Erro: 'uncompress' não encontrado. Instale o pacote 'compress'."
        fi
        ;;
      *)
        log_error "'$file' formato não suportado" ;;
    esac
  else 
    log_error "'$file' não é um arquivo válido"
  fi
  return 0
}

