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
  ttf-ancient-fonts \
  golang \
  xclip \
  clipit \
  pandoc \
  lynx \
  neovim \
  terminator \
  docker.io \
  docker-compose \
  rsync \
  zsh \
  moka-icon-theme \
  materia-gtk-theme \
  diffutils \
  chromium-browser \
  vlc \
  virtualbox \
  vagrant \
  clamav \
  clamtk \
  libu2f-host \
  jq \
  fonts-hack-ttf \
  influxdb-client \
  bzip2 >/dev/null 2>&1


info ">>> Installing Adobe Source Code Fonts"
if [ ! -f "/usr/local/share/fonts/SourceCodePro-Regular.otf" ]; then
  I1FS=$'\n\t'
  mkdir -p /tmp/adodefont
  cd /tmp/adodefont
  wget -q --show-progress -O source-code-pro.zip https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
  unzip -q source-code-pro.zip -d source-code-pro
  sudo mkdir -p /usr/local/share/fonts/
  sudo cp -v source-code-pro/*/OTF/*.otf /usr/local/share/fonts/
  fc-cache -f
  rm -rf source-code-pro{,.zip}
  cd -
else
  info ">>> Adobe Source Code Fonts Already Installed"
fi

info ">>> Installing Lastpass CLI"
if [ -z "$(command -v lpass)" ]; then
  apt-get --no-install-recommends -yqq install \
    bash-completion \
    build-essential \
    cmake \
    libcurl4 \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2 \
    libxml2-dev \
    libssl1.1 \
    pkg-config \
    ca-certificates \
    xclip >/dev/null 2>&1
  mkdir -p /tmp/Lastpass
  cd /tmp/Lastpass
  wget https://github.com/lastpass/lastpass-cli/releases/download/v1.3.3/lastpass-cli-1.3.3.tar.gz >/dev/null 2>&1
  tar -xzf lastpass-cli-1.3.3.tar.gz >/dev/null 2>&1
  make >/dev/null 2>&1
  sudo make install >/dev/null 2>&1
  cd -
else
  info ">>> Lastpass CLI Already Installed"
fi

info ">>> Installing Draw.io Desktop"
if [ -z "$(dpkg -l | awk '{print $2}' | grep -w "draw.io")" ]; then
  cd /tmp
  wget https://github.com/jgraph/drawio-desktop/releases/download/v10.9.5/draw.io-amd64-10.9.5.deb >/dev/null 2>&1
  sudo apt install -y ./draw.io-amd64-10.9.5.deb >/dev/null 2>&1
  cd -
else
  info ">>> Draw.io Desktop Already Installed"
fi

info ">>> Installing Slack"
if [ -z "$(dpkg -l | awk '{print $2}' | grep -w "slack")" ]; then
  cd /tmp
  wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.0-amd64.deb >/dev/null 2>&1
  sudo apt install -y ./slack-desktop-4.0.0-amd64.deb >/dev/null 2>&1
  cd -
else
  info ">>> Slack Already Installed"
fi

info ">>> Installing Simplenote"
if [ -z "$(dpkg -l | awk '{print $2}' | grep -w "Simplenote")" ]; then
  cd /tmp
  wget https://github.com/Automattic/simplenote-electron/releases/download/v1.6.0/Simplenote-linux-1.6.0-amd64.deb >/dev/null 2>&1
  sudo apt install -y ./Simplenote-linux-1.6.0-amd64.deb >/dev/null 2>&1
  cd -
else
  info ">>> Simplenote Already Installed"
fi

info ">>> Installing Keybase"
if [ -z "$(dpkg -l | awk '{print $2}' | grep -w "keybase")" ]; then
  cd /tmp
  wget https://prerelease.keybase.io/keybase_amd64.deb >/dev/null 2>&1
  sudo apt install -y keybase_amd64.deb >/dev/null 2>&1
  cd -
else
  info ">>> Keybase Already Installed"
fi

info ">>> Installing Saw"
if [ -z "$(dpkg -l | awk '{print $2}' | grep -w "saw")" ]; then
  cd /tmp
  wget https://github.com/TylerBrock/saw/releases/download/v0.2.2/saw_0.2.2_linux_amd64.deb >/dev/null 2>&1
  sudo apt install -y saw_0.2.2_linux_amd64.deb >/dev/null 2>&1
  cd -
else
  info ">>> Saw Already Installed"
fi

info ">>> Installing Pyenv"
if [ ! -d "${USER_HOME}/.pyenv" ]; then
  curl https://pyenv.run | bash >/dev/null 2>&1
else
  info ">>> Pyenv Already Installed, Updating"
  cd ${USER_HOME}/.pyenv && git pull
  cd -
fi

info ">>> Installing Rbenv"
if [ ! -d "${USER_HOME}/.rbenv" ]; then
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash >/dev/null 2>&1
else
  info ">>> Rbenv Already Installed, Updating"
  cd ${USER_HOME}/.rbenv && git pull
  cd -
fi

info ">>> Installing Nodenv"
if [ ! -d "${USER_HOME}/.nodenv" ]; then
  curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-installer | bash >/dev/null 2>&1
else
  info ">>> Nodenv Already Installed, Updating"
  cd ${USER_HOME}/.nodenv && git pull
  cd -
fi

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

info ">>> Installing Etcher"
if [ -z "$(dpkg -l | awk '{print $2}' | grep -w "etcher-electron")" ]; then
  echo "deb https://dl.bintray.com/resin-io/debian stable etcher" | sudo tee /etc/apt/sources.list.d/etcher.list >/dev/null 2>&1
  sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 379CE192D401AB61 >/dev/null 2>&1
  sudo apt-get update -y >/dev/null 2>&1
  sudo apt-get install etcher-electron -y >/dev/null 2>&1
else
  info ">>> Etcher Already Installed"
fi

info ">>> Packages succesfully installed"
