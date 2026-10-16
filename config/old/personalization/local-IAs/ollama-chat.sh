# 1. Garante que o Ollama está rodando
ollama serve &

# 2. Sobe o Open WebUI apontando pro Ollama local
## isso daqui nao foi de primeira, use o de baixo
docker run -d \
  -p 3242:8080 \
  --add-host=host.docker.internal:host-gateway \
  -v open-webui:/app/backend/data \
  -e OLLAMA_BASE_URL=http://host.docker.internal:11434 \
  --name open-webui \
  --restart always \
  ghcr.io/open-webui/open-webui:main

## segunda opcao
docker run -d \
  --network=host \
  -v open-webui:/app/backend/data \
  -e OLLAMA_BASE_URL=http://localhost:11434 \
  --name open-webui \
  --restart always \
  ghcr.io/open-webui/open-webui:main

# 3. Acompanha o download da imagem e inicialização
docker logs -f open-webui
# Espera aparecer: "Application startup complete"

# 4. Acessa no navegador
http://localhost:3242


# Comandos úteis
if [ false ]; then 

    # Parar a interface
    docker stop open-webui

    # Reiniciar
    docker start open-webui

    # Ver se está rodando
    docker ps

    # Atualizar o WebUI quando sair versão nova
    docker pull ghcr.io/open-webui/open-webui:main
    docker stop open-webui && docker rm open-webui
    # Roda o docker run novamente

fi