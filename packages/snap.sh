if [ -z "$(command -v snap)" ]; then
    if [ "${PKG}" == "apt" ]; then
      sudo apt-get -y install snapd > /dev/null 2>&1 || warning ">>> Failed to install Snapcraft using ${PKG}"
      sudo systemctl enable snapd
      sudo systemctl start snapd
    elif [ "${OS}" == "fedora" ]; then
      sudo dnf install -y snapd > /dev/null 2>&1 || warning ">>> Failed to install Snapcraft using ${PKG}"
      sudo ln -s /var/lib/snapd/snap /snap || warning ">>> Failed to create snap bin link"
    elif [ "${PKG}" == "pacman" ]; then
      #yaourt -Sy --needed --noconfirm snapd-git > /dev/null 2>&1 || warning ">>> Failed to install Snapcraft using ${PKG}"
    else
      warning ">>> Cannot install snapcraft"
    fi
fi

if [ -n "$(command -v snap)" ]; then
    if [ "${PKG}" == "apt" ]; then
      sudo snap install postman \
        simplenote > /dev/null 2>&1
    elif [ "${PKG}" == "pacman" ]; then
      #sudo snap install --devmode --beta anbox > /dev/null 2>&1
    else
      sudo snap install postman \
          insomnia \
          vlc \
          simplenote > /dev/null 2>&1
    fi
    info ">>> Snaps installed succesfully"
else
    warning ">>> Snapcraft not installed, cannot install snaps"
fi
