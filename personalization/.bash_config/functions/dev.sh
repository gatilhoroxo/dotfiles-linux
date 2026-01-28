#setando um usuario git
# Uso: setUserGit "Nome" "email" [--global]
setUserGit(){
    if [ "$3" == "--global" ]; then
        git config --global user.name "$1"
        git config --global user.email "$2"
        echo "Git global configurado para: $1 <$2>"
    else 
        git config user.name "$1"
        git config user.email "$2"
        echo "Git local configurado para: $1 <$2>"
    fi 
}

# Mostra seu IP local e IP público
# Uso: myip
myip() {
    echo "IP Local: $(hostname -I | cut -d' ' -f1)"
    echo "IP Público: $(curl -s ifconfig.me)"
}

