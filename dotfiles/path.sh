cat > "${HOME}/.path" << 'EOF'
# update path
if [ -d "/usr/share/bcc/tools" ]; then
  export PATH=/usr/share/bcc/tools:${PATH}
fi

if [ -d "/usr/local/bin" ]; then
  export PATH=/usr/local/bin:${PATH}
fi

# Add home local bin
if [ -d "${HOME}/.local/bin" ]; then
  export PATH=${HOME}/.local/bin:${PATH}
fi

# Add Cargo bin
if [ -d "${HOME}/.cargo/bin" ]; then
  export PATH=${HOME}/.cargo/bin:${PATH}
fi

# include sbin in PATH
if [ -d "/sbin" ]; then
  export PATH="/sbin:${PATH}"
fi

if [ -d "/usr/sbin" ]; then
  export PATH="/usr/sbin:${PATH}"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ]; then
  export PATH="${HOME}/bin:${PATH}"
fi

# Add shim/rbenv to path
if [ -n "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
fi

# Set goenv
if [ -d "${HOME}/.goenv" ]; then
  export GOENV_ROOT="${HOME}/.goenv"
  export PATH="${GOENV_ROOT}/bin:${PATH}"
fi

# Add shim/goenv to path
if [ -n "$(command -v pyenv)" ]; then
  eval "$(goenv init -)"
fi

# Set Pyenv
if [ -d "${HOME}/.pyenv" ]; then
  export PYENV_ROOT="${HOME}/.pyenv"
  export PATH="${PYENV_ROOT}/bin:${PATH}"
fi

# Add shim/pyenv to path
if [ -n "$(command -v pyenv)" ]; then
  eval "$(pyenv init -)"
fi

# set GOPATH if it exists
if [ -d "${HOME}/.go" ]; then
  export GOPATH="${HOME}/.go"
fi

# set GOPATH if it exists
if [ -d "${HOME}/go" ]; then
  export GOPATH="${HOME}/go"
fi

# Add Go Bin to PATH
if [ -d "${GOPATH}/bin" ]; then
  export PATH="${PATH}:${GOPATH}/bin"
fi

EOF
