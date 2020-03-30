cat >"${HOME}/.bashrc.2" <<'EOF'
# .bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# For Travis CLI
[ -f "${HOME}/.travis/travis.sh" ] && source ${HOME}/.travis/travis.sh

# Source global definitions
if [ -f "/etc/bashrc" ]; then
  . /etc/bashrc
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,aliases,functions,path,extra,exports}; do
        [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

# User configuration
if [ -d "~/.ssh/priv_keys" ]; then
  ssh-add ~/.ssh/priv_keys/id_rsa >/dev/null 2>&1
  ssh-add ~/.ssh/priv_keys/git >/dev/null 2>&1
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{aliases,functions,path,extra,exports}; do
        [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

function _update_ps1() {
    eval "$(powerline-go -error $? -shell bash -eval -cwd-max-depth 4 -numeric-exit-codes -modules time,cwd,exit -modules-right git)"
}

if [ "$TERM" != "linux" ] && [ -n "$(command -v powerline-go)" ]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

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
