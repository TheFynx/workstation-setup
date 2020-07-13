info ">>> Generating DCONF File"

mkdir -p ${HOME}/.custom/

cat >"${HOME}/.custom/dconf.2" <<EOF
[org/cinnamon]
active-display-scale=1.5
alttab-switcher-delay=100
alttab-switcher-style='icons'
applet-cache-updated=1569871789
command-history=['gwe', 'r', 'zart', 'flameshot', 'flameshot gui', 'reboot']
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
enabled-applets=['panel1:right:1:systray@cinnamon.org:0', 'panel1:left:0:menu@cinnamon.org:1', 'panel1:left:2:grouped-window-list@cinnamon.org:3', 'panel1:right:2:keyboard@cinnamon.org:4', 'panel1:right:3:notifications@cinnamon.org:5', 'panel1:right:4:removable-drives@cinnamon.org:6', 'panel1:right:6:bluetooth@cinnamon.org:7', 'panel1:right:7:network@cinnamon.org:8', 'panel1:right:8:sound@cinnamon.org:9', 'panel1:right:9:power@cinnamon.org:10', 'panel1:right:10:calendar@cinnamon.org:11']
enabled-desklets=@as []
extension-cache-updated=1594146592
hotcorner-layout=['expo:false:0', 'scale:false:0', 'scale:false:0', 'desktop:false:0']
next-applet-id=13
panel-edit-mode=false
panel-zone-symbolic-icon-sizes='[{"panelId": 1, "left": 28, "center": 28, "right": 16}]'
panels-enabled=['1:0:top']
panels-height=['1:32']
prevent-focus-stealing=true
workspace-osd-duration=400
workspace-osd-visible=true
workspace-osd-x=50
workspace-osd-y=50

[org/cinnamon/cinnamon-session]
quit-delay-toggle=false
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

[org/cinnamon/desktop/a11y/mouse]
dwell-threshold=10
dwell-time=1.2
secondary-click-time=1.2

[org/cinnamon/desktop/applications/calculator]
exec='gnome-calculator'

[org/cinnamon/desktop/applications/terminal]
exec='terminator'

[org/cinnamon/desktop/background]
picture-options='centered'
picture-uri='file:///home/levi/Pictures/simple-subtle-abstract-dark-minimalism-4k-u9.jpg'
primary-color='#07ae07ae07ae'
secondary-color='#000000000000'

[org/cinnamon/desktop/background/slideshow]
delay=15
image-source='directory:///home/levi/Pictures'

[org/cinnamon/desktop/interface]
clock-show-date=true
cursor-blink-time=1200
cursor-size=24
cursor-theme='Adwaita'
font-name='Noto Sans 12'
gtk-overlay-scrollbars=false
gtk-theme='Materia-dark'
icon-theme='breeze-dark'
scaling-factor=uint32 1
text-scaling-factor=1.0
toolkit-accessibility=false

[org/cinnamon/desktop/keybindings]
custom-list=['custom0']

[org/cinnamon/desktop/keybindings/custom-keybindings/custom0]
binding=['Print']
command='"/usr/sbin/flameshot gui"'
name='Screenshot'

[org/cinnamon/desktop/keybindings/media-keys]
calculator=['XF86Calculator', '<Super>c']
next=['AudioNext']
play=['AudioPlay']
previous=['AudioPrev']
screenshot=@as []
terminal=['<Super>t']

[org/cinnamon/desktop/media-handling]
autorun-never=false
autorun-x-content-ignore=['x-content/bootable-media', 'x-content/blank-dvd']
autorun-x-content-open-folder=@as []
autorun-x-content-start-app=['x-content/unix-software', 'x-content/bootable-media', 'x-content/blank-dvd']

[org/cinnamon/desktop/notifications]
remove-old=true

[org/cinnamon/desktop/screensaver]
lock-delay=uint32 30

[org/cinnamon/desktop/session]
idle-delay=uint32 2700

[org/cinnamon/desktop/sound]
event-sounds=false
volume-sound-enabled=false

[org/cinnamon/desktop/wm/preferences]
focus-mode='click'
min-window-opacity=30
num-workspaces=4
theme='Materia-dark'
titlebar-font='Noto Sans 12'
workspace-names=@as []

