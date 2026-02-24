
# Atualiza todo o sistema com um único comando
# Uso: sysupdate
sysupdate() {
    sudo apt update && sudo apt full-upgrade -y 
    sudo apt autoremove -y && sudo apt autoclean
    echo "Sistema atualizado e limpo!"
}

# criar diretorio e entrar nele
mkcd() {
  mkdir -p "$1"
  cd "$1" || return
}

# Sobe 'n' níveis de diretório
# Uso: up 2 (sobe 2 pastas), up (sobe 1 pasta)
up() {
    local d=""
    limit=$1
    for ((i=1 ; i <= limit ; i++)); do
        d=$d/..
    done
    d=$(echo $d | sed 's/^\///')
    if [ -z "$d" ]; then
        d=..
    fi
    cd $d
}

awake(){
  if [ -z "$1" ]; then
    echo "Uso: awake <minutos>"
  else
   (
      # salvar estado atual
      IDLE_DELAY=$(gsettings get org.gnome.desktop.session idle-delay)
      LOCK_ENABLED=$(gsettings get org.gnome.desktop.screensaver lock-enabled)
      IDLE_DIM=$(gsettings get org.gnome.settings-daemon.plugins.power idle-dim)

      restore() {
        gsettings set org.gnome.desktop.session idle-delay "$IDLE_DELAY"
        gsettings set org.gnome.desktop.screensaver lock-enabled "$LOCK_ENABLED"
        gsettings set org.gnome.settings-daemon.plugins.power idle-dim "$IDLE_DIM"
        notify-send "awake" "Configurações de tela restauradas"
        echo "$(date): restore executado" >> /tmp/awake.log
      }

      # garantir restauração ao sair ou ser morto
      trap restore EXIT SIGINT SIGTERM
    
      # desativar comportamentos de idle
      gsettings set org.gnome.desktop.session idle-delay 0
      gsettings set org.gnome.desktop.screensaver lock-enabled false
      gsettings set org.gnome.settings-daemon.plugins.power idle-dim false

      # manter acordado
      systemd-inhibit --what=idle:sleep --mode=block -- sleep $(($1 * 60))
    ) &
    
    echo $! > /tmp/awake.pid
    date && echo "awake iniciado por $1 minutos (PID $(cat /tmp/awake.pid))"
  fi
}

awake_stop() {
  if [ -f /tmp/awake.pid ]; then
    PGID=$(cat /tmp/awake.pid)
    kill -- -"$PGID"
    rm /tmp/awake.pid
    echo "awake encerrado antes do tempo"
  else
    echo "nenhum awake em execução"
  fi
}

