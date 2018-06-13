mkdir -p ${HOME}/.config/nvim/modules/

# ${__dir} is exported from config.sh
cp -fr ${__dir}/dotfiles/neo/* ${HOME}/.config/nvim/modules/

cat > "${HOME}/.config/nvim/init.vim" << EOF
source $HOME/.config/nvim/modules/init.vim
source $HOME/.config/nvim/modules/general.vim
source $HOME/.config/nvim/modules/plugins.vim
source $HOME/.config/nvim/modules/bindings.vim
EOF
