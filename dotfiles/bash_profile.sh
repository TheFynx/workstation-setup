cat >"${HOME}/.bash_profile.2" <<'EOF'
if [ -f "${HOME}/.bashrc" ] ; then
  source ${HOME}/.bashrc
fi

EOF

if [ -f "${HOME}/.bash_profile" ]; then
  info ">>> BASH Profile: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${HOME}/.bash_profile ${HOME}/.bash_profile.2)" ]; then
    info ">>> BASH Profile: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${HOME}/.bash_profile ${HOME}/.bash_profile.2
    mv ${HOME}/.bash_profile.2 ${HOME}/.bash_profile
  else
    info ">>> BASH Profile: No changes detected"
    mv ${HOME}/.bash_profile.2 ${HOME}/.bash_profile
  fi
else
  info ">>> BASH Profile: No file detected, creating new file"
  mv ${HOME}/.bash_profile.2 ${HOME}/.bash_profile
fi
