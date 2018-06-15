info ">>> Removing unwanted packages"
sudo eopkg rm -y \
  thunderbird \
  hexchat \
  gnome-mpv \
  mpv-libs \
  rhythmbox-alternative-toolbar \
  rhythmbox > /dev/null 2>&1

info ">>> Packages succesfully removed"

info ">>> Installing Packages"
sudo eopkg it -y \
  clipit \
  git \
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
  diffutils > /dev/null 2>&1

info ">>> Packages succesfully installed"