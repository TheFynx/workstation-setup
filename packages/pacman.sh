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
PACKAGES_TO_REMOVE="variety arcolinux-variety-git sublime-text-dev meld thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman chromium termite xfce-terminal"
for package in $PACKAGES_TO_REMOVE; do
  info ">>> Removing ${package}"
  yay -Rcu --noconfirm $package >/dev/null 2>&1 || info ">>> ${package} not found"
done

# if [ -n "${CINNAMON_DESKTOP}" ]; then
#   info ">>> Setting up Cinnamon Desktop"
#   yay -Syy --noconfirm --noeditmenu --nodiffmenu --needed \
#     gdm \
#     cinnamon \
#     nemo-fileroller \
#     nemo-preview \
#     gnome-screenshot \
#     gedit \
#     lightdm-gtk-greeter \
#     lightdm-gtk-greeter-settings \
#     gnome-terminal \
#     gnome-control-center \
#     gnome-system-monitor \
#     gnome-schedule \
#     gnome-power-manager \
#     mintlocale >/dev/null 2>&1
#   sudo cp -fv /etc/X11/xinit/xinitrc ${USER_HOME}/.xinitrc >/dev/null 2>&1
#   chown -R ${USER}:users ${USER_HOME}/.xinitrc >/dev/null 2>&1
#   echo -e "exec cinnamon-session" >>${USER_HOME}/.xinitrc >/dev/null 2>&1
#   systemctl enable gdm >/dev/null 2>&1
# fi

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
  jre11-openjdk \
  gnome-calculator \
  gnome-disk-utility \
  pavucontrol \
  gparted \
  ruby \
  python \
  python-pip \
  go \
  pyenv \
  pandoc \
  lynx \
  neovim \
  docker \
  vlc \
  diffutils \
  lastpass-cli \
  psensor \
  bind-tools \
  vagrant \
  clamtk \
  libu2f-host-git \
  libfido2 \
  keybase-gui \
  bzip2 \
  shfmt \
  p7zip \
  adobe-source-code-pro-fonts \
  ttf-hack \
  ttf-droid \
  powerline-fonts \
  flameshot \
  ts-node \
  yarn \
  filezilla \
  discord \
  gnome-keyring \
  alacritty \
  materia-gtk-theme >/dev/null 2>&1

## Blueberry Specific Packages
info ">>> Installing Bluetooth Packages"
yay -Syy --noconfirm --noeditmenu --nodiffmenu --noprovides --needed \
  bluez \
  bluez-utils \
  blueberry >/dev/null 2>&1

sudo systemctl enable bluetooth >/dev/null 2>&1
sudo systemctl start bluetooth >/dev/null 2>&1

## AUR Specific Packages
info ">>> Installing AUR Packages"
yay -Syy --noconfirm --noeditmenu --nodiffmenu --noprovides --needed \
  insomnia \
  rbenv-git \
  ruby-build \
  nodenv \
  nodenv-node-build-git \
  visual-studio-code-bin \
  etcher-bin \
  clipit \
  google-chrome \
  ruby-travis \
  saml2aws-bin \
  aws-cli-v2-bin \
  hstr \
  ttf-ancient-fonts \
  nerd-fonts-source-code-pro \
  corectrl \
  brave-bin \
  dell-e514dw \
  polychromatic \
  openrazer-meta \
  gitstatus-bin \
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
  scanmem \
  gameconqueror \
  xow-git \
  steam >/dev/null 2>&1

## AUR Specific Packages
info ">>> Installing AUR Game Support Packages"
yay -Syy --noconfirm --noeditmenu --nodiffmenu --noprovides --needed \
  pywinery \
  protontricks-git \
  ttf-ms-fonts >/dev/null 2>&1

read -p "$(query ">>> Workstation Setup: Does this system have a NVIDIA Card? y/n (default n)")" nvidiaAnswer

if [ "${nvidiaAnswer}" == 'y' ]; then
  info ">>> Installing NVIDIA Packages"
  yay -Syy --noconfirm --noeditmenu --nodiffmenu --noprovides --needed \
    lib32-nvidia-utils
fi

read -p "$(query ">>> Workstation Setup: Does this system have a Radeon Card? y/n (default n)")" radeonAnswer

if [ "${radeonAnswer}" == 'y' ]; then
  info ">>> Installing Radeon Packages"
  yay -Syy --noconfirm --noeditmenu --nodiffmenu --noprovides --needed \
    lib32-mesa \
    libva-mesa-driver \
    lib32-libva-mesa-driver \
    mesa-vdpau \
    lib32-mesa-vdpau >/dev/null 2>&1
fi

read -p "$(query ">>> Workstation Setup: Will this system use KVM? y/n (default n)")" virtualAnswer

if [ "${virtualAnswer}" == 'y' ]; then
  info ">>> Installing KVM/QEMU Packages"
  yay -Syy --noconfirm --noeditmenu --nodiffmenu --noprovides --needed \
    virtio-win \
    bridge-utils \
    virt-manager \
    ebtables \
    iptables \
    dnsmasq \
    qemu \
    libvirt-git \
    edk2-ovmf >/dev/null 2>&1

  sudo systemctl enable libvirtd.service
  sudo systemctl enable virtlogd.socket
fi

sudo systemctl enable cronie
sudo systemctl enable clamav-freshclam.service
sudo systemctl enable clamav-daemon
