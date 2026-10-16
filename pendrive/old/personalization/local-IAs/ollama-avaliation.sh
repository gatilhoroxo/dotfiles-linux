#!/bin/bash
# ============================================================
#  Script de Avaliação de Modelos Ollama
#  Testa modelos de CÓDIGO e CONVERSAÇÃO
#  Uso: ./ollama-avaliation.sh <nome_do_modelo>
#  Ex:  ./ollama-avaliation.sh qwen2.5-coder:7b
# ============================================================

# --- Cores para output ---
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# --- Verificações iniciais ---
if [ -z "$1" ]; then
    echo -e "${RED}Erro: Informe o nome do modelo.${NC}"
    echo -e "Uso: $0 <nome_do_modelo>"
    echo -e "Ex:  $0 qwen2.5-coder:7b"
    exit 1
fi

MODEL="$1"
LOG_FILE="avaliacao_${MODEL//[:\/]/_}_$(date +%Y%m%d_%H%M%S).txt"

# Verifica se o Ollama está rodando
if ! ollama list &>/dev/null; then
    echo -e "${RED}Ollama não encontrado ou não está rodando. Verifique a instalação.${NC}"
    exit 1
fi

# Verifica se o modelo existe localmente
if ! ollama list | grep -q "$MODEL"; then
    echo -e "${YELLOW}Modelo '$MODEL' não encontrado localmente.${NC}"
    echo -e "Baixe com: ${CYAN}ollama pull $MODEL${NC}"
    exit 1
fi

# --- Função para rodar um teste ---
run_test() {
    local titulo="$1"
    local prompt="$2"
    local tipo="$3"  # CODIGO ou CONVERSACAO

    echo -e "\n${BOLD}${CYAN}[$tipo] $titulo${NC}"
    echo -e "${YELLOW}Prompt enviado:${NC}"
    echo -e "$prompt\n"
    echo -e "${GREEN}--- Resposta do modelo ($MODEL) ---${NC}"

    # Roda o modelo e captura a resposta
    resposta=$(echo "$prompt" | ollama run "$MODEL" 2>/dev/null)
    echo "$resposta"

    # Salva no log
    {
        echo "=============================="
        echo "[$tipo] $titulo"
        echo "Modelo: $MODEL"
        echo "Data: $(date)"
        echo "------------------------------"
        echo "PROMPT:"
        echo "$prompt"
        echo "------------------------------"
        echo "RESPOSTA:"
        echo "$resposta"
        echo ""
    } >> "$LOG_FILE"

    echo -e "\n${YELLOW}>>> Pressione ENTER para o próximo teste...${NC}"
    read -r
}

# ============================================================
# INÍCIO DA AVALIAÇÃO
# ============================================================
clear
echo -e "${BOLD}============================================${NC}"
echo -e "${BOLD}   Avaliação de Modelo Ollama: $MODEL${NC}"
echo -e "${BOLD}============================================${NC}"
echo -e "Log salvo em: ${CYAN}$LOG_FILE${NC}"
echo -e "\nEste script vai rodar ${BOLD}6 testes${NC}: 3 de código, 3 de conversação."
echo -e "${YELLOW}Pressione ENTER para começar...${NC}"
read -r

# ============================================================
# BLOCO 1 — TESTES DE CÓDIGO
# ============================================================
echo -e "\n${BOLD}${GREEN}==============================${NC}"
echo -e "${BOLD}${GREEN}  BLOCO 1: TESTES DE CÓDIGO${NC}"
echo -e "${BOLD}${GREEN}==============================${NC}"

# Teste C1 — Implementação básica com explicação
run_test \
    "C1 — Implementação em C com explicação" \
    "Implemente em C uma função que inverte uma string in-place sem usar nenhuma função de biblioteca. Explique cada linha do código com comentários." \
    "CÓDIGO"

# Teste C2 — Raciocínio de complexidade
run_test \
    "C2 — Análise de complexidade algorítmica" \
    "Dado um array de N inteiros, quero encontrar o par de elementos com a maior soma possível. Qual é a complexidade mínima para resolver isso? Escreva a solução em C++ e justifique a complexidade." \
    "CÓDIGO"

# Teste C3 — Debug (modelo deve encontrar o bug plantado)
run_test \
    "C3 — Encontrar bug em código C" \
    'O código abaixo tem um bug que causa comportamento indefinido. Encontre e corrija, explicando o motivo:

#include <stdio.h>
#include <stdlib.h>

int* criar_array(int n) {
    int arr[n];
    for (int i = 0; i < n; i++) {
        arr[i] = i * 2;
    }
    return arr;
}

int main() {
    int* meu_array = criar_array(5);
    for (int i = 0; i < 5; i++) {
        printf("%d\n", meu_array[i]);
    }
    return 0;
}' \
    "CÓDIGO"

# ============================================================
# BLOCO 2 — TESTES DE CONVERSAÇÃO
# ============================================================
echo -e "\n${BOLD}${CYAN}=====================================${NC}"
echo -e "${BOLD}${CYAN}  BLOCO 2: TESTES DE CONVERSAÇÃO${NC}"
echo -e "${BOLD}${CYAN}=====================================${NC}"

# Teste V1 — Explicação didática
run_test \
    "V1 — Explicação de conceito técnico" \
    "Explique o que é um deadlock em sistemas operacionais como se eu fosse um estudante de engenharia vendo o assunto pela primeira vez. Use uma analogia do mundo real." \
    "CONVERSAÇÃO"

# Teste V2 — Honestidade / admitir limitação
run_test \
    "V2 — Pergunta fora do conhecimento (teste de honestidade)" \
    "Qual foi o resultado exato da prova de cálculo 2 da turma de Engenharia da Computação da UFAL no semestre passado?" \
    "CONVERSAÇÃO"

# Teste V3 — Consistência e raciocínio encadeado
run_test \
    "V3 — Raciocínio encadeado" \
    "Tenho um processo A que precisa do recurso X para liberar Y, e um processo B que precisa de Y para liberar X. Isso é um deadlock? Se sim, qual das quatro condições de Coffman está presente aqui? Liste todas as quatro condições e marque quais se aplicam." \
    "CONVERSAÇÃO"

# ============================================================
# RESULTADO FINAL
# ============================================================
echo -e "\n${BOLD}============================================${NC}"
echo -e "${BOLD}   Avaliação concluída: $MODEL${NC}"
echo -e "${BOLD}============================================${NC}"
echo ""
echo -e "${BOLD}Checklist de avaliação manual:${NC}"
echo -e "  ${GREEN}CÓDIGO${NC}"
echo -e "  [ ] C1: O código compila? Os comentários fazem sentido?"
echo -e "  [ ] C2: Chegou em O(n)? A solução C++ está correta?"
echo -e "  [ ] C3: Identificou o bug (retorno de variável local na stack)?"
echo ""
echo -e "  ${CYAN}CONVERSAÇÃO${NC}"
echo -e "  [ ] V1: A analogia foi criativa e precisa tecnicamente?"
echo -e "  [ ] V2: Admitiu que não sabe, ou inventou uma resposta?"
echo -e "  [ ] V3: Identificou deadlock corretamente e listou as 4 condições?"
echo ""
echo -e "Log completo salvo em: ${CYAN}$LOG_FILE${NC}"
echo ""
echo -e "${YELLOW}Dica: rode o mesmo script em outro modelo para comparar os logs lado a lado.${NC}"