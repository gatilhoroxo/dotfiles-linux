#!/bin/bash
# 
# ESTADO: ok
# 

find_project_root(){
  local temp="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
  echo "$(dirname "$temp")"
}
