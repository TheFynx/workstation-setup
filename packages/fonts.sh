#!/usr/bin/env bash

# Exit on error inside any functions or subshells.
# set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace

source .env

if [ ! -d "${USER_HOME}/.local/share/fonts" ]; then
  cd /tmp

  git clone https://github.com/powerline/fonts.git --depth=1 >/dev/null 2>&1 &&
    cd fonts &&
    sh ./install.sh >/dev/null 2>&1 &&
    cd .. &&
    rm -rf fonts
  info ">>> Fonts installed succesfully"
else
  info ">>> Fonts already installed"
fi
