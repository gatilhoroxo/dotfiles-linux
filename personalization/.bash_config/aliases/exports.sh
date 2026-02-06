# ~/.bash_config/tools.sh

# editor de texto no terminal
export EDITOR=nano
export LANG=pt_BR.UTF-8

# Exports MSP430
#export PATH=/opt/ti/msp430-gcc/bin:$PATH
export PATH=/usr/local/msp430/bin:$PATH


# --- Configurações de Limpeza da Home (XDG) ---

# --- RUST ---
export RUSTUP_HOME="$HOME/.local/share/rustup"

# RubyGems
export GEM_HOME="$HOME/.local/share/gems"
export GEM_PATH="$GEM_HOME"
export PATH="$GEM_HOME/bin:$PATH"

# FLY.io
export FLYCTL_INSTALL="$HOME/.config/fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# de configuração de arquivos para simplificar o home
export XDG_CONFIG_HOME="$HOME/.local/config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.local/cache"
export XDG_STATE_HOME="$HOME/.local/state"

