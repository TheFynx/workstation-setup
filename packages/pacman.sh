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
PACKAGES_TO_REMOVE="variety sublime-text-dev meld thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman pulseaudio-bluetooth"
for package in $PACKAGES_TO_REMOVE; do
  yay -Rcu --noconfirm $package >/dev/null 2>&1
done

if [ -n "${CINNAMON_DESKTOP}" ]; then
  info ">>> Setting up Cinnamon Desktop"
  yay -Syy --noconfirm --noeditmenu --nodiffmenu --needed \
    gdm \
    cinnamon \
    nemo-fileroller \
    nemo-preview \
    gnome-screenshot \
    gedit \
    lightdm-gtk-greeter \
    lightdm-gtk-greeter-settings \
    gnome-terminal \
    gnome-control-center \
    gnome-system-monitor \
    gnome-schedule \
    gnome-power-manager \
    mintlocale >/dev/null 2>&1
  sudo cp -fv /etc/X11/xinit/xinitrc ${USER_HOME}/.xinitrc >/dev/null 2>&1
  chown -R ${USER}:users ${USER_HOME}/.xinitrc >/dev/null 2>&1
  echo -e "exec cinnamon-session" >>${USER_HOME}/.xinitrc >/dev/null 2>&1
  systemctl enable gdm >/dev/null 2>&1
fi

info ">>> Installing Packages"
yay -Syy --noconfirm --noeditmenu --nodiffmenu --noprovides --needed \
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
  fd \
  exa \
  jre10-openjdk \
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
  gnome-calculator \
  gnome-disk-utility \
  blueberry \
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
  pyenv \
  pandoc \
  lynx \
  neovim \
  terminator \
  docker \
  vlc \
  diffutils \
  lastpass-cli \
  psensor \
  bind-tools \
  vagrant \
  clamtk \
  libu2f-host \
  libfido2 \
  keybase-gui \
  bzip2 \
  shfmt \
  zbar \
  p7zip \
  adobe-source-code-pro-fonts \
  ttf-hack \
  ttf-dejavu \
  ttf-liberation \
  ttf-linux-libertine \
  ttf-bitstream-vera \
  ttf-droid \
  ttf-ubuntu-font-family \
  gnu-free-fonts \
  powerline-fonts \
  materia-gtk-theme \
  adwaita-icon-theme >/dev/null 2>&1

## AUR Specific Packages
info ">>> Installing AUR Packages"
yay -Syy --noconfirm --noeditmenu --nodiffmenu --noprovides --needed \
  pulseaudio-modules-bt-git \
  libldac \
  insomnia \
  rbenv-git \
  ruby-build \
  nodenv \
  nodenv-node-build-git \
  visual-studio-code-bin \
  debtap \
  simplenote-electron-bin \
  etcher-bin \
  clipit \
  #influxdb-cli \
  saw \
  jetbrains-toolbox \
  vmware-workstation14 \
  slack-desktop \
  google-talkplugin \
  ttf-ancient-fonts \
  brave-bin \
  hstr \
  powerline-go-bin \
  google-chrome \
  evopop-gtk-theme \
  evopop-icon-theme \
  papirus-icon-theme-git >/dev/null 2>&1

info ">>> Installing packages for Game Support"
yay -Syy --noconfirm --noeditmenu --nodiffmenu --noprovides --needed \
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
  vulkan-icd-loader \
  lib32-vulkan-icd-loader \
  lutris \
  steam >/dev/null 2>&1

## AUR Specific Packages
info ">>> Installing AUR Game Support Packages"
yay -Syy --noconfirm --noeditmenu --nodiffmenu --noprovides --needed \
  pywinery \
  protontricks-git \
  ttf-ms-fonts >/dev/null 2>&1
