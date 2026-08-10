
# for fun to watch movies and series
install_stremio(){
  sudo apt install flatpak -y
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  flatpak install flathub com.stremio.Stremio
  flatpak run com.stremio.Stremio
}

