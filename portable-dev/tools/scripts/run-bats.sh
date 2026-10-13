
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_PATH_one="$SCRIPT_DIR/../bin/bats"
BIN_PATH_two="$SCRIPT_DIR/../submodules/bats/bin/bats"

if [ -f "$BIN_PATH_one" ]; then
  exec "$BIN_PATH_one" "$@"
elif [ -f "$BIN_PATH_one-bin" ]; then
  exec "$BIN_PATH_one-bin" "$@"
  # ----------------------------------
elif [ -f "$BIN_PATH_two" ]; then
  exec "$BIN_PATH_two" "$@"
fi