[org/cinnamon/muffin]
desktop-effects=false
resize-threshold=24
sync-method='fallback'
sync-to-vblank=true
tile-hud-threshold=25
workspace-cycle=true
workspaces-only-on-primary=true

[org/cinnamon/settings-daemon/peripherals/keyboard]
delay=uint32 500
numlock-state='on'
repeat-interval=uint32 30

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

[org/cinnamon/settings-daemon/plugins/power]
sleep-display-ac=3600

[org/cinnamon/sounds]
login-enabled=false
logout-enabled=false
plug-enabled=false
switch-enabled=false
tile-enabled=false
unplug-enabled=false

[org/cinnamon/theme]
name='Materia-dark'
symbolic-relative-size=0.67000000000000004
theme-cache-updated=1559228770

[org/gnome/desktop/a11y/applications]
screen-keyboard-enabled=false
screen-reader-enabled=false

[org/gnome/desktop/a11y/mouse]
dwell-click-enabled=false
dwell-threshold=10
dwell-time=1.2
secondary-click-enabled=false
secondary-click-time=1.2

[org/gnome/desktop/background]
color-shading-type='solid'
picture-options='zoom'
primary-color='#000000000000'
secondary-color='#000000000000'
show-desktop-icons=false

[org/gnome/desktop/interface]
clock-show-date=true
cursor-theme='breeze-cursor'
document-font-name='Noto Sans 11'
gtk-im-module='gtk-im-context-simple'
gtk-theme='Materia'
icon-theme='Moka'
monospace-font-name='Source Code Pro 10'
scaling-factor=uint32 0
toolkit-accessibility=false

[org/gnome/desktop/screensaver]
color-shading-type='solid'
idle-activation-enabled=false
picture-options='zoom'
primary-color='#000000000000'
secondary-color='#000000000000'

[org/gnome/desktop/wm/preferences]
action-middle-click-titlebar='lower'
num-workspaces=4

[org/gnome/eog/view]
background-color='rgb(0,0,0)'
use-background-color=true

[org/gnome/file-roller/dialogs/extract]
recreate-folders=true
skip-newer=false

[org/gnome/file-roller/listing]
list-mode='as-folder'
name-column-width=378
show-path=false
sort-method='name'
sort-type='descending'

[org/gnome/file-roller/ui]
sidebar-width=200
window-height=480
window-width=909

[org/gnome/gedit/plugins]
active-plugins=['filebrowser', 'time', 'docinfo', 'spell', 'modelines']

[org/gnome/gedit/preferences/ui]
show-tabs-mode='auto'

[org/gnome/gedit/state/window]
bottom-panel-size=140
side-panel-active-page='GeditWindowDocumentsPanel'
side-panel-size=200
size=(900, 700)
state=87168

[org/gnome/gnome-screenshot]
border-effect='none'
delay=0
include-border=true
include-pointer=false
last-save-directory='file:///home/levi/Pictures'

[org/gnome/nm-applet]
disable-connected-notifications=true

[org/gnome/nm-applet/eap/87635ad5-ea33-4533-853e-71ab40d8d0c5]
ignore-ca-cert=false
ignore-phase2-ca-cert=false

[org/gnome/nm-applet/eap/88ecff4a-11fd-45f4-8851-9aa69b83b772]
ignore-ca-cert=false
ignore-phase2-ca-cert=false

[org/gnome/nm-applet/eap/98088241-1f5b-4a8a-b87b-1509595b8dc8]
ignore-ca-cert=false
ignore-phase2-ca-cert=false

[org/gnome/nm-applet/eap/a3c3858c-b046-4a86-8ec2-e7d1741f47b4]
ignore-ca-cert=false
ignore-phase2-ca-cert=false

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0]
binding='<Super>t'
command='terminator'
name='terminal'

[org/gtk/settings/color-chooser]
custom-colors=[(0.030000000000000002, 0.030000000000000002, 0.030000000000000002, 1.0)]
selected-color=(true, 0.030000000000000002, 0.030000000000000002, 0.030000000000000002, 1.0)
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