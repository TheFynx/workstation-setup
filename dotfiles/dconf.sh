info ">>> Generating DCONF File"

mkdir -p ${HOME}/.custom/

cat >"${HOME}/.custom/dconf.2" <<EOF
[org/cinnamon]
active-display-scale=1.5
alttab-switcher-delay=100
alttab-switcher-style='icons'
desklet-snap-interval=25
desktop-effects-close-effect='traditional'
desktop-effects-close-time=120
desktop-effects-close-transition='easeOutQuad'
desktop-effects-map-effect='traditional'
desktop-effects-map-time=100
desktop-effects-map-transition='easeOutQuad'
desktop-effects-maximize-effect='none'
desktop-effects-maximize-time=100
desktop-effects-maximize-transition='easeInExpo'
desktop-effects-minimize-effect='traditional'
desktop-effects-minimize-time=160
desktop-effects-minimize-transition='easeInQuad'
desktop-effects-style='cinnamon'
desktop-effects-tile-effect='none'
desktop-effects-tile-time=100
desktop-effects-tile-transition='easeInQuad'
desktop-effects-unmaximize-effect='none'
desktop-effects-unmaximize-time=100
desktop-effects-unmaximize-transition='easeNone'
enabled-applets=['panel1:right:0:systray@cinnamon.org:0', 'panel1:left:0:menu@cinnamon.org:1', 'panel1:left:2:grouped-window-list@cinnamon.org:3', 'panel1:right:1:keyboard@cinnamon.org:4', 'panel1:right:2:notifications@cinnamon.org:5', 'panel1:right:3:removable-drives@cinnamon.org:6', 'panel1:right:5:bluetooth@cinnamon.org:7', 'panel1:right:6:network@cinnamon.org:8', 'panel1:right:7:sound@cinnamon.org:9', 'panel1:right:8:power@cinnamon.org:10', 'panel1:right:9:calendar@cinnamon.org:11']
enabled-desklets=@as []
hotcorner-layout=['expo:false:0', 'scale:false:0', 'scale:false:0', 'desktop:false:0']
next-applet-id=12
panel-edit-mode=false
panels-enabled=['1:0:top']
prevent-focus-stealing=true
workspace-osd-duration=400
workspace-osd-x=50
workspace-osd-y=50

[org/cinnamon/cinnamon-session]
quit-time-delay=60

[org/cinnamon/desktop/a11y/applications]
screen-keyboard-enabled=false
screen-reader-enabled=false

[org/cinnamon/desktop/a11y/keyboard]
bouncekeys-beep-reject=true
bouncekeys-delay=300
bouncekeys-enable=false
disable-timeout=120
enable=false
feature-state-change-beep=false
mousekeys-accel-time=1200
mousekeys-enable=false
mousekeys-init-delay=160
mousekeys-max-speed=750
slowkeys-beep-accept=true
slowkeys-beep-press=true
slowkeys-beep-reject=false
slowkeys-delay=300
slowkeys-enable=false
stickykeys-enable=false
stickykeys-modifier-beep=true
stickykeys-two-key-off=true
timeout-enable=false

[org/gnome/desktop/wm/preferences]
action-middle-click-titlebar='lower'
num-workspaces=4

[org/cinnamon/desktop/applications/terminal]
exec='terminator'

[org/cinnamon/desktop/background]
picture-options='none'
primary-color='#2e2e34343636'
secondary-color='#000000000000'

[org/cinnamon/desktop/interface]
clock-show-date=true
cursor-blink-time=1200
cursor-size=24
cursor-theme='Adwaita'
font-name='Sans 12'
gtk-overlay-scrollbars=false
gtk-theme='Materia-dark'
icon-theme='EvoPop'
scaling-factor=uint32 0
text-scaling-factor=1.0
toolkit-accessibility=false

[org/cinnamon/desktop/keybindings/media-keys]
calculator=['XF86Calculator', '<Super>c']
next=['AudioNext']
play=['AudioPlay']
previous=['AudioPrev']
terminal=['<Super>t']

[org/cinnamon/desktop/media-handling]
autorun-never=false
autorun-x-content-ignore=['x-content/bootable-media']
autorun-x-content-open-folder=@as []
autorun-x-content-start-app=['x-content/unix-software', 'x-content/bootable-media']

[org/cinnamon/desktop/notifications]
remove-old=true

[org/cinnamon/desktop/sound]
event-sounds=false
volume-sound-enabled=false

[org/cinnamon/desktop/wm/preferences]
focus-mode='mouse'
min-window-opacity=30
theme='Materia-dark'
titlebar-font='Sans Bold 12'

[org/cinnamon/muffin]
desktop-effects=false
resize-threshold=24
sync-to-vblank=true
tile-hud-threshold=25
workspace-cycle=true
workspaces-only-on-primary=true

[org/cinnamon/settings-daemon/peripherals/mouse]
custom-acceleration=true
custom-threshold=false
double-click=400
drag-threshold=8
motion-acceleration=10.0
motion-threshold=1

[org/cinnamon/settings-daemon/peripherals/touchpad]
motion-threshold=1
natural-scroll=false
scrolling-method=1
touchpad-enabled=false

[org/cinnamon/sounds]
login-enabled=false
logout-enabled=false
plug-enabled=false
switch-enabled=false
tile-enabled=false
unplug-enabled=false

[org/cinnamon/theme]
name='Materia-dark'
theme-cache-updated=1559228770

[org/gnome/desktop/background]
color-shading-type='solid'
picture-options='zoom'
primary-color='#000000000000'
secondary-color='#000000000000'
show-desktop-icons=false

[org/gnome/desktop/interface]
clock-show-date=true
cursor-theme='breeze-cursor'
gtk-im-module='gtk-im-context-simple'
gtk-theme='Materia'
icon-theme='Moka'
monospace-font-name='Hack 10'
scaling-factor=uint32 0
toolkit-accessibility=false

[org/gnome/desktop/screensaver]
color-shading-type='solid'
idle-activation-enabled=false
picture-options='zoom'
primary-color='#000000000000'
secondary-color='#000000000000'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0]
binding='<Super>t'
command='terminator'
name='terminal'

[org/nemo/preferences]
show-hidden-files=true
show-location-entry=true
EOF

if [ -f "${HOME}/.custom/dconf" ]; then
  info ">>> DCONF: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${HOME}/.custom/dconf ${HOME}/.custom/dconf.2)" ]; then
    info ">>> DCONF: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${HOME}/.custom/dconf ${HOME}/.custom/dconf.2
    mv ${HOME}/.custom/dconf.2 ${HOME}/.custom/dconf
    dconf load / <${HOME}/.custom/dconf
  else
    info ">>> DCONF: No changes detected"
    mv ${HOME}/.custom/dconf.2 ${HOME}/.custom/dconf
  fi
else
  info ">>> DCONF: No file detected, creating new file"
  mv ${HOME}/.custom/dconf.2 ${HOME}/.custom/dconf
  dconf load / <${HOME}/.custom/dconf
fi