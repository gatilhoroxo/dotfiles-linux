#!/bin/bash
# ~/.bash-config/functions/dev.sh

#setando um usuario git
function setUserGit()
{
  if [ -z "$1" && -z "$2" ]; then
    echo "Uso: setUserGit "Nome" "email" [--global]"
  elif [ "$3" == "--global" ]; then
    git config --global user.name "$1"
    git config --global user.email "$2"
    echo "Git global configurado para: $1 <$2>"
  else 
    git config user.name "$1"
    git config user.email "$2"
    echo "Git local configurado para: $1 <$2>"
  fi 
}

# Mostra seu IP local e IP público
# Uso: myip
function myip() 
{
  echo "IP Local: $(hostname -I | cut -d' ' -f1)"
  echo "IP Público: $(curl -s ifconfig.me)"
}

# === Para testar ===

function psgrep()
{
	ps -aux | grep $1 | grep -v grep
}

function pskill()
{
	local pid

	pid=$(ps -ax | grep $1 | grep -v grep | awk '{ print $1 }')
	echo -n "killing $1 (process $pid)..."
	kill -9 $pid
	echo "slaughtered."
}
 
# "repeat" command.  Like:
#	repeat 10 echo foo
function repeat ()
{ 
  local count="$1" i;
  shift;
  for i in $(_seq 1 "$count");
  do
    eval "$@";
  done
}

# Subfunction needed by `repeat'.
function _seq ()
{ 
  local lower upper output;
  lower=$1 upper=$2;

  if [ $lower -ge $upper ]; then return; fi
  while [ $lower -lt $upper ];
  do
    echo -n "$lower "
      lower=$(($lower + 1))
  done
  echo "$lower"
}

