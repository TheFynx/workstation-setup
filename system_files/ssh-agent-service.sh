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

mkdir -p ${USER_HOME}/.custom

cat >"${USER_HOME}/.custom/ssh-agent.service" <<'EOF'
[Unit]
Description=SSH Key Agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

[Install]
WantedBy=default.target
EOF

if [ -f "${USER_HOME}/.config/systemd/user/ssh-agent.service" ]; then
  info ">>> SSH Agent: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${USER_HOME}/.config/systemd/user/ssh-agent.service ${USER_HOME}/.custom/ssh-agent.service)" ]; then
    info ">>> SSH Agent: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${USER_HOME}/.config/systemd/user/ssh-agent.service ${USER_HOME}/.custom/ssh-agent.service
    mv ${USER_HOME}/.custom/ssh-agent.service ${USER_HOME}/.config/systemd/user/ssh-agent.service
  else
    info ">>> SSH Agent: No changes detected"
    mv ${USER_HOME}/.custom/ssh-agent.service ${USER_HOME}/.config/systemd/user/ssh-agent.service
  fi
else
  info ">>> SSH Agent: No file detected, creating new file"
  mv ${USER_HOME}/.custom/ssh-agent.service ${USER_HOME}/.config/systemd/user/ssh-agent.service
fi

systemctl --user daemon-reload
systemctl --user enable ssh-agent.service
systemctl --user start ssh-agent.service
