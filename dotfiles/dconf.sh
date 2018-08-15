info ">>> Generating DCONF File"

mkdir -p ${HOME}/.custom/

cat > "${HOME}/.custom/dconf.2" << EOF
[com/solus-project/budgie-panel]
dark-theme=true
migration-level=1
panels=['622508c4-6f5c-11e8-bfef-c86000757626']

[com/solus-project/budgie-panel/panels/{622508c4-6f5c-11e8-bfef-c86000757626}]
size=39
dock-mode=false
enable-shadow=true
applets=['62648b7a-6f5c-11e8-bfef-c86000757626', '626590b0-6f5c-11e8-bfef-c86000757626', '726d0af2-701e-11e8-81b9-c86000757626', '625958d6-6f5c-11e8-bfef-c86000757626', '6259b880-6f5c-11e8-bfef-c86000757626', '624f
3a18-6f5c-11e8-bfef-c86000757626', '6243016c-6f5c-11e8-bfef-c86000757626', '626644ec-6f5c-11e8-bfef-c86000757626', '62452a5a-6f5c-11e8-bfef-c86000757626', 'b17c8866-6f5c-11e8-bfef-c86000757626']
transparency='none'
location='top'
theme-regions=true

[com/solus-project/budgie-panel/instance/icon-tasklist/{62452a5a-6f5c-11e8-bfef-c86000757626}]
pinned-launchers=['org.gnome.Nautilus.desktop', 'simplenote_simplenote.desktop', 'spotify.desktop', 'vscode-oss.desktop', 'insomnia_insomnia.desktop', 'postman_postman.desktop', 'google-chrome.desktop']

[com/solus-project/budgie-panel/instance/workspaces/{726d0af2-701e-11e8-81b9-c86000757626}]
addbutton-visibility='never'

[com/solus-project/budgie-panel/applets/{62452a5a-6f5c-11e8-bfef-c86000757626}]
position=1
alignment='start'
name='Icon Task List'

[com/solus-project/budgie-panel/applets/{626644ec-6f5c-11e8-bfef-c86000757626}]
position=6
alignment='end'
name='Raven Trigger'

[com/solus-project/budgie-panel/applets/{b17c8866-6f5c-11e8-bfef-c86000757626}]
position=2
alignment='end'
name='Separator'

[com/solus-project/budgie-panel/applets/{624f3a18-6f5c-11e8-bfef-c86000757626}]
position=1
alignment='end'
name='System Tray'

[com/solus-project/budgie-panel/applets/{726d0af2-701e-11e8-81b9-c86000757626}]
position=0
alignment='end'
name='Workspace Switcher'

[com/solus-project/budgie-panel/applets/{6243016c-6f5c-11e8-bfef-c86000757626}]
position=0
alignment='start'
name='Budgie Menu'

[com/solus-project/budgie-panel/applets/{626590b0-6f5c-11e8-bfef-c86000757626}]
position=4
alignment='end'
name='Clock'

[com/solus-project/budgie-panel/applets/{625958d6-6f5c-11e8-bfef-c86000757626}]
position=5
alignment='end'
name='Notifications'

[com/solus-project/budgie-panel/applets/{6259b880-6f5c-11e8-bfef-c86000757626}]
position=3
alignment='end'
name='Status Indicator'

[com/solus-project/budgie-panel/applets/{62648b7a-6f5c-11e8-bfef-c86000757626}]
position=7
alignment='end'
name='User Indicator'

[com/solus-project/budgie-wm]
button-layout='appmenu:minimize,maximize,close'

[com/solus-project/software-center]
last-checked=int64 1534361334
update-type='security-only'

[com/solus-project/budgie-wm]
button-layout='appmenu:minimize,maximize,close'

[org/gnome/desktop/wm/preferences]
num-workspaces=${WORKSPACE_COUNT}
action-middle-click-titlebar='lower'

[com/solus-project/software-center]
last-checked=int64 1529519046
update-type='security-only'

[org/onboard]
system-theme-associations={'HighContrast': 'HighContrast', 'HighContrastInverse': 'HighContrastInverse', 'LowContrast': 'LowContrast', 'ContrastHighInverse': 'HighContrastInverse', 'Default': ''}
schema-version='2.3'
use-system-defaults=false

[org/onboard/theme-settings]
key-size=94.0
key-stroke-width=0.0
key-gradient-direction=-3.0
color-scheme='/usr/share/onboard/themes/Charcoal.colors'
key-fill-gradient=8.0
key-style='gradient'
key-stroke-gradient=8.0
roundrect-radius=20.0

[org/gnome/settings-daemon/plugins/power]
sleep-inactive-ac-timeout=7200

[org/gnome/settings-daemon/plugins/color]
night-light-enabled=false
night-light-last-coordinates=(37.027099999999997, -93.319299999999998)

[org/gnome/settings-daemon/plugins/media-keys]
custom-keybindings=['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']
www='<Super>w'
calculator='<Primary><Super>c'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1]
binding='<Super>e'
command='code-oss'
name='vscode'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0]
binding='<Super>t'
command='terminator'
name='terminal'

[org/gnome/settings-daemon/plugins/xsettings]
overrides={'Gtk/ShellShowsAppMenu': <0>, 'Gtk/DecorationLayout': <'menu:minimize,maximize,close'>}
hinting='slight'

[org/gnome/settings-daemon/peripherals/keyboard]
numlock-state='on'

[org/gnome/calendar]
window-position=(0, 34)
active-view='month'
window-maximized=true
window-size=(3440, 1366)

[org/gnome/desktop/interface]
clock-show-date=true
monospace-font-name='Droid Sans Mono for Powerline 10'
gtk-im-module='gtk-im-context-simple'
cursor-theme='breeze-cursor'
gtk-theme='Materia'
icon-theme='Moka'

[org/gnome/desktop/media-handling]
autorun-never=true

[org/gnome/desktop/screensaver]
color-shading-type='solid'
primary-color='#000000000000'
picture-options='zoom'
secondary-color='#000000000000'

[org/gnome/desktop/background]
show-desktop-icons=false
color-shading-type='solid'
primary-color='#000000000000'
picture-options='zoom'
secondary-color='#000000000000'

[org/gnome/eog/view]
background-color='rgb(0,0,0)'
use-background-color=true
EOF

if [ -f "${HOME}/.custom/dconf" ]; then
  info ">>> DCONF: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${HOME}/.custom/dconf ${HOME}/.custom/dconf.2)" ]; then
    info ">>> DCONF: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${HOME}/.custom/dconf ${HOME}/.custom/dconf.2
    mv ${HOME}/.custom/dconf.2 ${HOME}/.custom/dconf
    dconf load / < ${HOME}/.custom/dconf
  else
    info ">>> DCONF: No changes detected"
    mv ${HOME}/.custom/dconf.2 ${HOME}/.custom/dconf
  fi
else
  info ">>> DCONF: No file detected, creating new file"
  mv ${HOME}/.custom/dconf.2 ${HOME}/.custom/dconf
  dconf load / < ${HOME}/.custom/dconf
fi
