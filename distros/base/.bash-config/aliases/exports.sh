# ~/.bash_config/tools.sh

# editor de texto no terminal
export EDITOR=nano
export LANG=pt_BR.UTF-8

# de configuração de arquivos para simplificar o home
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# --- Exports de Ferramentas ---
export CARGO_HOME="$HOME/.local/storage/dev/.cargo"
export RUSTUP_HOME="$HOME/.local/storage/dev/.rustup"
export PATH="$CARGO_HOME/bin:$PATH"

. $HOME/.local/storage/dev/.cargo/env

export VSCODE_EXTENSIONS="$HOME/.local/storage/dev/.vscode"

# Exports MSP430
#export PATH=/opt/ti/msp430-gcc/bin:$PATH
export PATH=/usr/local/msp430/bin:$PATH


# --- Configurações de Limpeza da Home (XDG) ---

# RubyGems
export GEM_HOME="$HOME/.local/share/gems"
export GEM_PATH="$GEM_HOME"
export PATH="$GEM_HOME/bin:$PATH"

# FLY.io
export FLYCTL_INSTALL="$HOME/.config/fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"


