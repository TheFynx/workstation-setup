if [ ! -d "${HOME}/.local/share/fonts" ]; then
  cd /tmp

  git clone https://github.com/powerline/fonts.git --depth=1 > /dev/null 2>&1 &&\
  cd fonts &&\
  sh ./install.sh > /dev/null 2>&1 &&\
  cd .. &&\
  rm -rf fonts
  info ">>> Fonts installed succesfully"
else
  info ">>> Fonts already installed"
fi