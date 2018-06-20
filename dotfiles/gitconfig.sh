cat > "${HOME}/.gitconfig.2" << 'EOF'
[user]
    name = Levi Smith
    email = levi@fynx.me
[core]
    editor = nvim
    autocrlf = input
    whitespace = fix,-indent-with-non-tab,trailing-space,cr-at-eol
    excludesfile = ~/.gitignore
[web]
    browser = google-chrome
[push]
    default = matching
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

EOF

if [ -f "${HOME}/.gitconfig" ]; then
  info ">>> GitConfig: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${HOME}/.gitconfig ${HOME}/.gitconfig.2)" ]; then
    info ">>> GitConfig: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${HOME}/.gitconfig ${HOME}/.gitconfig.2
    mv ${HOME}/.gitconfig.2 ${HOME}/.gitconfig
  else
    info ">>> GitConfig: No changes detected"
    mv ${HOME}/.gitconfig.2 ${HOME}/.gitconfig
  fi
else
  info ">>> GitConfig: No file detected, creating new file"
  mv ${HOME}/.gitconfig.2 ${HOME}/.gitconfig
fi
