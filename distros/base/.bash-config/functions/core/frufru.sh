# Função para testar mensagens coloridas
print_status() {
    echo -e "${b_green}[SUCESSO]${nc} O comando foi executado."
    echo -e "${b_red}[ERRO]${nc} Algo deu errado no processo."
    echo -e "${b_yellow}[AVISO]${nc} Tenha cuidado com este comando."
    echo -e "${b_cyan}[INFO]${nc} Iniciando o processo..."
    echo -e "${b_purple}[DEBUG]${nc} Variável X = 10"
}

# Mostra todas as cores disponíveis
show_colors() {
    echo -e "\n--- Cores Normais ---"
    echo -e "${black}Black ${red}Red ${green}Green ${yellow}Yellow ${blue}Blue ${purple}Purple ${cyan}Cyan ${white}White ${nc}"
    
    echo -e "\n--- Cores Negrito/Brilhantes ---"
    echo -e "${b_black}Black ${b_red}Red ${b_green}Green ${b_yellow}Yellow ${b_blue}Blue ${b_purple}Purple ${b_cyan}Cyan ${b_white}White ${nc}"

    echo -e "\nTeste: \033[1;91m old ${nc}"

    echo -e "\n--- Estilos ---"
    echo -e "${underline}Sublinhado${nc}  ${reverse}Invertido${nc} ${blink}Blink${nc} \n"
}

