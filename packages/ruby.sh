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
