cat > "${HOME}/.bash_profile" << 'EOF'
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
