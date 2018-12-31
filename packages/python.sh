# Set Pyenv
if [ -d "${HOME}/.pyenv" ]; then
  info ">>> Activating PYENV"
  export PYENV_ROOT="${HOME}/.pyenv"
  export PATH="${PYENV_ROOT}/bin:${PATH}"
fi

# Add shim/pyenv to path
if [ -n "$(command -v pyenv)" ]; then
  eval "$(pyenv init -)"
  info ">>> Installing Python to PYENV"
  if [ -z "$(pyenv versions | grep "${PY_VERSION}")" ]; then
    pyenv install ${PY_VERSION}
  fi
fi

info ">>> Upgrading Pip"
sudo pip install --upgrade pip

info ">>> Installing AWS CLI"
sudo pip install awscli