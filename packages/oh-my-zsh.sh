cd ${HOME}

if [ ! -d "${USER_HOME}/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" >/dev/null 2>&1
else
  info ">>> Oh-My-ZSH Already Installed"
fi

if [ -d "${USER_HOME}/.oh-my-zsh" ]; then
  curl -sL https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme -o ~/.oh-my-zsh/custom/themes/bullet-train.zsh-theme
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions >/dev/null 2>&1
  info ">>> Oh My ZSH Installed Successfully"
fi
