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
applets=['62648b7a-6f5c-11e8-bfef-c86000757626', '626590b0-6f5c-11e8-bfef-c86000757626', '726d0af2-701e-11e8-81b9-c86000757626', '625958d6-6f5c-11e8-bfef-c86000757626', '6259b880-6f5c-11e8-bfef-c86000757626', '624f3a18-6f5c-11e8-bfef-c86000757626', '6243016c-6f5c-11e8-bfef-c86000757626', '626644ec-6f5c-11e8-bfef-c86000757626', '62452a5a-6f5c-11e8-bfef-c86000757626', 'b17c8866-6f5c-11e8-bfef-c86000757626']
transparency='none'
location='top'
theme-regions=true

[com/solus-project/budgie-panel/instance/icon-tasklist/{62452a5a-6f5c-11e8-bfef-c86000757626}]
pinned-launchers=['org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'spotify.desktop', 'vscode-oss.desktop', 'insomnia_insomnia.desktop', 'postman_postman.desktop', 'simplenote_simplenote.desktop']

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
toolkit-accessibility=false
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

[org/cinnamon]
desktop-effects-unmaximize-transition='easeNone'
desktop-effects-on-dialogs=false
desktop-effects-maximize-transition='easeInExpo'
active-display-scale=2
desktop-effects-map-effect='traditional'
command-history=['jmeter ', 'jmeter', 'code']
hotcorner-layout=['expo:false:0', 'scale:false:0', 'scale:false:0', 'desktop:false:0']
desktop-effects-close-effect='traditional'
workspace-osd-duration=400
desktop-effects-unmaximize-time=100
desklet-snap-interval=25
desktop-effects-map-time=100
enabled-desklets=@as []
desktop-effects-minimize-effect='traditional'
desktop-effects=false
panels-height=['1:29']
enable-vfade=false
next-applet-id=16
panel-launchers=['DEPRECATED']
desktop-effects-map-transition='easeOutQuad'
desktop-effects-maximize-time=100
desktop-effects-unmaximize-effect='none'
panels-enabled=['1:0:top']
desktop-effects-tile-transition='easeInQuad'
panels-resizable=['1:true']
desktop-effects-maximize-effect='none'
desktop-effects-on-menus=false
enabled-applets=['panel1:right:3:systray@cinnamon.org:0', 'panel1:left:0:menu@cinnamon.org:1', 'panel1:left:2:panel-launchers@cinnamon.org:3', 'panel1:left:3:window-list@cinnamon.org:4', 'panel1:right:2:notifications@cinnamon.org:6', 'panel1:right:6:removable-drives@cinnamon.org:7', 'panel1:right:7:user@cinnamon.org:8', 'panel1:right:8:network@cinnamon.org:9', 'panel1:right:10:calendar@cinnamon.org:12', 'panel1:right:9:sound@cinnamon.org:13']
desktop-effects-minimize-time=160
alttab-switcher-delay=100
desktop-effects-tile-effect='none'
desktop-effects-close-transition='easeOutQuad'
desktop-effects-minimize-transition='easeInQuad'
panel-edit-mode=false
workspace-osd-x=50
desktop-effects-close-time=120
workspace-osd-y=50
favorite-apps=['org.gnome.Terminal.desktop', 'chromium-browser.desktop', 'mintinstall.desktop', 'cinnamon-settings.desktop', 'nemo.desktop']
desktop-effects-tile-time=100
startup-animation=false

[org/cinnamon/muffin]
resize-threshold=24
tile-hud-threshold=25
workspace-cycle=true

[org/cinnamon/desktop/interface]
clock-show-date=true
text-scaling-factor=1.0
cursor-size=24
cursor-blink-time=1200
gtk-overlay-scrollbars=false
icon-theme='Adwaita'
gtk-theme='Materia-dark'

[org/cinnamon/desktop/keybindings/media-keys]
terminal=['<Super>t']
calculator=['XF86Calculator', '<Super>c']

[org/cinnamon/desktop/media-handling]
autorun-never=false

[org/cinnamon/desktop/screensaver]
screensaver-name=''

[org/cinnamon/desktop/applications/terminal]
exec='terminator'

[org/cinnamon/desktop/notifications]
remove-old=true

[org/cinnamon/desktop/session]
idle-delay=uint32 3600

[org/cinnamon/desktop/privacy]
recent-files-max-age=-1

[org/cinnamon/desktop/wm/preferences]
min-window-opacity=30
theme='Materia-dark'
num-workspaces=5
workspace-names=@as []

[org/cinnamon/desktop/a11y/keyboard]
slowkeys-beep-press=true
mousekeys-accel-time=1200
bouncekeys-beep-reject=true
slowkeys-beep-reject=false
disable-timeout=120
enable=false
bouncekeys-enable=false
stickykeys-enable=false
feature-state-change-beep=false
slowkeys-beep-accept=true
bouncekeys-delay=300
mousekeys-max-speed=750
mousekeys-enable=false
timeout-enable=false
slowkeys-delay=300
stickykeys-modifier-beep=true
stickykeys-two-key-off=true
mousekeys-init-delay=160
slowkeys-enable=false

[org/cinnamon/desktop/sound]
volume-sound-enabled=false
event-sounds=false

[org/cinnamon/desktop/background]
picture-uri='file:///home/levi/Wallpapers/coffee-pixels.png'
primary-color='#000000000000'
picture-options='zoom'
secondary-color='#000000000000'

[org/cinnamon/desktop/background/slideshow]
image-source='directory:///home/levi/Wallpapers'
delay=15

[org/cinnamon/theme]
theme-cache-updated=1536677289
name='Materia-dark'

[org/cinnamon/settings-daemon/plugins/power]
sleep-display-ac=7200

[org/cinnamon/settings-daemon/peripherals/touchpad]
motion-threshold=1
natural-scroll=false
scrolling-method=1

[org/cinnamon/settings-daemon/peripherals/keyboard]
repeat-interval=uint32 30
delay=uint32 500
numlock-state='on'

[org/cinnamon/settings-daemon/peripherals/mouse]
drag-threshold=8
motion-threshold=1
double-click=400

[org/cinnamon/cinnamon-session]
quit-time-delay=60

[org/cinnamon/sounds]
login-enabled=false
logout-enabled=false
unplug-enabled=false
tile-enabled=false
plug-enabled=false
switch-enabled=false

[org/x/editor/preferences/ui]
statusbar-visible=true

[org/x/editor/plugins/filebrowser/on-load]
virtual-root='file:///home/levi/Documents'
tree-view=true
root='file:///'

[org/x/editor/plugins]
active-plugins=['textsize', 'spell', 'sort', 'modelines', 'filebrowser', 'docinfo', 'time']

[org/nemo/preferences]
show-hidden-files=true

[com/linuxmint/updates]
hide-systray=false
level2-is-safe=true
level3-is-visible=true
level1-is-safe=true
dist-upgrade=true
kernel-updates-are-safe=true
level3-is-safe=true
blacklisted-packages=@as []
security-updates-are-safe=true
security-updates-are-visible=true
autorefresh-minutes=0
autorefresh-hours=2
kernel-updates-are-visible=true
level2-is-visible=true
show-welcome-page=false
level4-is-safe=true
window-width=790
level4-is-visible=true
autorefresh-days=0
hide-window-after-update=false
refresh-days=0
refresh-minutes=10
window-height=791
show-level-column=false
window-pane-position=280
level1-is-visible=true
warn-about-timeshift=true
refresh-hours=0
default-repo-is-ok=true
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
