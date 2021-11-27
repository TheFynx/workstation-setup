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

mkdir -p ${USER_HOME}/.config/alacritty/

cat >"${USER_HOME}/.config/alacritty/alacritty.yml.2" <<'EOF'
import:
  - ~/.config/alacritty/colors.yml
  - ~/.config/alacritty/fonts.yml
## Set environment variables
env:
  TERM: alacritty
  WINIT_X11_SCALE_FACTOR: '1.0'
window:
  padding:
   x: 5
   y: 5
  decorations: none
  startup_mode: Windowed
scrolling:
  history: 100000
selection:
  semantic_escape_chars: ",│`|:\"' ()[]{}<>\t"
  save_to_clipboard: true
cursor:
  style: Beam
background_opacity: 0.85
live_config_reload: true
EOF

if [ -f "${USER_HOME}/.config/alacritty/alacritty.yml" ]; then
  info ">>> Alacritty: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${USER_HOME}/.config/alacritty/alacritty.yml ${USER_HOME}/.config/alacritty/alacritty.yml.2)" ]; then
    info ">>> Alacritty: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${USER_HOME}/.config/alacritty/alacritty.yml ${USER_HOME}/.config/alacritty/alacritty.yml.2
    mv ${USER_HOME}/.config/alacritty/alacritty.yml.2 ${USER_HOME}/.config/alacritty/alacritty.yml
  else
    info ">>> Alacritty: No changes detected"
    mv ${USER_HOME}/.config/alacritty/alacritty.yml.2 ${USER_HOME}/.config/alacritty/alacritty.yml
  fi
else
  info ">>> Alacritty: No file detected, creating new file"
  mv ${USER_HOME}/.config/alacritty/alacritty.yml.2 ${USER_HOME}/.config/alacritty/alacritty.yml
fi

cat >"${USER_HOME}/.config/alacritty/colors.yml.2" <<'EOF'
colors:
  primary:
    background: '#131616'
    foreground: '#B4B7B4'
  cursor:
    text:   '#f5f5f5'
    cursor: '#f5f5f5'
  normal:
    black:   '#2c2c2c'
    blue:    '#3d97e2'
    cyan:    '#27dfd7'
    green:   '#68c256'
    magenta: '#730073'
    orange:  '#ef844b'
    red:     '#e05a4f'
    white:   '#cecece'
    yellow:  '#efd64b'
  bright:
    black:   '#393939'
    blue:    '#53a3e5'
    cyan:    '#3de2db'
    green:   '#79c969'
    magenta: '#8d008d'
    orange:  '#f19462'
    red:     '#e46e65'
    white:   '#dbdbdb'
    yellow:  '#f1db62'
EOF

if [ -f "${USER_HOME}/.config/alacritty/colors.yaml" ]; then
  info ">>> Alacritty Colors: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${USER_HOME}/.config/alacritty/colors.yaml ${USER_HOME}/.config/alacritty/colors.yaml.2)" ]; then
    info ">>> Alacritty Colors: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${USER_HOME}/.config/alacritty/colors.yaml ${USER_HOME}/.config/alacritty/colors.yaml.2
    mv ${USER_HOME}/.config/alacritty/colors.yaml.2 ${USER_HOME}/.config/alacritty/colors.yaml
  else
    info ">>> Alacritty Colors: No changes detected"
    mv ${USER_HOME}/.config/alacritty/colors.yaml.2 ${USER_HOME}/.config/alacritty/colors.yaml
  fi
else
  info ">>> Alacritty Colors: No file detected, creating new file"
  mv ${USER_HOME}/.config/alacritty/colors.yaml.2 ${USER_HOME}/.config/alacritty/colors.yaml
fi

cat >"${USER_HOME}/.config/alacritty/fonts.yaml.2" <<'EOF'
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
EOF

if [ -f "${USER_HOME}/.config/alacritty/fonts.yaml" ]; then
  info ">>> Alacritty Fonts: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${USER_HOME}/.config/alacritty/fonts.yaml ${USER_HOME}/.config/alacritty/fonts.yaml.2)" ]; then
    info ">>> Alacritty Fonts: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${USER_HOME}/.config/alacritty/fonts.yaml ${USER_HOME}/.config/alacritty/fonts.yaml.2
    mv ${USER_HOME}/.config/alacritty/fonts.yaml.2 ${USER_HOME}/.config/alacritty/fonts.yaml
  else
    info ">>> Alacritty Fonts: No changes detected"
    mv ${USER_HOME}/.config/alacritty/fonts.yaml.2 ${USER_HOME}/.config/alacritty/fonts.yaml
  fi
else
  info ">>> Alacritty Fonts: No file detected, creating new file"
  mv ${USER_HOME}/.config/alacritty/fonts.yaml.2 ${USER_HOME}/.config/alacritty/fonts.yaml
fi

### Archived

# window:
#   padding:
#    x: 5
#    y: 5
#   decorations: none
#   startup_mode: Windowed
# scrolling:
#   history: 100000
# font:
#   normal:
#     family: "SauceCodePro Nerd Font Mono"
#   bold:
#     family: "SauceCodePro Nerd Font Mono"
#   italic:
#     family: "SauceCodePro Nerd Font Mono"
#   bold_italic:
#     family: "SauceCodePro Nerd Font Mono"
#   size: 12
# colors:
#   primary:
#     background: '#000000'
#     foreground: '#B4B7B4'
#   cursor:
#     text:   '0xf9e7c4'
#     cursor: '0xf9e7c4'
#   normal:
#     black:   '0x282a2e'
#     blue:    '0x5f819d'
#     cyan:    '0x5e8d87'
#     green:   '0x8c9440'
#     magenta: '0x85678f'
#     orange:  '0xcc6953'
#     red:     '0xa54242'
#     white:   '0x707880'
#     yellow:  '0xde935f'
#   bright:
#     black:   '0x373b41'
#     blue:    '0x81a2be'
#     cyan:    '0x8abeb7'
#     green:   '0xb5bd68'
#     magenta: '0xb294bb'
#     red:     '0xcc6666'
#     white:   '0xc5c8c6'
#     yellow:  '0xf0c674'
# selection:
#   semantic_escape_chars: ",│`|:\"' ()[]{}<>\t"
#   save_to_clipboard: true
# cursor:
#   style: Beam
# background_opacity: 0.85
# live_config_reload: true
