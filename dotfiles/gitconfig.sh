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

cat >"${USER_HOME}/.gitconfig.2" <<'EOF'
[user]
    name = Levi Smith
    email = levi@fynx.me
    signingkey = 9C9A099512CE70F14DCAC9DA4B45931850933D0E
[core]
    editor = nvim
    autocrlf = input
    whitespace = fix,-indent-with-non-tab,trailing-space,cr-at-eol
    excludesfile = ~/.gitignore
[web]
    browser = google-chrome
[push]
    default = current
[credential]
    helper = cache --timeout=3600
[color]
    ui = auto
[color "branch"]
    current = yellow bold
    local = green bold
    remote = cyan bold
[color "diff"]
    meta = yellow bold
    frag = magenta bold
    old = red bold
    new = green bold
    whitespace = red reverse
[color "status"]
    added = green bold
    changed = yellow bold
    untracked = red bold
[diff]
    tool = vimdiff
[difftool]
    prompt = false
[github]
    user = thefynx
    token = token
[gitflow "prefix"]
    feature = feature-
    release = release-
    hotfix = hotfix-
    support = support-
    versiontag = v
[alias]
    st = status
    ci = commit
    co = checkout
    di = diff
    dc = diff --cached
    aa = add --all
    amend = commit --amend -C HEAD
    l = log --graph --pretty=format:'%Cgreen%h%Cblue%d %C(white)%s %Cblue%an %C(white)[%ar]'
    la = log --all --graph --pretty=format:'%Cgreen%h%Cblue%d %C(white)%s %Cblue%an %C(white)[%ar]'

[commit]
   gpgsign = true

EOF

if [ -f "${USER_HOME}/.gitconfig" ]; then
  info ">>> GitConfig: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${USER_HOME}/.gitconfig ${USER_HOME}/.gitconfig.2)" ]; then
    info ">>> GitConfig: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${USER_HOME}/.gitconfig ${USER_HOME}/.gitconfig.2
    mv ${USER_HOME}/.gitconfig.2 ${USER_HOME}/.gitconfig
  else
    info ">>> GitConfig: No changes detected"
    mv ${USER_HOME}/.gitconfig.2 ${USER_HOME}/.gitconfig
  fi
else
  info ">>> GitConfig: No file detected, creating new file"
  mv ${USER_HOME}/.gitconfig.2 ${USER_HOME}/.gitconfig
fi
