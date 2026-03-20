# ~/.bash-config/history.sh

# Não colocar linhas duplicadas ou que comecem com espaço no histórico
export HISTCONTROL="ignoreboth"
export HISTIGNORE="ls:cd:pwd:history:clear"
export HISTFILE="$HOME/.local/storage/shell/.bash_history"

# Adicionar ao arquivo de histórico, não sobrescrever
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
