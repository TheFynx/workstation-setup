if [ -z "$(command -v snap)" ]; then
    if [ "${PKG}" == "apt" ]; then
      sudo apt -y install snapd > /dev/null 2>&1 || warning ">>> Failed to install Snapcraft using ${PKG}"
      sudo systemctl enable snapd
      sudo systemctl start snapd
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
    if [ "${PKG}" == "apt" ]; then
      sudo snap install postman \
        simplenote > /dev/null 2>&1
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
