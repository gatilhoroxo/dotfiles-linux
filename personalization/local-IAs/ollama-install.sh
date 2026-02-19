# --- Baixar Ollama ---
curl  -fsSL https://ollama.com/install.sh | sh

# --- Modelo de CÓDIGO ---
ollama pull qwen2.5-coder:7b-instruct-q4_K_M
# Tamanho: ~4.7GB | Melhor custo-benefício para código, sem GPU

# --- Modelo de CONVERSAÇÃO ---
ollama pull llama3.2:3b-instruct-q4_K_M
# Tamanho: ~2.0GB | Rápido, respostas em segundos sem GPU

# Verificar os dois depois de baixar:
ollama list
