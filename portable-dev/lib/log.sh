#
#
# Apenas imprime mensagens
#
# ESTADO: incompleto
# 
# 

log_info(){
    #mensagem em azul
    if [ -z $1 ]; then
        echo "${blue}${g_black}## $1 ##${nc}"
    fi
}
log_success(){
    #mensagem em verde
    if [ -z $1 ]; then
        echo "${green}${g_black}## $1 ##${nc}"
    fi
}
log_warning(){
    #mensagem em amarelo
    if [ -z $1 ]; then
        echo "${yellow}${g_black}## $1 ##${nc}"
    fi
}
log_error(){
    #mensagem em vermelho
    if [ -z $1 ]; then
        echo "${red}${g_black}## $1 ##${nc}"
    fi
}
log_debug(){
    #mensagem em roxo
    if [ -z $1 ]; then
        echo "${purple}${g_black}## $1 ##${nc}"
    fi
}

