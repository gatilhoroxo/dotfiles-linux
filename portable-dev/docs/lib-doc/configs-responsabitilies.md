# Responsabilidades dos módulos da lib/configs

## `configs/`

### `colors.sh`

- **Responsabilidade**:  Descrição de cores usadas nos outros scripts.
- **Modifica sistema?**: Não.
- **Depende de**:        Nada.
- **Funções públicas**:  ...
- **Não pertence**:      Instalação, configuração do sistema, apresentação ao usuário.

### `log.sh`

- **Responsabilidade**:  Fornecer uma interface consistente de mensagens para o usuário.
- **Modifica sistema?**: Não.
- **Depende de**:        Nada.
- **Funções públicas**:  log, log_info, log_success, log_warning, log_error, log_debug
- **Não pertence**:      Instalação ou modificação de Arquivos.

### `var.sh`

- **Responsabilidade**:  Fornecer um conjunto de variáveis de valores que é usado repetitivamente no projeto.
- **Modifica sistema?**: Não.
- **Depende de**:        definição da função `find_project_root`.
- **Funções públicas**:  Nenhuma.
- **Não pertence**:      Instalação ou modificação de Arquivos.
