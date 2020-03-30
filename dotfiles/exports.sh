cat >"${HOME}/.exports.2" <<'EOF'
# Make vim the default editor
export EDITOR=$(which nvim)
export TERM="xterm-256color"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
        shopt -s "$option" 2> /dev/null
done

# Append to the Bash history file, rather than overwriting it
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignoreboth   # leading space hides commands from history
export HISTFILESIZE=50000000     # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="${yellow}"

export TODOTXT_DEFAULT_ACTION=ls

# hidpi for gtk apps
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_DEVICE_PIXEL_RATIO=2

# Set docker to allow untrusted images
export DOCKER_CONTENT_TRUST=0

EOF

if [ -f "${HOME}/.exports" ]; then
  info ">>> Exports: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${HOME}/.exports ${HOME}/.exports.2)" ]; then
    info ">>> Exports: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${HOME}/.exports ${HOME}/.exports.2
    mv ${HOME}/.exports.2 ${HOME}/.exports
  else
    info ">>> Exports: No changes detected"
    mv ${HOME}/.exports.2 ${HOME}/.exports
  fi
else
  info ">>> Exports: No file detected, creating new file"
  mv ${HOME}/.exports.2 ${HOME}/.exports
fi
