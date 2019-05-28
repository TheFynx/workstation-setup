cat >"${HOME}/.gitignore.2" <<'EOF'
# Compiled source #
###################
*.com
*.class
*.dll
*.exe
*.o
*.so

# Temporary files #
###################
*.swp
*.swo
*~

# Packages #
############
*.7z
*.dmg
*.gz
*.iso
*.rar
*.tar
*.zip

# Logs and databases #
######################
*.log
*.sql
*.sqlite

# OS generated files #
######################
.DS_Store*
ehthumbs.db
Icon?
Thumbs.db

EOF

if [ -f "${HOME}/.gitignore" ]; then
  info ">>> GitIgnore: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${HOME}/.gitignore ${HOME}/.gitignore.2)" ]; then
    info ">>> GitIgnore: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${HOME}/.gitignore ${HOME}/.gitignore.2
    mv ${HOME}/.gitignore.2 ${HOME}/.gitignore
  else
    info ">>> GitIgnore: No changes detected"
    mv ${HOME}/.gitignore.2 ${HOME}/.gitignore
  fi
else
  info ">>> GitIgnore: No file detected, creating new file"
  mv ${HOME}/.gitignore.2 ${HOME}/.gitignore
fi
