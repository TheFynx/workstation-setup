info ">>> Upgrading System"
sudo pacman -Syyu --noconfirm >/dev/null 2>&1

info ">>> Prepping Package Install"
if [ -z "$(command -v yay)" ]; then
  info ">>> Installing YAY"
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
else
  info ">>> YAY Already installed"
fi

info ">>> Installing base packages"
yay -Sy --noconfirm --noeditmenu --nodiffmenu \
  simplenote-electron-bin \
  slack-desktop \
  etcher-bin \
  insomnia \
  pyenv \
  rbenv-git \
  ruby-build \
  nodenv \
  nodenv-node-build-git \
  debtap \
  google-talkplugin \
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
  visual-studio-code-bin \
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
  influxdb-cli \
  evopop-gtk-theme \
  evopop-icon-theme \
  adobe-source-code-pro-fonts >/dev/null 2>&1
