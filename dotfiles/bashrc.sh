cat > "${HOME}/.bashrc.2" << 'EOF'
# .bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# For Travis CLI
[ -f "${HOME}/.travis/travis.sh" ] && source ${HOME}/.travis/travis.sh

bind TAB:menu-complete

# Source global definitions
if [ -f "/etc/bashrc" ]; then
  . /etc/bashrc
fi

EOF

if [ -f "${HOME}/.bashrc" ]; then
  info ">>> BASHRC: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${HOME}/.bashrc ${HOME}/.bashrc.2)" ]; then
    info ">>> BASHRC: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${HOME}/.bashrc ${HOME}/.bashrc.2
    mv ${HOME}/.bashrc.2 ${HOME}/.bashrc
  else
    info ">>> BASHRC: No changes detected"
  fi
else
  info ">>> BASHRC: No file detected, creating new file"
  mv ${HOME}/.bashrc.2 ${HOME}/.bashrc
fi