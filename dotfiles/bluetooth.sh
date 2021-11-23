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

info ">>> Generating Bluetooth Config Files"

mkdir -p ${HOME}/.custom/

cat >"${HOME}/.custom/bluetooth_main.conf" <<EOF
[General]
[GATT]
[Policy]
AutoEnable=true
EOF

if [ -f "/etc/bluetooth/main.conf" ]; then
  info ">>> Bluetooth: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines /etc/bluetooth/main.conf ${HOME}/.custom/bluetooth_main.conf)" ]; then
    info ">>> Bluetooth: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines /etc/bluetooth/main.conf ${HOME}/.custom/bluetooth_main.conf
    sudo mv ${HOME}/.custom/bluetooth_main.conf /etc/bluetooth/main.conf
  else
    info ">>> Bluetooth: No changes detected"
    sudo mv ${HOME}/.custom/bluetooth_main.conf /etc/bluetooth/main.conf
  fi
else
  info ">>> Bluetooth: No file detected, creating new file"
  sudo mv ${HOME}/.custom/bluetooth_main.conf /etc/bluetooth/main.conf
fi
