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

cat >"${USER_HOME}/.functions.2" <<'EOF'
# Cleanup Docker Containers
if [ -n "$(command -v docker)" ]; then
    ## Clean All Non-In Use Docker Items
    dcleanall(){
        docker rm $(docker ps -aq 2>/dev/null) 2>/dev/null
        docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
        docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
    }
fi

# Determine size of a file or total size of a directory
fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh
    else
        local arg=-sh
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@"
    else
        du $arg .[^.]* *
    fi
}

# Run `dig` and display the most useful info
digga() {
    dig +nocmd "$1" any +multiline +noall +answer
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
tre() {
    tree -aC -I '.git' --dirsfirst "$@" | less -FRNX
}

# Get colors in manual pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

# check if uri is up
isup() {
    local uri=$1

    if curl -s --head  --request GET "$uri" | grep "200 OK" > /dev/null ; then
        notify-send --urgency=critical "$uri is down"
    else
        notify-send --urgency=low "$uri is up"
    fi
}

EOF

if [ -f "${USER_HOME}/.functions" ]; then
  info ">>> Functions: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${USER_HOME}/.functions ${USER_HOME}/.functions.2)" ]; then
    info ">>> Functions: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${USER_HOME}/.functions ${USER_HOME}/.functions.2 || true
    mv ${USER_HOME}/.functions.2 ${USER_HOME}/.functions
  else
    info ">>> Functions: No changes detected"
    mv ${USER_HOME}/.functions.2 ${USER_HOME}/.functions
  fi
else
  info ">>> Functions: No file detected, creating new file"
  mv ${USER_HOME}/.functions.2 ${USER_HOME}/.functions
fi
