if [ -n "$(command -v code)" ]; then
  info ">>> Installing VS Code Extensions"
  EXTENSIONS="bungcip.better-toml \
    CoenraadS.bracket-pair-colorizer \
    dbaeumer.vscode-eslint \
    eamodio.gitlens \
    eg2.vscode-npm-script \
    eriklynd.json-tools \
    esbenp.prettier-vscode \
    foxundermoon.shell-format \
    mauve.terraform \
    maximus136.change-string-case \
    ms-python.python \
    ms-vscode.Go \
    ms-vscode.Theme-1337 \
    PeterJausovec.vscode-docker \
    PKief.material-icon-theme \
    shardulm94.trailing-spaces \
    weijunyu.vscode-json-path \
    wwm.better-align \
    yzhang.markdown-all-in-one"
  for ext in ${EXTENSIONS}; do
    code --install-extension ${ext} >/dev/null 2>&1
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
  cat >"${LOCATION}/settings.json" <<EOF
{
    "workbench.iconTheme": "material-icon-theme",
    "workbench.colorTheme": "1337",
    "files.autoSave": "onFocusChange",
    "editor.tabSize": 2,
    "editor.insertSpaces": true,
    "editor.detectIndentation": false,
    "markdown.extension.toc.githubCompatibility": true,
    "markdown.extension.toc.updateOnSave": true,
    "workbench.startupEditor": "newUntitledFile",
    "trailing-spaces.trimOnSave": true,
    "workbench.colorCustomizations": {},
    "editor.minimap.enabled": false,
    "breadcrumbs.enabled": false,
    "editor.renderWhitespace": "none",
    "editor.fontFamily": "'Hack'",
    "window.zoomLevel": 0,
    "explorer.confirmDelete": false,
    "[markdown]": {
      "editor.defaultFormatter": "yzhang.markdown-all-in-one"
    },
    "[json]": {
      "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[javascript]": {
      "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
}
EOF
else
  warning ">>> No VS Code user config found!"
fi
