if [ -z "$(command -v snap)" ]; then
    if [ "${PKG}" == "apt" ]; then
        sudo apt -y install snapd > /dev/null 2>&1 || warning ">>> Failed to install Snapcraft using ${PKG}"
    elif [ "${OS}" == "fedora" ]; then
        sudo dnf install -y snapd > /dev/null 2>&1  || warning ">>> Failed to install Snapcraft using ${PKG}"
        sudo ln -s /var/lib/snapd/snap /snap || warning ">>> Failed to create snap bin link"
    elif [ "${OS}" == "arch" ]; then
        yaourt -Sy snapd > /dev/null 2>&1  || warning ">>> Failed to install Snapcraft using ${PKG}"
        sudo systemctl enable --now snapd.socket > /dev/null 2>&1 || warning ">>> Failed to enable Snapcraft"
    else
        warning ">>> Cannot install snapcraft"
    fi
fi

if [ -n "$(command -v snap)" ]; then
    sudo snap install postman \
        wavebox \
        google-play-music-desktop-player \
        docker \
        insomnia \
        vlc \
        simplenote \
        chromium > /dev/null 2>&1

    sudo snap install --classic slack > /dev/null 2>&1
    sudo snap install --classic aws-cli > /dev/null 2>&1
    info ">>> Snaps installed succesfully"
else
    warning ">>> Snapcraft not installed, cannot install snaps"
fi