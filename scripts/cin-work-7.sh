# início
set -e
mkdir ~/develop && cd ~/develop
git clone https://github.com/gatilhoroxo/dotfiles-linux.git

# mudando a configuração do terminal
cp -r dotfiles-linux/distros/base/.bash-config ~/
cp dotfiles-linux/distros/base/.bashrc ~/
source ~/.bashrc

# instalando rust do zero 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -y
#instalando platformio
curl -fsSL -o get-platformio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py
python3 get-platformio.py
echo "export PATH=$PATH:$HOME/.local/bin" >> ~/.bash-config/aliases/exports.sh


code dotfiles-linux

# preparação
mkdir ~/files
tools_dir="$HOME/files/tools"
alias_file="$tools_dir/tools-aliases.bash"
mkdir $tools_dir && touch $alias_file

# configurando o git cli
mkcd $tools_dir/gh-dir
wget -c "https://github.com/cli/cli/releases/download/v2.63.0/gh_2.63.0_linux_amd64.tar.gz" -O gh.tar.gz || return 1
tar -xvf gh.tar.gz > /dev/null
mv gh_*/* .
rm gh.tar.gz && rmdir gh_*
echo "alias gh='$tools_dir/gh-dir/bin/gh'" >> $alias_file

# configurando o vivaldi
mkcd $tools_dir/vivaldi-dir
wget -c "https://downloads.vivaldi.com/stable/vivaldi-stable_7.9.3970.45-1_amd64.deb" -O vivaldi.deb || return 1
ar p vivaldi.deb data.tar.xz | tar xJ --strip 2 ./opt/vivaldi
rm vivaldi.deb
echo "alias vivaldi='$tools_dir/vivaldi-dir/vivaldi/vivaldi --no-sandbox --user-data-dir=$tools_dir/vivaldi-dir/perfil --disable-gpu > /dev/null 2>&1 &'" >> "$alias_file"

# configurando o obsidian
mkcd $tools_dir/obsidian-dir
wget -c "https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.7/Obsidian-1.6.7.AppImage" -O obsidian.AppImage || return 1
chmod +x obsidian.AppImage  && ./obsidian.AppImage --appimage-extract > /dev/null
mv squashfs-root/* .
rm obsidian.AppImage && rmdir squashfs-root
echo "alias obsidian=\"$tools_dir/obsidian-dir/obsidian --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$alias_file"

# configurando o todoist
mkcd $tools_dir/todoist-dir
wget -c "https://github.com/todoist/todoist-linux/releases/download/v2.6.3/Todoist-2.6.3.AppImage" -O todoist.AppImage || return 1
chmod +x todoist.AppImage && ./todoist.AppImage --appimage-extract > /dev/null
mv squashfs-root/* . 
rm todoist.AppImage && rmdir squashfs-root
echo "alias todoist=\"$tools_dir/todoist-dir/todoist --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$alias_file"

# configurando o bitwarden
mkcd $tools_dir/bitwarden-dir
wget -c "https://github.com/bitwarden/desktop/releases/download/v1.29.1/Bitwarden-1.29.1.AppImage" -O bitwarden.AppImage || return 1
chmod +x bitwarden.AppImage && ./bitwarden.AppImage --appimage-extract > /dev/null
mv squashfs-root/ .
rm bitwarden.AppImage && rmdir squashfs-root
echo "alias bitwarden=\"$tools_dir/bitwarden-dir/bitwarden-files/Bitwarden --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$alias_file"

