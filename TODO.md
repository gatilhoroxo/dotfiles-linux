# Tarefas

## Milestone 0 - Arquitetura

- [x] Mover/ajustar documentação
- [x] criar tests/
- [x] criar README inicial

- [x] Consolidar lib/
- [x] Definir responsabilidade de cada módulo
- [x] Criar bin/dev
- [x] Criar core.sh
- [x] Criar log.sh
- [x] Criar utils.sh

## Milestone 1.1 - `core`, `log` e `utils`

- [x] implementar lib/core.sh
- [x] implementar lib/log.sh
  - [x] implementar lib/colors.sh
- [x] implementar lib/utils.sh
  - [x] implementar lib/filesystem.sh
  - [x] implementar lib/command.sh

## Milestone 1.2 - Diagnóstico

> 1. Estrutura

- [x] Criar `doctor.sh`
- [x] Fazer `mdev doctor` chamar o módulo
- [ ] Definir formato da saída do diagnóstico

> 2. Sistema

- [ ] Implementar detecção do SO
- [ ] Implementar detecção da distribuição
- [ ] Implementar detecção da versão
- [ ] Implementar detecção da arquitetura

> 3. Usuário

- [ ] Detectar nome do usuário
- [ ] Detectar HOME
- [ ] Detectar shell

> 4. Permissões

- [ ] Verificar se HOME é gravável
- [ ] Verificar `~/.local`
- [ ] Verificar `~/.local/bin`
- [ ] Detectar disponibilidade do sudo
- [ ] Investigar permissões do sudo

> 5. Ferramentas

- [ ] Criar lista de ferramentas essenciais
- [ ] Verificar ferramentas com `command_exists`
- [ ] Mostrar caminho das ferramentas encontradas
- [ ] Mostrar versão quando disponível
- [ ] Separar ferramentas obrigatórias/opcionais

> 6. Conectividade

- [ ] Verificar disponibilidade de ferramenta de rede
- [ ] Testar conectividade
- [ ] Diferenciar "ferramenta ausente" de "sem Internet"

> 7. Integração

- [ ] `mdev doctor` executar todos os diagnósticos
- [ ] Retornar código de saída adequado
- [ ] Testar em ambiente normal
- [ ] Testar em ambiente com ferramentas ausentes
- [ ] Testar em ambiente sem permissões

> Verificar apenas esses na primeira versão:

- Sistema operacional
- Arquitetura
- Usuário
- Home
- Root?
- sudo?
- Git
- Python, Rust
- Docker
- KVM
- Internet


## Milestone 2 - Setup

- [ ] Implementar directories.sh
  > garantir a construção dos diretórios
  - [ ] função `ensure_directory()`
      > com: `dev setup`
      > primeira vez: `Created ~/develop`
      > segunda vez: `~/develop already exists`
- [ ] Ler directories.yaml
- [ ] Criar diretórios de forma idempotente
- [ ] Implementar user-dirs
  - [ ] verificar se a pasta original existe;
  - [ ] verificar se a pasta de destino já existe;
  - [ ] verificar se o nome já foi alterado;
  - [ ] verificar se o usuário realmente quer fazer a migração.

## Milestone 3 - Repositórios

- [ ] Implementar git.sh
- [ ] Implementar repositories.sh
  > comportamento:
  >
  > ```sh
  > repositório não existe           -> clone
  > repositório já existe            -> não clona novamente
  > repositório existe mas não é Git -> erro
  > repositório existe e é Git       -> mantém
  > ```

- [ ] Ler repositories.yaml
- [ ] Clonar apenas o que está ausente

## Milestone 4 - Ferramentas

- [x] Definir modelo de tools.yaml
- [ ] Implementar installer.sh
  - [ ] Investigar a estrutura da pasta `install-stuff`
- [ ] Suporte a ferramentas portáteis
- [ ] Suporte a ferramentas do sistema
- [ ] Suporte a ferramentas em containers

## Milestone 5 - Sessão

- [ ] Implementar shell.sh
- [ ] PATH
- [ ] aliases
- [ ] environment
- [ ] Implementar `enter-session`
  > ambiente geral
  > PATH, aliases, exports, prompt
- [ ] Implementar `enter-dev`
  > ferramentas de desenvolvimento
  > Python, Rust, PlatformIO, ESP32, toolchains

## Milestone 6 - Manutenção

- [ ] implementar `update`
  > dependencia de: repositories, tools, configs, project itself
- [ ] implementar `clean`
  > dependencia de: cache, downloads, temporary state

---
