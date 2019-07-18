cd ${HOME}

if [ ! -d "${USER_HOME}/.oh-my-zsh" ]; then
  info ">>> Installing Oh My ZSH"
  git clone https://github.com/robbyrussell/oh-my-zsh.git ${USER_HOME}/.oh-my-zsh
  cp ${USER_HOME}/.oh-my-zsh/templates/zshrc.zsh-template ${USER_HOME}/.zshrc
  chsh -s $(which zsh)
else
  info ">>> Oh My ZSH Already Installed, Upgrading instead"
  upgrade_oh_my_zsh
fi

if [ -d "${USER_HOME}/.oh-my-zsh" ]; then
  curl -sL https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme -o ~/.oh-my-zsh/custom/themes/bullet-train.zsh-theme
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions >/dev/null 2>&1
  info ">>> Oh My ZSH Extras Installed Successfully"
fi
