
if [ ! -d "${HOME}/.goenv" ]; then
  git clone https://github.com/syndbg/goenv.git ${HOME}/.goenv
fi

# Set goenv
if [ -d "${HOME}/.goenv" ]; then
  info ">>> Activating GOENV"
  export GOENV_ROOT="${HOME}/.goenv"
  export PATH="${GOENV_ROOT}/bin:${PATH}"
fi

# Add shim/goenv to path
if [ -n "$(command -v goenv)" ]; then
  eval "$(goenv init -)"
  goenv install ${GO_VERSION}
fi