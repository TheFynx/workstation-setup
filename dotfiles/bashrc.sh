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

cat >"${HOME}/.bashrc.2" <<'EOF'
# .bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f "/etc/bashrc" ]; then
  . /etc/bashrc
fi

if [ -n "$DESKTOP_SESSION" ];then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
fi

# Path to the bash it configuration
export BASH_IT="${HOME}/.bash_it"

# Load Bash It
if [ -f "${BASH_IT}/bash_it.sh" ]; then
  # Lock and Load a custom theme file
  # location /.bash_it/themes/
  export BASH_IT_THEME='powerline-multiline'
  export BASH_IT_COMMAND_DURATION=true
  export THEME_CLOCK_FORMAT="%H:%M:%S"
  export POWERLINE_SCM_GIT_CHAR="⎇  "
  export POWERLINE_PROMPT="clock scm python_venv ruby node terraform cwd last_status"
  export POWERLINE_LEFT_PROMPT="clock scm python_venv ruby node terraform cwd"
  export POWERLINE_RIGHT_PROMPT="last_status"

  # Don't check mail when opening terminal.
  unset MAILCHECK

  # Set this to false to turn off version control status checking within the prompt for all themes
  export SCM_CHECK=true

  source ${BASH_IT}/bash_it.sh
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,aliases,functions,path,extra,exports}; do
        [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

EOF

if [ -f "${HOME}/.bashrc" ]; then
  info ">>> BASHRC: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${HOME}/.bashrc ${HOME}/.bashrc.2)" ]; then
    info ">>> BASHRC: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${HOME}/.bashrc ${HOME}/.bashrc.2
    mv ${HOME}/.bashrc.2 ${HOME}/.bashrc
  else
    info ">>> BASHRC: No changes detected"
    mv ${HOME}/.bashrc.2 ${HOME}/.bashrc
  fi
else
  info ">>> BASHRC: No file detected, creating new file"
  mv ${HOME}/.bashrc.2 ${HOME}/.bashrc
fi
