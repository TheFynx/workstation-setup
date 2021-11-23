#!/usr/bin/env bash

# Exit on error. Append "|| true" if you expect an error.
set -o errexit
# Exit on error inside any functions or subshells.
# set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace

source .env

mkdir -p ${HOME}/.config/nvim/modules/

# ${INIT_HOME} is exported from config.sh
cp -fr ${INIT_HOME}/workstation-setup/dotfiles/neo/* ${HOME}/.config/nvim/modules/

cat >"${HOME}/.config/nvim/init.vim.2" <<EOF
source $HOME/.config/nvim/modules/init.vim
source $HOME/.config/nvim/modules/general.vim
source $HOME/.config/nvim/modules/plugins.vim
source $HOME/.config/nvim/modules/bindings.vim
EOF

if [ -f "${HOME}/.config/nvim/init.vim" ]; then
  info ">>> NEOVIM: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${HOME}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim.2)" ]; then
    info ">>> NEOVIM: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${HOME}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim.2
    mv ${HOME}/.config/nvim/init.vim.2 ${HOME}/.config/nvim/init.vim
  else
    info ">>> NEOVIM: No changes detected"
    mv ${HOME}/.config/nvim/init.vim.2 ${HOME}/.config/nvim/init.vim
  fi
else
  info ">>> NEOVIM: No file detected, creating new file"
  mv ${HOME}/.config/nvim/init.vim.2 ${HOME}/.config/nvim/init.vim
fi
