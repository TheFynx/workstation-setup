cat > "${HOME}/.bash_profile.2" << 'EOF'
if [ -f "${HOME}/.bashrc" ] ; then
  source ${HOME}/.bashrc
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,aliases,functions,path,extra,exports}; do
        [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Add tab completion for SSH hostnames based on ~/.ssh/config
# ignoring wildcards
[[ -e "${HOME}/.ssh/config" ]] && complete -o "default" \
        -o "nospace" \
        -W "$(grep "^Host" ~/.ssh/config | \
        grep -v "[?*]" | cut -d " " -f2 | \
        tr ' ' '\n')" scp sftp ssh

EOF

if [ -f "${HOME}/.bash_profile" ]; then
  info ">>> BASH Profile: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${HOME}/.bash_profile ${HOME}/.bash_profile.2)" ]; then
    info ">>> BASH Profile: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${HOME}/.bash_profile ${HOME}/.bash_profile.2
    mv ${HOME}/.bash_profile.2 ${HOME}/.bash_profile
  else
    info ">>> BASH Profile: No changes detected"
    mv ${HOME}/.bash_profile.2 ${HOME}/.bash_profile
  fi
else
  info ">>> BASH Profile: No file detected, creating new file"
  mv ${HOME}/.bash_profile.2 ${HOME}/.bash_profile
fi
