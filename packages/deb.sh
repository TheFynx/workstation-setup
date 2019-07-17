info ">>> Removing unwanted packages"
apt remove -y \
  rhythmbox \
  hexchat \
  thunderbird \
  xplayer >/dev/null 2>&1

info ">>> Packages succesfully removed"

info ">>> Upgrading System"
sudo apt-get update -y >/dev/null 2>&1
sudo apt-get upgrade -y >/dev/null 2>&1

info ">>> Installing Packages"
sudo apt-get install -y \
  apt-transport-https \
  curl \
  wget \
  unzip \
  git \
  ruby \
  python3 \
  python3-pip \
  golang \
  xclip \
  clipit \
  pandoc \
  lynx \
  neovim \
  terminator \
  docker.io \
  docker-compose \
  variety \
  rsync \
  zsh \
  moka-icon-theme \
  materia-gtk-theme \
  diffutils \
  chromium-browser \
  vlc \
  bzip2 >/dev/null 2>&1

info ">>> Installing VS Code"
if [ -z "$(dpkg -l | awk '{print $2}' | grep -w "code")" ]; then
  curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - >/dev/null 2>&1
  echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null 2>&1
  sudo apt-get update -y >/dev/null 2>&1
  sudo apt-get install -y code >/dev/null 2>&1
else
  info ">>> VS Code Already Installed"
fi

info ">>> Installing Google Talk Plugin"
if [ -z "$(dpkg -l | awk '{print $2}' | grep -w "google-talkplugin")" ]; then
  echo "deb http://dl.google.com/linux/talkplugin/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-talkplugin.list >/dev/null 2>&1
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - >/dev/null 2>&1
  sudo apt-get update -y >/dev/null 2>&1
  sudo apt-get install google-talkplugin -y >/dev/null 2>&1
else
  info ">>> Google Talk Plugin Already Installed"
fi

info ">>> Installing Insomnia"
if [ -z "$(dpkg -l | awk '{print $2}' | grep -w "insomnia")" ]; then
  echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee /etc/apt/sources.list.d/insomnia.list >/dev/null 2>&1
  wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add - >/dev/null 2>&1
  sudo apt-get update -y >/dev/null 2>&1
  sudo apt-get install insomnia -y >/dev/null 2>&1
else
  info ">>> Insomnia Already Installed"
fi

info ">>> Packages succesfully installed"
