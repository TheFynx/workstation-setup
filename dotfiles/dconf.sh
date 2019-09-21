info ">>> Generating DCONF File"

mkdir -p ${HOME}/.custom/

cat >"${HOME}/.custom/dconf.2" <<EOF
[apps/light-locker]
idle-hint=false
late-locking=false
lock-after-screensaver=uint32 5
lock-on-lid=false
lock-on-suspend=true

[apps/psensor]
graph-alpha-channel-enabled=false
graph-background-alpha=1.0
graph-background-color='#e8f4e8f4a8f5'
graph-foreground-color='#000000000000'
graph-monitoring-duration=20
graph-smooth-curves-enabled=true
graph-update-interval=2
interface-hide-on-startup=true
interface-window-divider-pos=0
interface-window-h=571
interface-window-restore-enabled=true
interface-window-w=1250
interface-window-x=1458
interface-window-y=393
notif-script=''
provider-atiadlsdk-enabled=true
provider-gtop2-enabled=true
provider-hddtemp-enabled=true
provider-libatasmart-enabled=true
provider-lmsensors-enabled=true
provider-nvctrl-enabled=true
provider-udisks2-enabled=true
sensor-update-interval=2
slog-enabled=false
slog-interval=300

[org/cinnamon]
active-display-scale=1.5
alttab-switcher-delay=100
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

[org/cinnamon/desktop/a11y/mouse]
dwell-click-enabled=false
dwell-threshold=10
dwell-time=1.2
secondary-click-enabled=false
secondary-click-time=1.2

[org/cinnamon/desktop/applications/calculator]
exec='liri-calculator'

[org/cinnamon/desktop/applications/terminal]
exec='terminator'

[org/cinnamon/desktop/background]
picture-options='none'
primary-color='#2e2e34343636'
secondary-color='#000000000000'

[org/cinnamon/desktop/background/slideshow]
delay=15
image-source='xml:///usr/share/gnome-background-properties/adwaita.xml'

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

[org/cinnamon/desktop/notifications]
remove-old=true

[org/cinnamon/desktop/privacy]
recent-files-max-age=-1

[org/cinnamon/desktop/screensaver]
lock-delay=uint32 30
screensaver-name=''

[org/cinnamon/desktop/session]
idle-delay=uint32 3600

[org/cinnamon/desktop/sound]
event-sounds=false
volume-sound-enabled=false

[org/cinnamon/desktop/wm/preferences]
min-window-opacity=30
theme='Materia-dark'
titlebar-font='Sans Bold 12'

[org/cinnamon/muffin]
resize-threshold=24
sync-to-vblank=true
tile-hud-threshold=25
workspace-cycle=true

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
touchpad-enabled=false

[org/cinnamon/settings-daemon/plugins/power]
sleep-display-ac=7200

[org/cinnamon/settings-daemon/plugins/xsettings]
antialiasing='rgba'
hinting='slight'
rgba-order='rgb'

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
window-position=(2038, 459)
word-size=64

[org/gnome/calendar]
active-view='month'
window-maximized=true
window-position=(0, 34)
window-size=(3440, 1366)

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

[org/gnome/desktop/input-sources]
sources=[('xkb', 'us')]
xkb-options=@as []

[org/gnome/desktop/interface]
clock-show-date=true
cursor-theme='breeze-cursor'
gtk-im-module='gtk-im-context-simple'
gtk-theme='Materia'
icon-theme='Moka'
monospace-font-name='Hack 10'
scaling-factor=uint32 0
toolkit-accessibility=false

[org/gnome/desktop/lockdown]
disable-lock-screen=true

[org/gnome/desktop/media-handling]
autorun-never=true

[org/gnome/desktop/screensaver]
color-shading-type='solid'
idle-activation-enabled=false
picture-options='zoom'
primary-color='#000000000000'
secondary-color='#000000000000'

[org/gnome/desktop/session]
idle-delay=uint32 0

[org/gnome/desktop/wm/preferences]
action-middle-click-titlebar='lower'
num-workspaces=4

[org/gnome/eog/view]
background-color='rgb(0,0,0)'
use-background-color=true

[org/gnome/evince/default]
window-ratio=(2.8104575163398691, 1.720959595959596)

[org/gnome/file-roller/dialogs/extract]
recreate-folders=true
skip-newer=false

[org/gnome/file-roller/listing]
list-mode='as-folder'
name-column-width=415
show-path=false
sort-method='name'
sort-type='ascending'

[org/gnome/file-roller/ui]
sidebar-width=200
window-height=480
window-width=600

[org/gnome/gedit/plugins]
active-plugins=['spell', 'modelines', 'filebrowser', 'time', 'docinfo']

