#!/usr/bin/env bash

# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace

source .env

# Set Nodenv
if [ -d "${HOME}/.nodenv" ]; then
  info ">>> Activating NODENV"
  export NODENV_ROOT="${HOME}/.nodenv"
  export PATH="${NODENV_ROOT}/bin:${PATH}"
fi

# Add shim/nodenv to path
if [ -n "$(command -v nodenv)" ]; then
  eval "$(nodenv init -)"
  if [ -z "$(nodenv versions | grep "${NODE_VERSION}")" ]; then
    info ">>> Installing Node to NODENV"
    nodenv install ${NODE_VERSION} >/dev/null 2>&1
  fi

  info ">>> Installing Older Node Versions to NODENV"
  nodenv install 12.22.7 >/dev/null 2>&1

  nodenv install 10.24.1 >/dev/null 2>&1

  info ">>> Setting Node Version to ${NODE_VERSION}"
  nodenv global ${NODE_VERSION}
fi
