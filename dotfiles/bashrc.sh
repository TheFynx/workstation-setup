cat > "${HOME}/.bashrc" << 'EOF'
# .bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# For Travis CLI
[ -f "${HOME}/.travis/travis.sh" ] && source ${HOME}/.travis/travis.sh

bind TAB:menu-complete

# Source global definitions
if [ -f "/etc/bashrc" ]; then
  . /etc/bashrc
fi

EOF
