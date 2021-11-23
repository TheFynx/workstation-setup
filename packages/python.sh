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

# Set Pyenv
if [ -d "${HOME}/.pyenv" ]; then
  info ">>> Activating PYENV"
  export PYENV_ROOT="${HOME}/.pyenv"
  export PATH="${PYENV_ROOT}/bin:${PATH}"
fi

# Add shim/pyenv to path
if [ -n "$(command -v pyenv)" ]; then
  eval "$(pyenv init -)"
  if [ -z "$(pyenv versions | grep "${PY_VERSION}")" ]; then
    info ">>> Installing Python to PYENV"
    pyenv install ${PY_VERSION} >/dev/null 2>&1
  fi

  info ">>> Setting Python Version to ${PY_VERSION}"
  pyenv global ${PY_VERSION} >/dev/null 2>&1

  info ">>> Upgrading Pip"
  sudo pip install --upgrade pip >/dev/null 2>&1

  info ">>> Installing Additional Pip Packages"
  sudo pip install pylint >/dev/null 2>&1
fi
