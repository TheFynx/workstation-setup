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

if [ "${PKG}" == 'eopkg' ]; then
  echo "No support yet"
elif [ "${PKG}" == 'apt' ]; then
  curl -O https://prerelease.keybase.io/keybase_amd64.deb
  sudo dpkg -i keybase_amd64.deb
  sudo apt-get install -f || warning ">>> Keybase failed to install"
fi

info ">>> Keybase Installed"
