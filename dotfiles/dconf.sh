info ">>> Generating DCONF File"

mkdir -p ${HOME}/.custom/

cat >"${HOME}/.custom/dconf.2" <<EOF
[apps/light-locker]
idle-hint=false
late-locking=false
lock-after-screensaver=uint32 5
lock-on-lid=false
lock-on-suspend=true

[com/linuxmint/updates]
autorefresh-days=0
autorefresh-hours=2
autorefresh-minutes=0
blacklisted-packages=@as []
default-repo-is-ok=true
dist-upgrade=true
hide-systray=false
hide-window-after-update=false
kernel-updates-are-safe=true
kernel-updates-are-visible=true
level1-is-safe=true
level1-is-visible=true
level2-is-safe=true
level2-is-visible=true
level3-is-safe=true
level3-is-visible=true
level4-is-safe=true
level4-is-visible=true
refresh-days=0
refresh-hours=0
refresh-minutes=10
security-updates-are-safe=true
security-updates-are-visible=true
show-level-column=false
show-welcome-page=false
warn-about-timeshift=true
window-height=791
window-pane-position=280
window-width=790

[com/solus-project/budgie-panel]
dark-theme=true
migration-level=1
panels=['622508c4-6f5c-11e8-bfef-c86000757626']

[com/solus-project/budgie-panel/applets/{6243016c-6f5c-11e8-bfef-c86000757626}]
alignment='start'
name='Budgie Menu'
position=0

[com/solus-project/budgie-panel/applets/{62452a5a-6f5c-11e8-bfef-c86000757626}]
alignment='start'
name='Icon Task List'
position=1

[com/solus-project/budgie-panel/applets/{624f3a18-6f5c-11e8-bfef-c86000757626}]
alignment='end'
name='System Tray'
position=1

[com/solus-project/budgie-panel/applets/{625958d6-6f5c-11e8-bfef-c86000757626}]
alignment='end'
name='Notifications'
position=5

[com/solus-project/budgie-panel/applets/{6259b880-6f5c-11e8-bfef-c86000757626}]
alignment='end'
name='Status Indicator'
position=3

[com/solus-project/budgie-panel/applets/{62648b7a-6f5c-11e8-bfef-c86000757626}]
alignment='end'
name='User Indicator'
position=7

[com/solus-project/budgie-panel/applets/{626590b0-6f5c-11e8-bfef-c86000757626}]
alignment='end'
name='Clock'
position=4

[com/solus-project/budgie-panel/applets/{626644ec-6f5c-11e8-bfef-c86000757626}]
alignment='end'
name='Raven Trigger'
position=6

[com/solus-project/budgie-panel/applets/{726d0af2-701e-11e8-81b9-c86000757626}]
alignment='end'
name='Workspace Switcher'
position=0

[com/solus-project/budgie-panel/applets/{b17c8866-6f5c-11e8-bfef-c86000757626}]
alignment='end'
name='Separator'
position=2

