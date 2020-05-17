mkdir -p ${HOME}/.config/alacritty/

cat >"${HOME}/.config/alacritty/alacritty.yml.2" <<'EOF'
# Configuration for Alacritty, the GPU enhanced terminal emulator.
window:
  padding:
   x: 0
   y: 10
  decorations: none
  startup_mode: Maximized
scrolling:
  history: 100000
font:
  normal:
    family: "Source Code Pro for Powerline"
  size: 11.0
colors:
  primary:
    background: '#000000'
    foreground: '#B4B7B4'
  normal:
    black:   '#1D1F21'
    red:     '#CC342B'
    green:   '#198844'
    yellow:  '#FBA922'
    blue:    '#3971ED'
    magenta: '#3971ED'
    cyan:    '#A36AC7'
    white:   '#C5C8C6'
  bright:
    black:   '#969896'
    red:     '#CC342B'
    green:   '#198844'
    yellow:  '#FBA922'
    blue:    '#3971ED'
    magenta: '#3971ED'
    cyan:    '#A36AC7'
    white:   '#FFFFFF'
selection:
  semantic_escape_chars: ",│`|:\"' ()[]{}<>\t"
  save_to_clipboard: true
cursor:
  style: Beam
background_opacity: 0.85
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
