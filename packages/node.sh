# Set Nodenv
if [ -d "${HOME}/.nodenv" ]; then
  info ">>> Activating NODENV"
  export NODENV_ROOT="${HOME}/.nodenv"
  export PATH="${NODENV_ROOT}/bin:${PATH}"
fi

# Add shim/nodenv to path
if [ -n "$(command -v nodenv)" ]; then
  eval "$(nodenv init -)"
  nodenv install ${NODE_VERSION}
fi
