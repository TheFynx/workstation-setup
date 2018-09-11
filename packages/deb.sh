info ">>> Removing unwanted packages"
# apt remove -y

info ">>> Packages succesfully removed"

info ">>> Installing Packages"
sudo apt-get update -y && sudo apt-get upgrade -y

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
    pandoc \
    lynx \
    neovim \
    terminator \
    docker \
    docker-compose \
    variety \
    rsync \
    libu2f-host \
    zsh \
    moka-icon-theme \
    materia-gtk-theme \
    diffutils \
    chromium-browser \
    slack \
    vlc \
    bzip2

info ">>> Installing VS Code"
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt-get update -y
sudo apt-get install -y code

info ">>> Installing Google Talk Plugin"
echo "deb http://dl.google.com/linux/talkplugin/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-talkplugin.list
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update -y
sudo apt-get install google-talkplugin

info ">>> Installing Spotify"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update -y
sudo apt-get install spotify-client -y

info ">>> Installing Insomnia"
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
sudo apt-get update -y
sudo apt-get install insomnia -y

info ">>> Packages succesfully installed"