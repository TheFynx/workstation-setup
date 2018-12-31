
if [ -d "${HOME}/bin" ]; then
  info ">>> Activating RBENV"
  export RBENV_ROOT="${HOME}/.rbenv"
  export PATH="${RBENV_ROOT}/bin:${PATH}"
fi

# Add shim/rbenv to path
if [ -n "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
  if [ -z "$(rbenv versions | grep "${RB_VERSION}")" ]; then
    rbenv install ${RB_VERSION}
  fi
fi

info ">>> Installing Gems"
gem install travis --no-document