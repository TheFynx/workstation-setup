info ">>> Upgrading System"
sudo pacman -Syyu > /dev/null 2>&1

info ">>> Installing Packages"
sudo pacman -Sy --noconfirm \
    curl \
    wget \
    unzip \
    git \
    ruby \
    python \
    python-pip \
    go \
    xclip \
    parcellite \
    pandoc \
    lynx \
    neovim \
    terminator \
    docker \
    docker-compose \
    rsync \
    zsh \
    materia-gtk-theme \
    deepin-gtk-theme \
    arc-gtk-theme \
    diffutils \
    chromium \
    vlc \
    code \
    terraform \
    packer \
    vagrant \
    yaourt \
    keybase-gui \
    bzip2

info ">>> Installing AUR Packages"
yaourt -Sy \
  simplenote-electron-bin \
  slack-desktop \
  gitkraken \
  spotify \
  zoom \
  insomnia \
  pyenv \
  rbenv \
  postman