[org/gnome/gedit/plugins/filebrowser]
root='file:///'
tree-view=true
virtual-root='file:///home/levi/Downloads'

[org/gnome/gedit/preferences/ui]
show-tabs-mode='auto'

[org/gnome/gedit/state/window]
bottom-panel-size=140
side-panel-active-page='GeditWindowDocumentsPanel'
side-panel-size=200
size=(1920, 2072)
state=87168

[org/gnome/gnome-screenshot]
border-effect='none'
include-border=true
include-pointer=false
last-save-directory='file:///home/levi/Pictures'

[org/gnome/gnome-system-monitor]
cpu-colors=[(uint32 0, '#FF6E00'), (1, '#CB0C29'), (2, '#49A835'), (3, '#2D7DB3'), (4, '#f25915e815e8'), (5, '#f25915e815e8'), (6, '#f25915e815e8'), (7, '#f25915e815e8'), (8, '#f25915e815e8'), (9, '#f25915e815e8'), (10, '#f25915e815e8'), (11, '#f25915e815e8'), (12, '#f25915e815e8'), (13, '#f25915e815e8'), (14, '#f25915e815e8'), (15, '#f25915e815e8')]
current-tab='resources'
maximized=false
show-dependencies=false
show-whose-processes='user'
window-state=(700, 500, 376, 220)

[org/gnome/gnome-system-monitor/disktreenew]
col-6-visible=true
col-6-width=0

[org/gnome/gnome-system-monitor/proctree]
columns-order=[0, 1, 2, 3, 4, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26]
sort-col=8
sort-order=0

[org/gnome/nm-applet]
disable-connected-notifications=true

[org/gnome/nm-applet/eap/b06164ed-4e26-43f0-ad2b-b3a8dcc2bf6f]
ignore-ca-cert=false
ignore-phase2-ca-cert=false

[org/gnome/nm-applet/eap/f7cdb80e-ce42-3558-a9f2-ac757947cdbd]
ignore-ca-cert=false
ignore-phase2-ca-cert=false

[org/gnome/settings-daemon/peripherals/keyboard]
numlock-state='on'

[org/gnome/settings-daemon/plugins/color]
night-light-enabled=false
night-light-last-coordinates=(37.027099999999997, -93.319299999999998)

[org/gnome/settings-daemon/plugins/media-keys]
calculator='<Primary><Super>c'
custom-keybindings=['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']
www='<Super>w'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0]
binding='<Super>t'
command='terminator'
name='terminal'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1]
binding='<Super>e'
command='code-oss'
name='vscode'

[org/gnome/settings-daemon/plugins/power]
sleep-inactive-ac-timeout=7200

[org/gnome/settings-daemon/plugins/xsettings]
hinting='slight'
overrides={'Gtk/ShellShowsAppMenu': <0>, 'Gtk/DecorationLayout': <'menu:minimize,maximize,close'>}

[org/gtk/settings/color-chooser]
selected-color=(true, 0.1803921568627451, 0.20392156862745098, 0.21176470588235294, 1.0)

[org/gtk/settings/file-chooser]
date-format='regular'
location-mode='path-bar'
show-hidden=false
show-size-column=true
sidebar-width=177
sort-column='name'
sort-directories-first=false
sort-order='descending'
window-position=(1425, 822)
window-size=(990, 690)

[org/nemo/desktop]
desktop-layout='false::false'
font='Sans 10'

[org/nemo/preferences]
show-hidden-files=true
show-location-entry=true

[org/nemo/window-state]
geometry='1170x1043+1325+534'
maximized=false
side-pane-view='tree'
sidebar-bookmark-breakpoint=5
sidebar-width=269
start-with-sidebar=true

[org/onboard]
schema-version='2.3'
system-theme-associations={'HighContrast': 'HighContrast', 'HighContrastInverse': 'HighContrastInverse', 'LowContrast': 'LowContrast', 'ContrastHighInverse': 'HighContrastInverse', 'Default': ''}
use-system-defaults=false

[org/onboard/theme-settings]
color-scheme='/usr/share/onboard/themes/Charcoal.colors'
key-fill-gradient=8.0
key-gradient-direction=-3.0
key-size=94.0
key-stroke-gradient=8.0
key-stroke-width=0.0
key-style='gradient'
roundrect-radius=20.0

[org/x/editor/plugins]
active-plugins=['textsize', 'spell', 'sort', 'modelines', 'filebrowser', 'docinfo', 'time']

[org/x/editor/plugins/filebrowser/on-load]
root='file:///'
tree-view=true
virtual-root='file:///home/levi/Documents'

[org/x/editor/preferences/ui]
statusbar-visible=true

[org/x/reader/default]
window-ratio=(6.2712418300653594, 2.6351010101010099)
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