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

# Path to the bash it configuration
export BASH_IT="${HOME}/.bash_it"

# Load Bash It
if [ -f "$BASH_IT/bash_it.sh" ]; then
  # Lock and Load a custom theme file
  # location /.bash_it/themes/
  export BASH_IT_THEME='powerline'

  # Don't check mail when opening terminal.
  unset MAILCHECK

  # Set this to false to turn off version control status checking within the prompt for all themes
  export SCM_CHECK=true

  source $BASH_IT/bash_it.sh
fi

EOF
