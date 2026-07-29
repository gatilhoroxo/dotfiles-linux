#!/bin/bash
# ~/.bash-config/aliases/functions.sh

# OBS: testar funções 

# Function which adds an alias to the current shell to a file
function add-alias-things ()
{
   local name=$1 value="$2" file="$3"
   echo alias $name=\'$value\' >> $file
   eval alias $name=\'$value\'
   alias $name
}

# Function which adds an alias to the current shell and to
# the bash_aliases.sh file.
function add-alias ()
{
   local name=$1 value="$2" file="~/.bash-config/aliases/bash_aliases.sh"
   echo alias $name=\'$value\' >> $file
   eval alias $name=\'$value\'
   alias $name
}

# Function which adds an alias to the current shell and to
# the toolz.sh file.
function add-toolz ()
{
   local name=$1 value="$2" file="~/.bash-config/aliases/toolz.sh"
   add-alias-things name value file
}


