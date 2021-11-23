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

info ">>> Removing unwanted packages"
sudo eopkg rm -y \
  thunderbird \
  hexchat \
  gnome-mpv \
  mpv-libs \
  rhythmbox-alternative-toolbar \
  rhythmbox >/dev/null 2>&1

info ">>> Packages succesfully removed"

info ">>> Installing Packages"
sudo eopkg it -y \
  clipit \
  git \
  docker \
  docker-compose \
  terminator \
  exa \
  xclip \
  lynx \
  pandoc \
  neovim \
  golang \
  python3 \
  pip \
  ruby \
  zsh \
  vscode \
  variety \
  rsync \
  libu2f-host \
  moka-icon-theme \
  materia-gtk-theme \
  materia-gtk-theme-dark \
  diffutils >/dev/null 2>&1

info ">>> Installing 3rd Party Packages"

info ">>> Installing Chrome"
if [ -z "$(eopkg li | grep google-chrome-stable)" ]; then
  sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/solus-project/3rd-party/master/network/web/browser/google-chrome-stable/pspec.xml >/dev/null 2>&1
  sudo eopkg it google-chrome-*.eopkg
  sudo rm google-chrome-*.eopkg >/dev/null 2>&1
else
  info ">>> Chome already installed"
fi

info ">>> Installing Google Talk Plugin"
if [ -z "$(eopkg li | grep google-talkplugin)" ]; then
  sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/solus-project/3rd-party/master/network/im/google-talkplugin/pspec.xml >/dev/null 2>&1
  sudo eopkg it google-talkplugin*.eopkg
  sudo rm google-talkplugin*.eopkg >/dev/null 2>&1
else
  info ">>> Google Talk Plugin already installed"
fi

info ">>> Installing Spotify"
if [ -z "$(eopkg li | grep spotify)" ]; then
  sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/solus-project/3rd-party/master/multimedia/music/spotify/pspec.xml >/dev/null 2>&1
  sudo eopkg it spotify*.eopkg
  sudo rm spotify*.eopkg >/dev/null 2>&1
else
  info ">>> Spotify already installed"
fi

info ">>> Installing Slack"
if [ -z "$(eopkg li | grep slack)" ]; then
  sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/solus-project/3rd-party/master/network/im/slack-desktop/pspec.xml >/dev/null 2>&1
  sudo eopkg it slack-desktop*.eopkg
  sudo rm slack-desktop*.eopkg >/dev/null 2>&1
else
  info ">>> Slack already installed"
fi

info ">>> Packages succesfully installed"
