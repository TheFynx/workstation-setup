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

info ">>> Removing uneeded packages"
yay -Rcu --noconfirm \
  plank \
  variety \
  vivaldi \
  sublime-text-dev \
  qbittorrent \
  meld \
  pragha \
  glxinfo \
  atom >/dev/null 2>&1

if [ -n "${CINNAMON_DESKTOP}" ]; then
  info ">>> Setting up Cinnamon Desktop"
  yay -Sy --noconfirm --noeditmenu --nodiffmenu \
    gdm \
    cinnamon \
    nemo-fileroller \
    nemo-preview \
    gnome-screenshot \
    gedit \
    gnome-terminal \
    gnome-control-center \
    gnome-system-monitor \
    gnome-schedule \
    gnome-power-manager \
    mintlocale >/dev/null 2>&1
  sudo cp -fv /etc/X11/xinit/xinitrc ${USER_HOME}/.xinitrc >/dev/null 2>&1
  chown -R ${USER}:users ${USER_HOME}/.xinitrc >/dev/null 2>&1
  echo -e "exec cinnamon-session" >> ${USER_HOME}/.xinitrc >/dev/null 2>&1
  systemctl enable gdm >/dev/null 2>&1
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
  tree \
  parallel \
  lastpass-cli \
  drawio-desktop \
  influxdb-cli \
  evopop-gtk-theme \
  evopop-icon-theme \
  materia-gtk-theme \
  psensor \
  bind-tools \
  jetbrains-toolbox \
  vmware-workstation14 \
  adobe-source-code-pro-fonts >/dev/null 2>&1

info ">>> Installing packages for Game Support"
yay -Sy --noconfirm --noeditmenu --nodiffmenu \
  ttf-ms-fonts \
  lib32-gnutls \
  lib32-libldap \
  lib32-libgpg-error \
  lib32-sqlite \
  lib32-libpulse \
  lib32-libxml2 \
  lib32-alsa-plugins \
  lib32-sdl2 \
  lib32-freetype2 \
  lib32-dbus \
  lib32-libgcrypt \
  libgcrypt \
  mono \
  wine-mono \
  eog \
  pywinery \
  vulkan-icd-loader \
  lib32-vulkan-icd-loader \
  lutris \
  steam >/dev/null 2>&1

