cat >"${HOME}/.config/openbox/autostart.2" <<'EOF'
#!/usr/bin/env bash

## Kill if already running
killall -9 xfsettingsd picom polybar mpd dunst ksuperkey xfce4-power-manager clipit

## Restore Wallpaper
nitrogen --restore

## xfce4-settings daemon
xfsettingsd &

## polkit agent
if [[ ! $(pidof xfce-polkit) ]]; then
  /usr/lib/xfce-polkit/xfce-polkit &
fi

## Enable power management
xfce4-power-manager &

## Start Compositing Manager
exec picom &

## Launch Polybar
bash ~/.config/openbox/polybar/launch.sh

## Notification Daemon
exec dunst &

## Start Music Player Daemon
# exec mpd &

## Launch Plank
exec plank &

## Launch Clipboard
exec clipit &

## Thunar Daemon
exec thunar --daemon &

## Enable Numlock
numlockx &

## Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &
EOF

if [ -f "${HOME}/.config/openbox/autostart" ]; then
  info ">>> Openbox Config: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${HOME}/.config/openbox/autostart ${HOME}/.config/openbox/autostart.2)" ]; then
    info ">>> Openbox Config: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${HOME}/.config/openbox/autostart ${HOME}/.config/openbox/autostart.2
    mv ${HOME}/.config/openbox/autostart.2 ${HOME}/.config/openbox/autostart
  else
    info ">>> Openbox Config: No changes detected"
    mv {HOME}/.config/openbox/autostart.2 ${HOME}/.config/openbox/autostart
  fi
else
  info ">>> Openbox Config: No file detected, creating new file"
  mv {HOME}/.config/openbox/autostart.2 ${HOME}/.config/openbox/autostart
fi
