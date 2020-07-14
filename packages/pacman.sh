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
PACKAGES_TO_REMOVE="variety arcolinux-variety-git sublime-text-dev meld thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman firefox chromium termite xfce-terminal"
for package in $PACKAGES_TO_REMOVE; do
  info ">>> Removing ${package}"
  yay -Rcu --noconfirm $package >/dev/null 2>&1 || info ">>> ${package} not found"
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
  libreoffice-fresh \
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
  pavucontrol \
  ffmpegthumbnailer \
  ffmpegthumbs \
  gparted \
  python-pyqt5 \
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
  flameshot \
  ts-node \
  breeze \
  yarn \
  gnome-keyring \
  materia-gtk-theme >/dev/null 2>&1

## AUR Specific Packages
info ">>> Installing AUR Packages"
yay -Syy --noconfirm --noeditmenu --nodiffmenu --noprovides --needed \
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
  spotify \
  saw \
  slack-desktop \
  brave-bin \
  google-chrome \
  starship \
  ruby-travis \
  saml2aws \
  hstr \
  synergy2-bin \
  brasero2 \
  corectrl \
  saml2aws \
  ttf-ancient-fonts \
  nerd-fonts-source-code-pro \
  pulumi-bin >/dev/null 2>&1

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

read -p "$(query ">>> Workstation Setup: Does this system have a NVIDIA Card? y/n (default n)")" cardAnswer

if [ "${cardAnswer}" == 'y' ]; then
  info ">>> Installing NVIDIA Packages"
  yay -Syy --noconfirm --noeditmenu --nodiffmenu --noprovides --needed \
    lib32-nvidia-utils
fi

read -p "$(query ">>> Workstation Setup: Will this system use KVM? y/n (default n)")" virtualAnswer

if [ "${virtualAnswer}" == 'y' ]; then
  info ">>> Installing KVM/QEMU Packages"
  yay -Syy --noconfirm --noeditmenu --nodiffmenu --noprovides --needed \
    virtio-win \
    ovmf \
    bridge-utils \
    virt-manager \
    ebtables \
    iptables \
    dnsmasq \
    qemu \
    libvirt \
    edk2-ovmf >/dev/null 2>&1

  sudo systemctl enable libvirtd.service
  sudo systemctl enable virtlogd.socket
fi
