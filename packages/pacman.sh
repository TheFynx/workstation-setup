info ">>> Upgrading System"
sudo pacman -Syyu --noconfirm >/dev/null 2>&1

info ">>> Installing Packages"
sudo pacman -Sy --needed --noconfirm yay

yay -Sy --noconfirm --noeditmenu --nodiffmenu \
  simplenote-electron-bin \
  slack-desktop \
  zoom \
  insomnia \
  pyenv \
  rbenv-git \
  ruby-build \
  nodenv \
  nodenv-node-build-git \
  debtap \
  google-talkplugin \
  nodenv-node-build-git \
  ttf-ancient-fonts \
  curl \
  wget \
  unzip \
  git \
  ruby \
  python \
  python-pip \
  go \
  xclip \
  gpaste \
  pandoc \
  lynx \
  neovim \
  terminator \
  docker \
  docker-compose \
  rsync \
  zsh \
  materia-gtk-theme \
  arc-gtk-theme \
  diffutils \
  chromium \
  vlc \
  code \
  vagrant \
  clamtk \
  libu2f-host \
  keybase-gui \
  bzip2 \
  shfmt \
  zbar \
  ttf-hack \
  saw \
  drawio-desktop \
  adobe-source-code-pro-fonts >/dev/null 2>&1
