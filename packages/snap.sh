if [ -z "$(command -v snap)" ]; then
    if [ "${PKG}" == "apt" ]; then
        sudo apt -y install snapd
    elif [ "${OS}" == "fedora" ]; then
        sudo dnf install -y snapd
        sudo ln -s /var/lib/snapd/snap /snap
    elif [ "${OS}" == "arch" ]; then
        yaourt -Sy snapd
        sudo systemctl enable --now snapd.socket
    else
        warning ">>> Cannot install snapcraft"
    fi
fi

if [ -n "$(command -v snap)" ]; then
    sudo snap install \
    postman \
    wavebox \
    slack \
    google-play-music-desktop-player \
    aws-cli \
    docker \
    insomnia \
    vlc \
    simplenote \
    slack
fi