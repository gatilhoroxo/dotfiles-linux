# Responsabilidades dos módulos da lib/utils

## `utils/`

### `archive.sh`

- **Responsabilidade**:  ...
- **Modifica sistema?**: ...
- **Depende de**:        ...
- **Funções públicas**:  ...
- **Não pertence**:      ...

### `command.sh`

- **Responsabilidade**:  Funções para ver sobre os comandos.
- **Modifica sistema?**: Não.
- **Depende de**:        Nada.
- **Funções públicas**:  ...
- **Não pertence**:      Instalação, alteração de arquivos, apresentação ao usuário.

### `filesystem.sh`

- **Responsabilidade**:  Funções para lidar com arquivos do sistema.
- **Modifica sistema?**: Sim.
- **Depende de**:        core.sh, log.sh
- **Funções públicas**:  ensure_directory, ensure_directories, ...
- **Não pertence**:      Instalação de ferramentas, operações Git.

### `git.sh`

- **Responsabilidade**:  Fornecer operações genéricas relacionadas a repositórios Git.
- **Modifica sistema?**: Sim (com o clone ou pull).
- **Depende de**:        core.sh, utils.sh
- **Funções públicas**:  is_git_repository, clone_repository, pull_repsitory, ...
- **Não pertence**:      Decidir quais repositórios o ambiente deve possuir.
