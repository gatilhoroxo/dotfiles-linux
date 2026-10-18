#!/bin/bash
#

EXEC_PATH="$HOME/.local/bin"

#readonly INSTALL_ROOT="$HOME/.local/share/portable-dev"
#readonly INSTALL_BIN="$HOME/.local/bin/mdev"

#PROJECT_ROOT="$(find_project_root)"
readonly LIB_DIR="$PROJECT_ROOT/lib"
readonly CONFIGS_DIR="$LIB_DIR/configs"
readonly ENGINE_DIR="$LIB_DIR/engine"
readonly UTILS_DIR="$LIB_DIR/utils"

readonly STATE_DIR="$PROJECT_ROOT/state"
readonly TOOLS_DIR="$PROJECT_ROOT/tools"


readonly CONFIG_DIR="$PROJECT_ROOT/config"
  # ou em ~/.config/portable-dev
readonly CACHE_DIR="$PROJECT_ROOT/cache"
  # ou em ~/.cache/portable-dev


readonly DIAGNOSTIC_FILE="$STATE_DIR/doctor/latest.json"
