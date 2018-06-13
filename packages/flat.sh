if [ -z "$(command -v flatpak)" ]; then
    if [ "${OS}" == "solus" ]; then
        sudo eopkg it -y flatpak xdg-desktop-portal-gtk
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    elif [ "${PKG}" == "apt" ]; then
        sudo add-apt-repository ppa:alexlarsson/flatpak
        sudo apt update
        sudo apt install -y flatpak
        sudo apt install gnome-software-plugin-flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    elif [ "${OS}" == "arch" ]; then
        sudo pacman -Sy flatpak
    else
        warning ">>> Cannot install flatpak"
    fi
fi

if [ -n "$(command -v flatpak)" ]; then
    flatpak install flathub \
        us.zoom.Zoom \
        com.visualstudio.code
fi