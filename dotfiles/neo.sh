mkdir -p ${HOME}/.config/nvim/modules/

cp -fr ${1}/dotfiles/neo/* ${HOME}/.config/nvim/modules/

cat > "${HOME}/.config/nvim/init.vim" << EOF
source $HOME/.config/nvim/modules/init.vim
source $HOME/.config/nvim/modules/general.vim
source $HOME/.config/nvim/modules/plugins.vim
source $HOME/.config/nvim/modules/bindings.vim
EOF
