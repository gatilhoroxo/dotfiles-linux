# --- Caminhos base ---
export INSTALL_DIR="$HOME/files/tools"
export ALIAS_FILE="$INSTALL_DIR/tools-aliases.bash"
export BASH_ALIASES="$HOME/.bash_config/aliases/exports.sh"
export BLACK_WHOLE="/dev/null"

# --- Flags de instalação (beginUser) ---
INSTALL_SYSTEM_BASE=true        # GRUB, atualizações, GNOME tweaks
INSTALL_PRODUCTIVITY=true       # Bitwarden, Flatpak, Obsidian, Todoist
INSTALL_DEV_COMPILERS=true      # GCC, G++, GDB, Valgrind, Clang, Make
INSTALL_LANGUAGES=true          # Python, Java, Rust
INSTALL_DEV_TOOLS=true          # Git, GitHub CLI, Qt Framework
INSTALL_ELECTRONICS=true        # KiCad, Arduino, PlatformIO, Octave, Gnuplot
INSTALL_CONTAINERS=true         # Docker, Docker Compose
INSTALL_LATEX=true              # TeXLive, TeXStudio, xclip
INSTALL_BROWSER=true            # Google Chrome
SETUP_DIRECTORIES=true          # Criar estrutura ~/dev e ~/tools

# --- Admin ---
IS_ADMIN=""
