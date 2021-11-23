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

mkdir -p ${HOME}/.custom

cat >"${HOME}/.custom/pam_login" <<'EOF'
#%PAM-1.0

auth       required     pam_securetty.so
auth       requisite    pam_nologin.so
auth       include      system-local-login
auth       optional     pam_gnome_keyring.so
account    include      system-local-login
session    include      system-local-login
password   include      system-local-login
session    optional     pam_gnome_keyring.so auto_start
EOF

if [ -f "/etc/pam.d/login" ]; then
  info ">>> Pam.d Login: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines /etc/pam.d/login ${HOME}/.custom/pam_login)" ]; then
    info ">>> Pam.d Login: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines /etc/pam.d/login ${HOME}/.custom/pam_login
    sudo mv ${HOME}/.custom/pam_login /etc/pam.d/login
  else
    info ">>> Pam.d Login: No changes detected"
    sudo mv ${HOME}/.custom/pam_login /etc/pam.d/login
  fi
else
  info ">>> Pam.d Login: No file detected, creating new file"
  sudo mv ${HOME}/.custom/pam_login /etc/pam.d/login
fi
