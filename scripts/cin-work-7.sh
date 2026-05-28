# início
set -e
mkdir ~/develop && cd ~/develop
git clone https://github.com/gatilhoroxo/dotfiles-linux.git

# mudando a configuração do terminal
cp -r dotfiles-linux/distros/base/.bash-config ~/
cp dotfiles-linux/distros/base/.bashrc ~/
source ~/.bashrc

# instalando rust do zero 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#instalando platformio
curl -fsSL -o get-platformio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py
python3 get-platformio.py
echo "export PATH=$PATH:$HOME/.local/bin" >> ~/.bash-config/aliases/exports.sh

# code dotfiles-linux

# preparação
mkdir ~/files
alias_file="$HOME/files/tools/alias-tools.sh"
mkdir $HOME/files/tools && touch $alias_file

# configurando o git cli
mkcd $HOME/files/tools/gh-dir
wget -c "https://github.com/cli/cli/releases/download/v2.63.0/gh_2.63.0_linux_amd64.tar.gz" -O gh.tar.gz || return 1
tar -xvf gh.tar.gz > /dev/null
rm gh.tar.gz 
echo "alias gh='$HOME/files/tools/gh-dir/gh_2.63.0_linux_amd64/bin/gh'" >> $alias_file

# configurando o obsidian
mkcd $HOME/files/tools/obsidian-dir
wget -c "https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.7/Obsidian-1.6.7.AppImage" -O obsidian.AppImage || return 1
chmod +x obsidian.AppImage  && ./obsidian.AppImage --appimage-extract > /dev/null
mv squashfs-root/* .
rm obsidian.AppImage && rmdir squashfs-root
echo "alias obsidian=\"$HOME/files/tools/obsidian-dir/obsidian --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$alias_file"

# configurando o vivaldi
mkcd $HOME/files/tools/vivaldi-dir
wget -c "https://downloads.vivaldi.com/stable/vivaldi-stable_7.9.3970.45-1_amd64.deb" -O vivaldi.deb || return 1
ar p vivaldi.deb data.tar.xz | tar xJ --strip 2 ./opt/vivaldi
rm vivaldi.deb
echo "alias vivaldi=\"$HOME/files/tools/vivaldi-dir/vivaldi/vivaldi --no-sandbox --user-data-dir=$tools_dir/vivaldi-dir/perfil --disable-gpu > /dev/null 2>&1 &\"" >> "$alias_file"

# configurando o todoist
mkcd $HOME/files/tools/todoist-dir
wget -c "https://github.com/todoist/todoist-linux/releases/download/v2.6.3/Todoist-2.6.3.AppImage" -O todoist.AppImage || return 1
chmod +x todoist.AppImage && ./todoist.AppImage --appimage-extract > /dev/null
mv squashfs-root/* . 
rm todoist.AppImage && rmdir squashfs-root
echo "alias todoist=\"$HOME/files/tools/todoist-dir/todoist --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$alias_file"

# configurando o bitwarden
mkcd $HOME/files/tools/bitwarden-dir
wget -c "https://github.com/bitwarden/desktop/releases/download/v1.29.1/Bitwarden-1.29.1.AppImage" -O bitwarden.AppImage || return 1
chmod +x bitwarden.AppImage && ./bitwarden.AppImage --appimage-extract > /dev/null
mv squashfs-root/ .
rm bitwarden.AppImage && rmdir squashfs-root
echo "alias bitwarden=\"$HOME/files/tools/bitwarden-dir/bitwarden-files/Bitwarden --no-sandbox --disable-gpu > /dev/null 2>&1 &\"" >> "$alias_file"

