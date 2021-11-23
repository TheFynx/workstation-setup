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

if [ -d "${HOME}/bin" ]; then
  info ">>> Activating RBENV"
  export RBENV_ROOT="${HOME}/.rbenv"
  export PATH="${RBENV_ROOT}/bin:${PATH}"
fi

# Add shim/rbenv to path
if [ -n "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
  if [ -z "$(rbenv versions | grep "${RB_VERSION}")" ]; then
    info ">>> Installing Ruby to RBENV"
    rbenv install ${RB_VERSION} >/dev/null 2>&1
  fi

  info ">>> Setting Ruby Version to ${RB_VERSION}"
  rbenv global ${RB_VERSION} >/dev/null 2>&1

  info ">>> Installing Gems"
  gem install travis --no-document >/dev/null 2>&1
fi
