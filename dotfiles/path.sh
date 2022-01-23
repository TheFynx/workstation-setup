#!/usr/bin/env bash

# Exit on error. Append "|| true" if you expect an error.
set -o errexit
# Exit on error inside any functions or subshells.
# set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace

source .env

cat >"${USER_HOME}/.path.2" <<'EOF'
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
  export RBENV_ROOT="${HOME}/.rbenv"
  export PATH="${RBENV_ROOT}/bin:${PATH}"
fi

# Add shim/rbenv to path
if [ -n "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
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

# Set Nodenv
if [ -d "${HOME}/.nodenv" ]; then
  export NODENV_ROOT="${HOME}/.nodenv"
  export PATH="${NODENV_ROOT}/bin:${PATH}"
fi

# Add shim/nodenv to path
if [ -n "$(command -v nodenv)" ]; then
  eval "$(nodenv init -)"
fi

# Set goenv
if [ -d "${HOME}/.goenv" ]; then
  export GOENV_ROOT="${HOME}/.goenv"
  export PATH="${GOENV_ROOT}/bin:${PATH}"
fi
# Add shim/goenv to path
if [ -n "$(command -v goenv)" ]; then
  eval "$(goenv init -)"
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

# For Travis CLI
[ -f "${HOME}/.travis/travis.sh" ] && source ${HOME}/.travis/travis.sh

export PATH=$PATH:$HOME/.pulumi/bin

EOF

if [ -f "${USER_HOME}/.path" ]; then
  info ">>> Path: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${USER_HOME}/.path ${USER_HOME}/.path.2)" ]; then
    info ">>> Path: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${USER_HOME}/.path ${USER_HOME}/.path.2 || true
    mv ${USER_HOME}/.path.2 ${USER_HOME}/.path
  else
    info ">>> Path: No changes detected"
    mv ${USER_HOME}/.path.2 ${USER_HOME}/.path
  fi
else
  info ">>> Path: No file detected, creating new file"
  mv ${USER_HOME}/.path.2 ${USER_HOME}/.path
fi
