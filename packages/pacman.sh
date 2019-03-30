info ">>> Upgrading System"
sudo pacman -Syyu --noconfirm > /dev/null 2>&1

info ">>> Installing Packages"
sudo pacman -Sy --needed --noconfirm yay

yay -S --noconfirm \
  simplenote-electron-bin \
  slack-desktop \
  gitkraken \
  spotify \
  zoom \
  insomnia \
  pyenv \
  rbenv-git \
  ruby-build \
  nodenv \
  lightdm-slick-greeter \
  google-talkplugin \
  nodenv-node-build-git \
  ttf-ancient-fonts \
  postman\
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
  clamtk \
  libu2f-host \
  keybase-gui \
  bzip2 \
  shfmt \
  zbar \
  ttf-hack \
  adobe-source-code-pro-fonts > /dev/null 2>&1
