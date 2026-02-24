
# Verifica Admin (Grupo sudo ou Root)

check_admin(){
  if [ "$EUID" -eq 0 ]; then
    IS_ADMIN=true
    echo -e "${green}Você está rodando como ROOT.${nc}"
  elif groups | grep -q "\bsudo\b"; then
    IS_ADMIN=true
    echo -e "${green}Você pertence ao grupo ADMIN. Usaremos APT/SNAP.${nc}"
  else
    IS_ADMIN=false
    echo -e "${yellow}Ambiente restrito detectado. Instalando modo PORTÁTIL.${nc}"
  fi
}