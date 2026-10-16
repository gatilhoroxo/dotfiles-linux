#!/bin/bash
# 
# ESTADO: ok
# 

find_project_root(){
  local temp="$(realpath "${BASH_SOURCE[0]}")"
  temp="$(dirname "$temp")"
  echo "$(dirname "$temp")"
}
