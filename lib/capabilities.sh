#!/bin/bash
# 
# Este arquivo contem funções que responde perguntas. 
# Nunca modifica nada. 
# 
# ESTADO: incompleto
# Depende de: command.sh

# ----------------------------

# user and privileges

is_root(){
  [[ "$EUID" -eq 0 ]]
}

has_sudo(){
  command_exists sudo
}

has_full_sudo(){
  has_sudo || return 1
  sudo -n true >/dev/null 2>&1
}

#has_partial_sudo()

# ----------------------------

# system
#is_inside_vm()

# ----------------------------

# network
#has_internet()

# ----------------------------

# develop
has_git(){
  command_exists git
}
has_gh(){
  command_exists gh
}
has_glab(){
  command_exists glab
}
has_gcc(){
  command_exists gcc
}
has_python(){
  command_exists python3
}
has_rust(){
  command_exists rust #?
}

# ----------------------------

# containers and virtualization
#has_docker()
#has_podman()
#has_qemu()
#has_kvm()

# ----------------------------

# manegers
has_apt(){
  command_exists apt
}
has_snap(){
  command_exists snap
}
has_flatpak(){
  command_exists flatpak
}

# ----------------------------

# usage capabilities
#can_use_docker()
#can_use_podman()
#can_use_qemu()
#can_use_kvm()

#can_use_apt()
#can_use_snap()
#can_use_flatpak()

# ----------------------------

