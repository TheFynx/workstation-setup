mkdir -p ${HOME}/.config/alacritty/

cat >"${HOME}/.config/alacritty/alacritty.yml.2" <<'EOF'
# Configuration for Alacritty, the GPU enhanced terminal emulator.
window:
  padding:
   x: 5
   y: 5
  decorations: none
  startup_mode: Windowed
scrolling:
  history: 100000
font:
  normal:
    family: "SauceCodePro Nerd Font Mono"
  bold:
    family: "SauceCodePro Nerd Font Mono"
  italic:
    family: "SauceCodePro Nerd Font Mono"
  bold_italic:
    family: "SauceCodePro Nerd Font Mono"
  size: 12
colors:
  primary:
    background: '#000000'
    foreground: '#B4B7B4'
  cursor:
    text:   '0xf9e7c4'
    cursor: '0xf9e7c4'
  normal:
    black:   '0x282a2e'
    blue:    '0x5f819d'
    cyan:    '0x5e8d87'
    green:   '0x8c9440'
    magenta: '0x85678f'
    orange:  '0xcc6953'
    red:     '0xa54242'
    white:   '0x707880'
    yellow:  '0xde935f'
  bright:
    black:   '0x373b41'
    blue:    '0x81a2be'
    cyan:    '0x8abeb7'
    green:   '0xb5bd68'
    magenta: '0xb294bb'
    red:     '0xcc6666'
    white:   '0xc5c8c6'
    yellow:  '0xf0c674'
selection:
  semantic_escape_chars: ",│`|:\"' ()[]{}<>\t"
  save_to_clipboard: true
cursor:
  style: Beam
background_opacity: 0.85
live_config_reload: true
EOF

if [ -f "${HOME}/.config/alacritty/alacritty.yml" ]; then
  info ">>> Alacritty: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${HOME}/.config/alacritty/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml.2)" ]; then
    info ">>> Alacritty: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${HOME}/.config/alacritty/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml.2
    mv ${HOME}/.config/alacritty/alacritty.yml.2 ${HOME}/.config/alacritty/alacritty.yml
  else
    info ">>> Alacritty: No changes detected"
    mv ${HOME}/.config/alacritty/alacritty.yml.2 ${HOME}/.config/alacritty/alacritty.yml
  fi
else
  info ">>> Alacritty: No file detected, creating new file"
  mv ${HOME}/.config/alacritty/alacritty.yml.2 ${HOME}/.config/alacritty/alacritty.yml
fi
