#!/usr/bin/env bash

# Exit on error. Append "|| true" if you expect an error.
set -o errexit
# Exit on error inside any functions or subshells.
# set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace

source .env

info ">>> Upgrading System"
sudo pacman -Syyu --noconfirm --needed >/dev/null 2>&1

info ">>> Prepping Package Install"
if [ -z "$(command -v yay)" ]; then
  info ">>> Installing YAY"
  sudo pacman --noconfirm --needed -Sy git base-devel >/dev/null 2>&1
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
else
  info ">>> YAY Already installed"
fi

# info ">>> Removing uneeded packages"
#PACKAGES_TO_REMOVE="variety arcolinux-variety-git sublime-text-dev meld thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman chromium termite xfce-terminal"
#for package in $PACKAGES_TO_REMOVE; do
#  info ">>> Removing ${package}"
#  yay -Rcu --noconfirm $package >/dev/null 2>&1 || info ">>> ${package} not found"
#done

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

## Package Lists

THEMES='materia-gtk-theme
  paper-icon-theme-git
  nordic-darker-theme
  adwaita-icon-theme
  gnome-themes-extra
  midnight-gtk-theme-git'

SYSTEM='jq
  tree
  curl
  wget
  unzip
  zip
  unrar
  gzip
  git
  parallel
  xclip
  rsync
  fd
  exa
  pandoc
  bzip2
  shfmt
  p7zip
  gparted
  jre11-openjdk
  lastpass-cli
  diffutils
  clamtk
  bind-tools
  docker
  bluez
  bluez-utils
  blueberry
  dell-e514dw
  gnome-keyring'

DE='pavucontrol
  gnome-calculator
  gnome-disk-utility
  libreoffice-fresh
  flameshot
  keybase-gui
  bitwarden
  slack-desktop
  filezilla
  psensor
  vlc
  etcher-bin
  insomnia
  clipit
  google-chrome
  brave-bin
  corectrl
  spotify
  bluemail
  zoom'

EDITORS='neovim
  visual-studio-code-bin'

TERMINAL='lynx
  neovim
  alacritty
  hstr
  gitstatus-bin'

FONTS='powerline-fonts
  ttf-hack
  ttf-droid
  adobe-source-code-pro-fonts
  ttf-ancient-fonts
  nerd-fonts-source-code-pro
  ttf-ms-fonts
  ttf-weather-icons
  ttf-material-design-icons
  ttf-octicons'

CODING='pyenv
  ruby
  python
  python-pip
  go
  pyenv
  ts-node
  yarn
  rbenv-git
  ruby-build
  nodenv
  nodenv-node-build-git'

VM='vagrant
  virtio-win
  bridge-utils
  virt-manager
  ebtables-git
  iptables
  dnsmasq
  qemu
  libvirt
  edk2-ovmf'

INFRASTRUCTURE='saml2aws-bin
  aws-cli-v2-bin
  pulumi'

PERIPHERALS='polychromatic
  openrazer-meta
  libu2f-host-git
  libfido2'

GAMES='lib32-gnutls
  lib32-libldap
  lib32-libgpg-error
  lib32-sqlite
  lib32-libpulse
  lib32-libxml2
  lib32-alsa-plugins
  lib32-sdl2
  lib32-freetype2
  lib32-dbus
  lib32-libgcrypt
  libgcrypt
  mono
  wine-mono
  eog
  vulkan-icd-loader
  lib32-vulkan-icd-loader
  lutris
  scanmem
  gameconqueror
  xow-git
  steam
  pywinery
  protontricks-git'

OPENBOX='numlockx
  playerctl
  zscroll-git
  ntfd-bin'

RADEON='lib32-mesa
  libva-mesa-drivee
  lib32-libva-mesa-driver
  mesa-vdpau
  lib32-mesa-vdpau'

NVIDIA='lib32-nvidia-utils'

info ">>> Building Install List"
export PACKAGES="${THEMES} ${SYSTEM} ${DE} ${EDITORS} ${TERMINAL} ${FONTS} ${CODING} ${INFRASTRUCTURE} ${PERIPHERALS} ${GAMES}"

if [ "${OPENBOX_ANSWER}" == 'y' ]; then
  export PACKAGES="${PACKAGES} ${OPENBOX}"
fi

read -p "$(query ">>> Workstation Setup: Will this setup use VMs? y/n (default n)")" vmAnswer

if [ "${vmAnswer}" == 'y' ]; then
  export PACKAGES="${PACKAGES} ${VM}"
fi

read -p "$(query ">>> Workstation Setup: Does this system have a Radeon Card? y/n (default n)")" radeonAnswer

if [ "${radeonAnswer}" == 'y' ]; then
  export PACKAGES="${PACKAGES} ${RADEON}"
fi

read -p "$(query ">>> Workstation Setup: Does this system have a NVIDIA Card? y/n (default n)")" nvidiaAnswer

if [ "${nvidiaAnswer}" == 'y' ]; then
  export PACKAGES="${PACKAGES} ${NVIDIA}"
fi

info ">>> Installing Packages"
for package in ${PACKAGES}; do
  info ">>> Installing ${package}"
  yay -Syy --noconfirm --noeditmenu --nodiffmenu --noprovides --needed ${package} >/dev/null 2>&1 || error ">>> Failed to Install ${package}"
done

sudo systemctl enable bluetooth >/dev/null 2>&1
sudo systemctl enable libvirtd.service
sudo systemctl enable virtlogd.socket
sudo systemctl enable cronie
sudo systemctl enable clamav-freshclam.service
sudo systemctl enable clamav-daemon

sudo systemctl start bluetooth >/dev/null 2>&1
