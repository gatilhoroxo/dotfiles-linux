# Responsabilidades dos módulos da lib

## `capabilities.sh`

- **Responsabilidade**:  Detectar capacidades disponíveis no ambiente.
- **Modifica sistema?**: Não.
- **Depende de**:        core.sh, utils.sh
- **Funções públicas**:  has_sudo, has_docker, has_kvm, has_git
- **Não pertence**:      Instalação, Alteração de arquivos, Mensagens de apresentação

## `clean.sh`
- **Responsabilidade**:  Remover arquivos temporários e caches gerados pelo Portable Dev sem remover dados de usuário.
- **Modifica sistema?**: a
- **Depende de**:        a
- **Funções públicas**:  a
- **Não pertence**:      a

## `core.sh`
- **Responsabilidade**:  Infraestrutura básica sobre a qual os outros módulos vivem. 
- **Modifica sistema?**: Não. 
- **Depende de**:        Nada. 
- **Funções públicas**:  ...
- **Não pertence**:      Instalação, Alteração de arquivos, Mensagens de apresentação. 

## `directories.sh`
- **Responsabilidade**:  Garantir uma determinada estrutra de diretórios
- **Modifica sistema?**: Sim. 
- **Depende de**:        core.sh, utils.sh
- **Funções públicas**:  ...
- **Não pertence**:      Instalação. 

## `doctor.sh`
- **Responsabilidade**:  Coletar e apresentar informações sobre o estado e capacidades relevantes da máquina. 
- **Modifica sistema?**: Não. 
- **Depende de**:        core.sh, utils.sh
- **Funções públicas**:  ...
- **Não pertence**:      ...

## `git.sh`
- **Responsabilidade**:  Fornecer operações genéricas relacionadas a repositórios Git.
- **Modifica sistema?**: Sim. 
- **Depende de**:        a
- **Funções públicas**:  a
- **Não pertence**:      a

## `installer.sh`
- **Responsabilidade**:  Garantir algumas ferramentas ausentes disponíveis. 
- **Modifica sistema?**: Sim. 
- **Depende de**:        capabilities.sh, packages.sh, ...
- **Funções públicas**:  ...
- **Não pertence**:      ...

## `log.sh`
- **Responsabilidade**:  Como informar algo para o usuário. 
- **Modifica sistema?**: Não
- **Depende de**:        Nada. 
- **Funções públicas**:  log_info, log_success, log_warning, log_error, log_debug
- **Não pertence**:      Instalação, Modificação de Arquivos. 

## `packages.sh`
- **Responsabilidade**:  Ver quais ferramentas o ambiente deseja (system, portable, cointainer). 
- **Modifica sistema?**: Não. 
- **Depende de**:        core.sh, utils.sh
- **Funções públicas**:  ...
- **Não pertence**:      Instalação. 

## `repositories.sh`
- **Responsabilidade**:  Garantir a existência de certos repositórios. 
- **Modifica sistema?**: Sim?
- **Depende de**:        core.sh, utils.sh, git.sh
- **Funções públicas**:  ...
- **Não pertence**:      ...

## `shell.sh`
- **Responsabilidade**:  Preparar uma sessão de shell para o ambiente do usuário. 
- **Modifica sistema?**: Sim (temporariamente, durante a sessão atual). 
- **Depende de**:        core.sh, utils.sh, ...
- **Funções públicas**:  ...
- **Não pertence**:      Instalação. 

## `update.sh`
- **Responsabilidade**:  Atualizar componentes do ambiente que já estão instalados ou configurados.
- **Modifica sistema?**: a
- **Depende de**:        a
- **Funções públicas**:  a
- **Não pertence**:      a

## `utils.sh`
- **Responsabilidade**:  Tem algumas operações pequenas e genéricas que vários módulos precisam. 
- **Modifica sistema?**: ?
- **Depende de**:        ?
- **Funções públicas**:  command_exists, file_exists, directory_exists, is_writable, require_command, ask_confirmation
- **Não pertence**:      a

