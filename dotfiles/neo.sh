mkdir -p ${HOME}/.config/nvim/modules/

# ${INIT_HOME} is exported from config.sh
cp -fr ${INIT_HOME}/workstation-setup/dotfiles/neo/* ${HOME}/.config/nvim/modules/

cat > "${HOME}/.config/nvim/init.vim" << EOF
source $HOME/.config/nvim/modules/init.vim
source $HOME/.config/nvim/modules/general.vim
source $HOME/.config/nvim/modules/plugins.vim
source $HOME/.config/nvim/modules/bindings.vim
EOF