[com/solus-project/budgie-panel/instance/icon-tasklist/{62452a5a-6f5c-11e8-bfef-c86000757626}]
pinned-launchers=['org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'spotify.desktop', 'vscode-oss.desktop', 'insomnia_insomnia.desktop', 'postman_postman.desktop', 'simplenote_simplenot
e.desktop']

[com/solus-project/budgie-panel/instance/workspaces/{726d0af2-701e-11e8-81b9-c86000757626}]
addbutton-visibility='never'

[com/solus-project/budgie-panel/panels/{622508c4-6f5c-11e8-bfef-c86000757626}]
applets=['62648b7a-6f5c-11e8-bfef-c86000757626', '626590b0-6f5c-11e8-bfef-c86000757626', '726d0af2-701e-11e8-81b9-c86000757626', '625958d6-6f5c-11e8-bfef-c86000757626', '6259b880-6f5c-11e8-bf
ef-c86000757626', '624f3a18-6f5c-11e8-bfef-c86000757626', '6243016c-6f5c-11e8-bfef-c86000757626', '626644ec-6f5c-11e8-bfef-c86000757626', '62452a5a-6f5c-11e8-bfef-c86000757626', 'b17c8866-6f5
c-11e8-bfef-c86000757626']
dock-mode=false
enable-shadow=true
location='top'
size=39
theme-regions=true
transparency='none'

[com/solus-project/budgie-wm]
button-layout='appmenu:minimize,maximize,close'

[com/solus-project/software-center]
last-checked=int64 1529519046
update-type='security-only'

[org/blueberry]
obex-enabled=false

[org/cinnamon]
active-display-scale=1
alttab-switcher-delay=100
command-history=['jmeter ', 'jmeter', 'code', 'spotify ']
desklet-snap-interval=25
desktop-effects=false
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
desktop-effects-on-dialogs=false
desktop-effects-on-menus=false
desktop-effects-tile-effect='none'
desktop-effects-tile-time=100
desktop-effects-tile-transition='easeInQuad'
desktop-effects-unmaximize-effect='none'
desktop-effects-unmaximize-time=100
desktop-effects-unmaximize-transition='easeNone'
enable-vfade=false
enabled-applets=['panel1:right:3:systray@cinnamon.org:0', 'panel1:left:0:menu@cinnamon.org:1', 'panel1:left:2:panel-launchers@cinnamon.org:3', 'panel1:left:3:window-list@cinnamon.org:4', 'pan
el1:right:2:notifications@cinnamon.org:6', 'panel1:right:6:removable-drives@cinnamon.org:7', 'panel1:right:7:user@cinnamon.org:8', 'panel1:right:8:network@cinnamon.org:9', 'panel1:right:10:ca
lendar@cinnamon.org:12', 'panel1:right:9:sound@cinnamon.org:13']
enabled-desklets=@as []
favorite-apps=['org.gnome.Terminal.desktop', 'chromium-browser.desktop', 'mintinstall.desktop', 'cinnamon-settings.desktop', 'nemo.desktop']
hotcorner-layout=['expo:false:0', 'scale:false:0', 'scale:false:0', 'desktop:false:0']
next-applet-id=16
panel-edit-mode=false
panel-launchers=['DEPRECATED']
panel-zone-icon-sizes='[{"panelId": 1, "left": 0, "center": 0, "right": 0}]'
panels-enabled=['1:0:top']
panels-height=['1:36']
panels-resizable=['1:true']
startup-animation=false
workspace-osd-duration=400
workspace-osd-x=50
workspace-osd-y=50

[org/cinnamon/cinnamon-session]
quit-time-delay=60

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

[org/cinnamon/desktop/applications/calculator]
exec='gnome-calculator'

[org/cinnamon/desktop/applications/terminal]
exec='terminator'

[org/cinnamon/desktop/background]
picture-options='none'
picture-uri='file:///home/levi/Wallpapers/pong.png'
primary-color='#2e2e34343636'
secondary-color='#000000000000'

[org/cinnamon/desktop/background/slideshow]
delay=15
image-source='directory:///home/levi/Wallpapers'

[org/cinnamon/desktop/interface]
clock-show-date=true
cursor-blink-time=1200
cursor-size=24
gtk-overlay-scrollbars=false
gtk-theme='Materia-dark'
icon-theme='Adwaita'
scaling-factor=uint32 0
text-scaling-factor=1.3000000000000003
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
screensaver-name=''

[org/cinnamon/desktop/session]
idle-delay=uint32 3600

[org/cinnamon/desktop/sound]
event-sounds=false
volume-sound-enabled=false

[org/cinnamon/desktop/wm/preferences]
min-window-opacity=30
num-workspaces=${WORKSPACE_COUNT}
theme='Materia-dark'
workspace-names=@as []

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
double-click=400
drag-threshold=8
motion-threshold=1

[org/cinnamon/settings-daemon/peripherals/touchpad]
motion-threshold=1
natural-scroll=false
scrolling-method=1

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
symbolic-relative-size=0.69999999999999996
theme-cache-updated=1536677289

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
window-position=(177, 901)
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

[org/gnome/desktop/interface]
clock-show-date=true
cursor-theme='breeze-cursor'
gtk-im-module='gtk-im-context-simple'
gtk-theme='Materia'
icon-theme='Moka'
monospace-font-name='Hack 10'
scaling-factor=uint32 0
toolkit-accessibility=false

[org/gnome/desktop/media-handling]
autorun-never=true

[org/gnome/desktop/screensaver]
color-shading-type='solid'
picture-options='zoom'
primary-color='#000000000000'
secondary-color='#000000000000'

[org/gnome/desktop/wm/preferences]
action-middle-click-titlebar='lower'
num-workspaces=${WORKSPACE_COUNT}

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
name-column-width=358
show-path=false
sort-method='name'
sort-type='ascending'

[org/gnome/file-roller/ui]
sidebar-width=200
window-height=480
window-width=600

[org/gnome/gedit/plugins]
active-plugins=['filebrowser', 'spell', 'modelines', 'docinfo', 'time']

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
size=(1720, 1363)
state=87168

[org/gnome/gnome-screenshot]
border-effect='none'
include-border=true
include-pointer=false

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
sidebar-width=176
sort-column='name'
sort-directories-first=false
sort-order='ascending'
window-position=(1424, 537)
window-size=(990, 690)

[org/nemo/desktop]
font='Sans 10'

[org/nemo/preferences]
show-hidden-files=true

[org/nemo/window-state]
geometry='1256x957+2193+405'
maximized=false
side-pane-view='places'
sidebar-bookmark-breakpoint=5
start-with-sidebar=true

[org/onboard]
schema-version='2.3'
system-theme-associations={'HighContrast': 'HighContrast', 'HighContrastInverse': 'HighContrastInverse', 'LowContrast': 'LowContrast', 'ContrastHighInverse': 'HighContrastInverse', 'Default':
 ''}
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
