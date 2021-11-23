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

if [ ! -d "${HOME}/.goenv" ]; then
  git clone https://github.com/syndbg/goenv.git ${HOME}/.goenv >/dev/null 2>&1
fi

# Set goenv
if [ -d "${HOME}/.goenv" ]; then
  info ">>> Activating GOENV"
  export GOENV_ROOT="${HOME}/.goenv"
  export PATH="${GOENV_ROOT}/bin:${PATH}"
fi

# Add shim/goenv to path
if [ -n "$(command -v goenv)" ]; then
  eval "$(goenv init -)"
  if [ -z "$(goenv versions | grep "${GO_VERSION}")" ]; then
    info ">>> Installing Golang to GOENV"
    goenv install ${GO_VERSION} >/dev/null 2>&1
  fi

  info ">>> Setting Go Version to ${GO_VERSION}"
  goenv global ${GO_VERSION} >/dev/null 2>&1
fi
