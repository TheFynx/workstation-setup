if [ ! -d "${HOME}/.goenv" ]; then
  git clone https://github.com/syndbg/goenv.git ${HOME}/.goenv >/dev/null 2>&1
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
  if [ -z "$(goenv versions | grep "${GO_VERSION}")" ]; then
    info ">>> Installing Golang to GOENV"
    goenv install ${GO_VERSION} >/dev/null 2>&1
    goenv global ${GO_VERSION} >/dev/null 2>&1
  fi
fi