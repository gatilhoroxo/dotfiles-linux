<!-- 
Um rascunho
-->
# Criando ambiente portátil

## Camadas

> Pensando em camadas

### Camada 1 - Pendrive

Apenas o armazenamento das coisas

```sh
  apps/
  archives/
  scripts/
  configs/
  projects/
  notes/
```

Não executa nada automaticamente.

### Camada 2 - Bootstrap

Um comando `bootstrap.sh` para detectar tudo e baixar o que está faltando automaticamente.

### Camada 3 - Sessão

Depois do bootstrap, existe apenas `enter-dev` para ajustar PATH, exportar variáveis, criar aliases, montar diretórios temporários, ativar ambiente Python, configurar o Git, etc.

Sem fazer as coisas manualmente.

### Camada 4 - Ferramentas

Cada ferramenta isolada.

```sh
tools/
  git/
  gh/
  glab/
  cmake/
  python/
  rust/
```

### Camada 5 - Estado

Tudo o que muda fica separado.

```sh
state/
  cache/
  logs/
  downloads/
```

---

## Transformando em produto intuitivo

> "Se eu perder totalmente meu notebook hoje e sentar amanhã em um computador Linux qualquer da universidade, quais são os 10 primeiros comandos que eu sempre executo?"

Depois de clonar o repositório desse pequeno projeto que tem os seguintes comandos

1. `bootstrap`: prepara o próprio projeto (cria state, cache, logs, bin/dev, bash, git, config inicial)
2. `doctor`: faz um diagnóstico do que existe e do que não existe no sistema operacional
3. `setup-myenv`: faz alterações permanentes.
   - Configura diretórios existentes
   - Cria diretórios extras
   - Clona repositório de notas
   - Clona repositório de projetos
4. `enter`: prepara a sessão com aliases, variáveis e prompt
5. `enter-dev`: prepara para uso de Python, Rust, Esp32, PlatformIO
6. `update-env`: atualiza tudo (repositórios, gh, glab, scripts, configs, etc.)
7. `clean-env`: limpa cache, downloads temporários e arquivos antigos.
8. `dev`: um executável

---

Rascunho

1. `enter-dev`: verificar o nível de admin, checar a existências de certas ferramentas e se não estiverem então "instalar" elas
2. Logar nas contas do google no firefox (talvez chrome também mas eu não uso o chrome)
3. Logar nas contas GitHub (pelo gh) e GitLab (pelo glab)

---
