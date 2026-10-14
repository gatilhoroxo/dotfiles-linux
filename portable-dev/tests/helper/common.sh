#!/usr/bin/env bash

_common_setup() {
  # get the containing directory of this file
  PROJECT_ROOT="$( cd "$( dirname "$BATS_TEST_FILENAME" )/.." >/dev/null 2>&1 && pwd )"
  BATS_HELPER_DIR="$PROJECT_ROOT/tools/submodules/bats_helper"
  BATS_BIN="$PROJECT_ROOT/tools/scripts/run-bats.sh"
  # make executables in src/ visible to PATH
  #PATH="$PROJECT_ROOT/src:$PATH"
    
  load "$BATS_HELPER_DIR/bats-support/load"
  load "$BATS_HELPER_DIR/bats-assert/load"
}
