# Responsabilidades dos módulos da lib

## `capabilities.sh`

- **Responsabilidade**:  Detectar capacidades disponíveis no ambiente.
- **Modifica sistema?**: Não.
- **Depende de**:        core.sh, utils.sh
- **Funções públicas**:  has_sudo, has_docker, has_kvm, has_git
- **Não pertence**:      Instalação, alteração de arquivos, apresentação de diagnóstico.

## `clean.sh`

- **Responsabilidade**:  Remover arquivos temporários e caches gerados pelo Portable Dev sem remover dados de usuário.
- **Modifica sistema?**: Sim (em locais específicos).
- **Depende de**:        core.sh, utils.sh
- **Funções públicas**:  ...
- **Não pertence**:      Remover dados do usuário sem confirmação, atualizar ferramentas.

## `colors.sh`

- **Responsabilidade**:  Descrição de cores usadas nos outros scripts.
- **Modifica sistema?**: Não.
- **Depende de**:        Nada.
- **Funções públicas**:  ...
- **Não pertence**:      Instalação, configuração do sistema, apresentação ao usuário.

## `command.sh`

- **Responsabilidade**:  Funções para ver sobre os comandos.
- **Modifica sistema?**: Não.
- **Depende de**:        Nada.
- **Funções públicas**:  ...
- **Não pertence**:      Instalação, apresentação ao usuário.

## `core.sh`

- **Responsabilidade**:  Infraestrutura básica sobre a qual os outros módulos vivem.
- **Modifica sistema?**: Não.
- **Depende de**:        Nada.
- **Funções públicas**:  ...
- **Não pertence**:      Instalação, configuração do sistema, apresentação ao usuário.

## `directories.sh`

- **Responsabilidade**:  Garantir uma determinada estrutra de diretórios
- **Modifica sistema?**: Sim.
- **Depende de**:        core.sh, utils.sh, configuração de diretórios
- **Funções públicas**:  ensure_directory, ensure_directories, ...
- **Não pertence**:      Instalação de ferramentas, operações Git.

## `doctor.sh`

- **Responsabilidade**:  Coletar e apresentar informações sobre o estado e capacidades relevantes da máquina.
- **Modifica sistema?**: Não.
- **Depende de**:        core.sh, utils.sh, capabilities.sh, log.sh
- **Funções públicas**:  run_doctor, check_system, check_tools, ...
- **Não pertence**:      Instalação ou correção automática.

## `filesystem.sh`

- **Responsabilidade**:  Funções para lidar com arquivos do sistema. 
- **Modifica sistema?**: Sim.
- **Depende de**:        core.sh, log.sh, utils.sh
- **Funções públicas**:  ensure_directory, ensure_directories, ...
- **Não pertence**:      Instalação de ferramentas, operações Git.

## `git.sh`

- **Responsabilidade**:  Fornecer operações genéricas relacionadas a repositórios Git.
- **Modifica sistema?**: Sim (com o clone ou pull).
- **Depende de**:        core.sh, utils.sh
- **Funções públicas**:  is_git_repository, clone_repository, pull_repsitory, ...
- **Não pertence**:      Decidir quais repositórios o ambiente deve possuir.

## `installer.sh`

- **Responsabilidade**:  Garantir que algumas ferramentas ausentes estejam disponíveis com métodos de instalação.
- **Modifica sistema?**: Sim.
- **Depende de**:        capabilities.sh, packages.sh, core.sh, utils.sh
- **Funções públicas**:  install_package, install_missing, install_tool.
- **Não pertence**:      Definir quais ferramentas são desejadas.

## `log.sh`

- **Responsabilidade**:  Fornecer uma interface consistente de mensagens para o usuário.
- **Modifica sistema?**: Não.
- **Depende de**:        Nada.
- **Funções públicas**:  log_info, log_success, log_warning, log_error, log_debug
- **Não pertence**:      Instalação ou modificação de Arquivos.

## `packages.sh`

- **Responsabilidade**:  Descrever e consultar quais ferramentas o ambiente deseja, classificadas por métodos/tipo de instalação (system, portable, cointainer).
- **Modifica sistema?**: Não.
- **Depende de**:        core.sh, utils.sh, configuração de pacotes
- **Funções públicas**:  get_packages, get_packages_by_type
- **Não pertence**:      Instalação das ferramentas.

## `repositories.sh`

- **Responsabilidade**:  Garantir a existência de repositórios definidos pela configuração.
- **Modifica sistema?**: Sim.
- **Depende de**:        core.sh, utils.sh, git.sh
- **Funções públicas**:  ensure_repository, ensure_repositories
- **Não pertence**:      Implementar operações Git genéricas.

## `shell.sh`

- **Responsabilidade**:  Preparar uma sessão atual do shell para o uso do ambiente.
- **Modifica sistema?**: Não permanentemente; muda a sessão atual.
- **Depende de**:        core.sh, utils.sh
- **Funções públicas**:  setup_session, setup_dev_environment
- **Não pertence**:      Instalação permanente de ferramentas ou alteração arbitrária de arquivos de configuração.

## `update.sh`

- **Responsabilidade**:  Atualizar componentes do ambiente que já estão instalados ou configurados.
- **Modifica sistema?**: Sim.
- **Depende de**:        core.sh, repositories.sh, installer.sh, ...
- **Funções públicas**:  update_environment, ...
- **Não pertence**:      Primeira configuração de uma máquina.

## `utils.sh`

- **Responsabilidade**:  Fornecer operações pequenas e genéricas que vários módulos precisam usar.
- **Modifica sistema?**: Pode.
- **Depende de**:        log.sh
- **Funções públicas**:  command_exists, file_exists, directory_exists, is_writable, require_command, ask_confirmation
- **Não pertence**:      Lógica específica de Git, instalação, configuração de diretórios, etc.

---
