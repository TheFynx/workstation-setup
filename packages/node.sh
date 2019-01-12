# Set Nodenv
if [ -d "${HOME}/.nodenv" ]; then
  info ">>> Activating NODENV"
  export NODENV_ROOT="${HOME}/.nodenv"
  export PATH="${NODENV_ROOT}/bin:${PATH}"
fi

# Add shim/nodenv to path
if [ -n "$(command -v nodenv)" ]; then
  eval "$(nodenv init -)"
  if [ -z "$(nodenv versions | grep "${NODE_VERSION}")" ]; then
    nodenv install ${NODE_VERSION}
    nodenv global ${NODE_VERSION}
  fi
fi
