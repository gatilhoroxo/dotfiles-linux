# Responsabilidades dos módulos da lib

## `lib/*`

### `configs/`

- **Responsabilidade**:  ...
- **Modifica sistema?**: ...
- **Depende de**:        ...
- **Não pertence**:      ...

### `engine/`

- **Responsabilidade**:  ...
- **Modifica sistema?**: ...
- **Depende de**:        ...
- **Não pertence**:      ...

### `utils/`

- **Responsabilidade**:  ...
- **Modifica sistema?**: ...
- **Depende de**:        ...
- **Não pertence**:      ...


### `capabilities.sh`

- **Responsabilidade**:  Detectar capacidades disponíveis no ambiente.
- **Modifica sistema?**: Não.
- **Depende de**:        core.sh, utils.sh
- **Funções públicas**:  has_sudo, has_docker, has_kvm, has_git
- **Não pertence**:      Instalação, alteração de arquivos, apresentação de diagnóstico.

### `directories.sh`

- **Responsabilidade**:  Garantir uma determinada estrutra de diretórios
- **Modifica sistema?**: Sim.
- **Depende de**:        core.sh, filesystem.sh, configuração de diretórios
- **Funções públicas**:  main_directories, , ...
- **Não pertence**:      Instalação de ferramentas, operações Git.

### `main.sh` [ TODO reescrever esses campos ]

- **Responsabilidade**:  Infraestrutura básica sobre a qual os outros módulos vivem.
- **Modifica sistema?**: Não.
- **Depende de**:        colors.sh, log.sh
- **Funções públicas**:  ...
- **Não pertence**:      Instalação, configuração do sistema, apresentação ao usuário.

### `packages.sh`

- **Responsabilidade**:  Descrever e consultar quais ferramentas o ambiente deseja, classificadas por métodos/tipo de instalação (system, portable, cointainer).
- **Modifica sistema?**: Não.
- **Depende de**:        core.sh, utils.sh, configuração de pacotes
- **Funções públicas**:  get_packages, get_packages_by_type
- **Não pertence**:      Instalação das ferramentas.

### `repositories.sh`

- **Responsabilidade**:  Garantir a existência de repositórios definidos pela configuração.
- **Modifica sistema?**: Sim.
- **Depende de**:        core.sh, utils.sh, git.sh
- **Funções públicas**:  ensure_repository, ensure_repositories
- **Não pertence**:      Implementar operações Git genéricas.

### `shell.sh`

- **Responsabilidade**:  Preparar uma sessão atual do shell para o uso do ambiente.
- **Modifica sistema?**: Não permanentemente; muda a sessão atual.
- **Depende de**:        core.sh, utils.sh
- **Funções públicas**:  setup_session, setup_dev_environment
- **Não pertence**:      Instalação permanente de ferramentas ou alteração arbitrária de arquivos de configuração.

### `utils.sh`

- **Responsabilidade**:  Fornecer operações pequenas e genéricas que vários módulos precisam usar.
- **Modifica sistema?**: Pode.
- **Depende de**:        log.sh
- **Funções públicas**:  command_exists, file_exists, directory_exists, is_writable, require_command, ask_confirmation
- **Não pertence**:      Lógica específica de Git, instalação, configuração de diretórios, etc.

---
