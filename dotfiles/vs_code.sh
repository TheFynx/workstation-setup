if [ -n "$(command -v code)" ]; then
  info ">>> Installing VS Code Extensions"
  for ext in eamodio.gitlens eg2.vscode-npm-script Equinusocio.vsc-material-theme esbenp.prettier-vscode mauve.terraform ms-python.python ms-vscode.Go PeterJausovec.vscode-docker PKief.material-icon-theme yzhang.markdown-all-in-one; do
    code --install-extension ${ext} > /dev/null 2>&1
  done
fi

if [ -d "${HOME}/.config/Code - OSS/User" ]; then
  LOCATION="${HOME}/.config/Code - OSS/User"
elif [ -d "${HOME}/.config/Code/User" ]; then
  LOCATION="${HOME}/.config/Code/User"
else
  LOCATION=""
fi

if [ -n "${LOCATION}" ]; then
cat > "${LOCATION}/settings.json" << EOF
{
    "workbench.iconTheme": "eq-material-theme-icons-darker",
    "workbench.colorTheme": "Material Theme Darker High Contrast",
    "files.autoSave": "onFocusChange",
    "editor.tabSize": 2,
    "editor.insertSpaces": true,
    "editor.detectIndentation": false
}
EOF
else
  warning ">>> No VS Code user config found!"
fi