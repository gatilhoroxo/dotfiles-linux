# ~/.bash_config/tools.sh

# editor de texto no terminal
export EDITOR=nano
export LANG=pt_BR.UTF-8

# Exports MSP430
#export PATH=/opt/ti/msp430-gcc/bin:$PATH
export PATH=/usr/local/msp430/bin:$PATH


# --- Configurações de Limpeza da Home (XDG) ---

# RUST (Rustup e Cargo)
export RUSTUP_HOME="$HOME/.local/share/rustup"
export CARGO_HOME="$HOME/.local/share/cargo"
# Adiciona os binários do Cargo ao PATH (para os comandos funcionarem)
export PATH="$CARGO_HOME/bin:$PATH"

# DOTNET
# Define onde o .dotnet armazena ferramentas e caches globais
export DOTNET_CLI_HOME="$HOME/.local/share/dotnet"
# Opcional: Se você usa ferramentas globais do dotnet, adicione ao PATH:
export PATH="$HOME/.local/share/dotnet/tools:$PATH"

