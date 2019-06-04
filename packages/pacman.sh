info ">>> Upgrading System"
sudo pacman -Syyu --noconfirm >/dev/null 2>&1

info ">>> Installing Packages"
if [ -z "$(command -v yay)" ]; then
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
fi

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
  clipit \
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
  cups \
  jq \
  lastpass-cli \
  drawio-desktop \
  adobe-source-code-pro-fonts >/dev/null 2>&1

info ">>> Cleaning up uneeded files"
yay -Rscn --noconfirm \
  gnome-extra \
  gnome-builder \
  gnome-boxes \
  ghex \
  glade \
  accerciser \
  rygel \
  tali \
  devhelp \
  evolution \
  evolution-data-server >/dev/null 2>&1
