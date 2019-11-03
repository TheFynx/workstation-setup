info ">>> Upgrading System"
sudo pacman -Syyu --noconfirm --needed >/dev/null 2>&1

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
  yay -Sy --noconfirm --noeditmenu --nodiffmenu --needed \
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

info ">>> Installing Packages"
yay -Sy --noconfirm --noeditmenu --nodiffmenu --noprovides --needed \
  jq \
  tree \
  curl \
  wget \
  unzip \
  zip \
  unrar \
  gzip \
  git \
  parallel \
  xclip \
  rsync \
  zsh \
  gst-plugins-bad \
  gst-plugins-base \
  gst-plugins-good \
  gst-plugins-ugly \
  x264 \
  gstreamer-vaapi \
  libcdio \
  libdvdread \
  libdvdcss \
  libdvdnav \
  gst-libav \
  flashplugin \
  pulseaudio-modules-bt-git \
  libldac \
  gnome-calculator \
  gnome-disk-utility \
  blueberry \
  lightdm-gtk-greeter \
  lightdm-gtk-greeter-settings \
  pavucontrol \
  ffmpegthumbnailer \
  ffmpegthumbs \
  gparted \
  cups \
  cups-pk-helper \
  gsfonts \
  splix \
  system-config-printer \
  gtk3-print-backends \
  cups-pdf \
  python-pyqt5 \
  hplip \
  gutenprint \
  foomatic-db \
  foomatic-db-gutenprint-ppds \
  foomatic-db-nonfree \
  foomatic-db-nonfree-ppds \
  foomatic-db-ppds \
  ruby \
  python \
  python-pip \
  go \
  insomnia \
  pyenv \
  rbenv-git \
  ruby-build \
  nodenv \
  nodenv-node-build-git \
  visual-studio-code-bin \
  debtap \
  simplenote-electron-bin \
  etcher-bin \
  clipit \
  pandoc \
  lynx \
  neovim \
  terminator \
  docker \
  vlc \
  diffutils \
  lastpass-cli \
  drawio-desktop \
  influxdb-cli \
  psensor \
  bind-tools \
  saw \
  jetbrains-toolbox \
  vmware-workstation14 \
  vagrant \
  clamtk \
  libu2f-host \
  keybase-gui \
  bzip2 \
  shfmt \
  zbar \
  p7zip \
  terraform \
  packer \
  slack-desktop \
  google-talkplugin \
  ttf-ancient-fonts \
  adobe-source-code-pro-fonts \
  ttf-hack \
  ttf-dejavu \
  ttf-liberation \
  ttf-linux-libertine \
  ttf-bitstream-vera \
  ttf-droid \
  ttf-ubuntu-font-family \
  gnu-free-fonts \
  firefox \
  chromium \
  google-chrome \
  evopop-gtk-theme \
  evopop-icon-theme \
  materia-gtk-theme \
  adwaita-icon-theme \
  papirus-icon-theme-git >/dev/null 2>&1

info ">>> Installing packages for Game Support"
yay -Sy --noconfirm --noeditmenu --nodiffmenu --noprovides --needed \
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
