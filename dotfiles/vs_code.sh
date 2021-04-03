if [ -n "$(command -v code)" ]; then
  info ">>> Installing VS Code Extensions"
  EXTENSIONS="aws-scripting-guy.cform \
    bungcip.better-toml \
    CoenraadS.bracket-pair-colorizer \
    dbaeumer.vscode-eslint \
    DSKWRK.vscode-generate-getter-setter \
    eamodio.gitlens \
    eg2.vscode-npm-script \
    Equinusocio.vsc-community-material-theme \
    Equinusocio.vsc-material-theme \
    equinusocio.vsc-material-theme-icons \
    eriklynd.json-tools \
    esbenp.prettier-vscode \
    foxundermoon.shell-format \
    kddejong.vscode-cfn-lint \
    keyboardDrummer.vscode-cloudformation \
    liviuschera.noctis \
    mauve.terraform \
    maximus136.change-string-case \
    miramac.vscode-exec-node \
    ms-azuretools.vscode-docker \
    ms-python.python \
    ms-vscode.Go \
    ms-vscode.Theme-1337 \
    ms-vscode.vscode-typescript-tslint-plugin \
    ms-vsliveshare.vsliveshare \
    PKief.material-icon-theme \
    rbbit.typescript-hero \
    redhat.vscode-yaml \
    shardulm94.trailing-spaces \
    weijunyu.vscode-json-path \
    wwm.better-align \
    yzhang.markdown-all-in-one \
    golang.go \
    hashicorp.terraform \
    justin-grote.better-powershell-syntax-highlighting \
    ms-vscode.powershell \
    zhuangtongfa.material-theme"
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

# if [ -n "${LOCATION}" ]; then
#   cat >"${LOCATION}/settings.json" <<EOF
# {
#   "workbench.colorTheme": "Material Theme Darker High Contrast",
#   "workbench.colorCustomizations": {
#     "terminal.background": "#000000",
#     "terminal.foreground": "#E0E0E0",
#     "terminalCursor.background": "#E0E0E0",
#     "terminalCursor.foreground": "#E0E0E0",
#     "terminal.ansiBlack": "#000000",
#     "terminal.ansiBlue": "#6FB3D2",
#     "terminal.ansiBrightBlack": "#B0B0B0",
#     "terminal.ansiBrightBlue": "#6FB3D2",
#     "terminal.ansiBrightCyan": "#76C7B7",
#     "terminal.ansiBrightGreen": "#A1C659",
#     "terminal.ansiBrightMagenta": "#D381C3",
#     "terminal.ansiBrightRed": "#FB0120",
#     "terminal.ansiBrightWhite": "#FFFFFF",
#     "terminal.ansiBrightYellow": "#FDA331",
#     "terminal.ansiCyan": "#76C7B7",
#     "terminal.ansiGreen": "#A1C659",
#     "terminal.ansiMagenta": "#D381C3",
#     "terminal.ansiRed": "#FB0120",
#     "terminal.ansiWhite": "#E0E0E0",
#     "terminal.ansiYellow": "#FDA331"
#   },
#   "files.autoSave": "onFocusChange",
#   "editor.tabSize": 2,
#   "editor.insertSpaces": true,
#   "editor.detectIndentation": false,
#   "markdown.extension.toc.githubCompatibility": true,
#   "markdown.extension.toc.updateOnSave": true,
#   "workbench.startupEditor": "newUntitledFile",
#   "trailing-spaces.trimOnSave": true,
#   "editor.minimap.enabled": false,
#   "breadcrumbs.enabled": false,
#   "editor.renderWhitespace": "none",
#   "editor.fontFamily": "'Hack'",
#   "window.zoomLevel": 0,
#   "explorer.confirmDelete": false,
#   "[markdown]": {
#     "editor.defaultFormatter": "yzhang.markdown-all-in-one"
#   },
#   "[json]": {
#     "editor.defaultFormatter": "esbenp.prettier-vscode"
#   },
#   "[javascript]": {
#     "editor.defaultFormatter": "esbenp.prettier-vscode"
#   },
#   "typescript.updateImportsOnFileMove.enabled": "always",
#   "[typescript]": {
#     "editor.defaultFormatter": "esbenp.prettier-vscode"
#   },
#   "[jsonc]": {
#     "editor.defaultFormatter": "vscode.json-language-features"
#   },
#   "terraform.indexing": {
#     "enabled": false,
#     "liveIndexing": false,
#     "delay": 500,
#     "exclude": [
#       ".terraform/**/*",
#       "**/.terraform/**/*"
#     ]
#   },
#   "terraform.languageServer": {
#     "enabled": true,
#     "args": []
#   },
#   "[dockerfile]": {
#     "editor.defaultFormatter": "ms-azuretools.vscode-docker"
#   },
#   "editor.fontSize": 16,
#   "go.formatTool": "goimports",
#   // Custom tags for the parser to use
#   "yaml.customTags": [
#     "!And",
#     "!If",
#     "!Not",
#     "!Equals",
#     "!Or",
#     "!FindInMap sequence",
#     "!Base64",
#     "!Cidr",
#     "!Ref",
#     "!Sub",
#     "!GetAtt",
#     "!GetAZs",
#     "!ImportValue",
#     "!Select",
#     "!Select sequence",
#     "!Split",
#     "!Join sequence",
#     "!And sequence",
#     "!If sequence",
#     "!Not sequence",
#     "!Equals sequence",
#     "!Or sequence",
#     "!FindInMap",
#     "!Join",
#     "!Sub sequence",
#     "!ImportValue sequence",
#     "!Split sequence"
#   ],
#   // Enable/disable default YAML formatter (requires restart)
#   "yaml.format.enable": true,
#   "cfnLint.validateUsingJsonSchema": false,
#   "yaml.validate": false,
#   "java.home": "/usr/sbin/java",
#   "[yamlCloudFormation]": {},
#   "workbench.iconTheme": "material-icon-theme",
#   "window.menuBarVisibility": "toggle",
#   "workbench.statusBar.visible": true,
# }
# EOF
# else
#   warning ">>> No VS Code user config found!"
# fi
