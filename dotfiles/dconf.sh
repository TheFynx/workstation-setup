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

info ">>> Generating DCONF File"

mkdir -p ${USER_HOME}/.custom/

cat >"${USER_HOME}/.custom/dconf.2" <<EOF
[apps/seahorse/listing]
keyrings-selected=['secret-service:///org/freedesktop/secrets/collection/login']

[apps/seahorse/windows/key-manager]
height=476
width=600

[org/cinnamon]
active-display-scale=1.5
alttab-switcher-delay=100
alttab-switcher-style='icons'
applet-cache-updated=1617330063
command-history=['gwe', 'zart', 'flameshot', 'flameshot gui', 'reboot', 'JACK_NO_AUDIO_RESERVATION=1 sonic-pi', 'JACK_NO_AUDIO_RESERVATION=1 sonic-pi', 'export JACK_NO_AUDIO_RESERVATION=1 sonic-pi', 'export JACK_NO_AUDIO_RESERVATION=1; sonic-pi', 'sonic-pi', 'r']
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
device-aliases=['/org/freedesktop/UPower/devices/mouse_hidpp_battery_0:= MX Ergo Multi-Device Trackball']
enabled-applets=['panel1:right:3:systray@cinnamon.org:0', 'panel1:left:0:menu@cinnamon.org:1', 'panel1:left:2:grouped-window-list@cinnamon.org:3', 'panel1:right:4:keyboard@cinnamon.org:4', 'panel1:right:5:notifications@cinnamon.org:5', 'panel1:right:6:removable-drives@cinnamon.org:6', 'panel1:right:8:bluetooth@cinnamon.org:7', 'panel1:right:9:network@cinnamon.org:8', 'panel1:right:10:sound@cinnamon.org:9', 'panel1:right:12:calendar@cinnamon.org:11', 'panel1:right:1:power@cinnamon.org:13', 'panel1:right:0:weather@mockturtl:14']
enabled-desklets=@as []
extension-cache-updated=1594146592
hotcorner-layout=['expo:false:0', 'scale:false:0', 'scale:false:0', 'desktop:false:0']
next-applet-id=15
panel-edit-mode=false
panel-zone-symbolic-icon-sizes='[{"panelId": 1, "left": 28, "center": 28, "right": 16}]'
panels-enabled=['1:0:top']
panels-height=['1:32']
prevent-focus-stealing=true
show-tile-hud=true
startup-animation=false
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
exec='alacritty'

[org/cinnamon/desktop/background]
picture-options='centered'
picture-uri='file:///home/levi/Pictures/simple-subtle-abstract-dark-minimalism-4k-u9.jpg'
primary-color='#000000000000'
secondary-color='#000000000000'

[org/cinnamon/desktop/background/slideshow]
delay=15
image-source='directory:///home/levi/Wallpapers'

[org/cinnamon/desktop/interface]
clock-show-date=true
cursor-blink-time=1200
cursor-size=24
cursor-theme='Paper'
font-name='Noto Sans 12'
gtk-overlay-scrollbars=false
gtk-theme='Adwaita-dark'
icon-theme='Paper'
scaling-factor=uint32 1
text-scaling-factor=1.0
toolkit-accessibility=false

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
maximum-volume=150
volume-sound-enabled=false

[org/cinnamon/desktop/wm/preferences]
focus-mode='click'
min-window-opacity=30
num-workspaces=4
theme='Adapta-Nokto'
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
double-click=472
drag-threshold=8
motion-acceleration=10.0
motion-threshold=1

[org/cinnamon/settings-daemon/peripherals/touchpad]
motion-threshold=1
natural-scroll=false
scrolling-method=1

[org/cinnamon/settings-daemon/peripherals/touchscreen]
orientation-lock=false

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
theme-cache-updated=1617323978

[org/gnome/calculator]
accuracy=9
angle-units='degrees'
base=10
button-mode='basic'
number-format='automatic'
show-thousands=false
show-zeroes=false
source-currency=''
source-units='degree'
target-currency=''
target-units='radian'
window-position=(1185, 539)
word-size=64

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
name-column-width=654
show-path=false
sort-method='name'
sort-type='ascending'

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

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0]
binding='<Super>t'
command='terminator'
name='terminal'

[org/gtk/settings/file-chooser]
date-format='regular'
location-mode='path-bar'
show-hidden=false
show-size-column=true
show-type-column=true
sidebar-width=175
sort-column='name'
sort-directories-first=false
sort-order='ascending'
type-format='category'
window-position=(305, 299)
window-size=(1310, 765)

[org/nemo/desktop]
desktop-layout='false::false'
show-orphaned-desktop-icons=false

[org/nemo/preferences]
show-full-path-titles=true
show-hidden-files=true
show-location-entry=true

[org/nemo/window-state]
geometry='1919x1534+951+32'
maximized=false
sidebar-bookmark-breakpoint=5
start-with-sidebar=true
EOF

if [ -f "${USER_HOME}/.custom/dconf" ]; then
  info ">>> DCONF: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${USER_HOME}/.custom/dconf ${USER_HOME}/.custom/dconf.2)" ]; then
    info ">>> DCONF: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${USER_HOME}/.custom/dconf ${USER_HOME}/.custom/dconf.2
    mv ${USER_HOME}/.custom/dconf.2 ${USER_HOME}/.custom/dconf
    dconf load / <${USER_HOME}/.custom/dconf
  else
    info ">>> DCONF: No changes detected"
    mv ${USER_HOME}/.custom/dconf.2 ${USER_HOME}/.custom/dconf
  fi
else
  info ">>> DCONF: No file detected, creating new file"
  mv ${USER_HOME}/.custom/dconf.2 ${USER_HOME}/.custom/dconf
  dconf load / <${USER_HOME}/.custom/dconf
fi