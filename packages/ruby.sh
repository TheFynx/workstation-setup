
if [ -d "${HOME}/bin" ]; then
  info ">>> Activating RBENV"
  export RBENV_ROOT="${HOME}/.rbenv"
  export PATH="${RBENV_ROOT}/bin:${PATH}"
fi

# Add shim/rbenv to path
if [ -n "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
  rbenv install ${RB_VERSION}
fi

info ">>> Installing Gems"
gem install travis --no-rdoc --no-ri