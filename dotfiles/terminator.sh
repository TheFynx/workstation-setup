mkdir -p ${HOME}/.config/terminator/

cat > "${HOME}/.config/terminator/config" << EOF
[global_config]
  borderless = True
  custom_url_handler = firefox
  enabled_plugins = InactivityWatch, TestPlugin, SearchPlugin, ActivityWatch, LaunchpadBugURLHandler, TerminalExporter, TerminalShot, LaunchpadCodeURLHandler, APTURLHandler, Logger
  suppress_multiple_term_dialog = True
  title_inactive_bg_color = "#000000"
  title_receive_bg_color = "#817e7e"
  title_transmit_bg_color = "#000000"
  use_custom_url_handler = True
  window_state = maximise
[keybindings]
  broadcast_all = <Super>b
  broadcast_off = <Primary><Super>b
  hide_window = <Shift><Control>a
  split_horiz = <Super>h
  split_vert = <Super>v
  switch_to_tab_1 = <Super>1
  switch_to_tab_10 = <Super>0
  switch_to_tab_2 = <Super>2
  switch_to_tab_3 = <Super>3
  switch_to_tab_4 = <Super>4
  switch_to_tab_5 = <Super>5
  switch_to_tab_6 = <Super>6
  switch_to_tab_7 = <Super>7
  switch_to_tab_8 = <Super>8
  switch_to_tab_9 = <Super>9
  toggle_zoom = <Primary><Super>m
[layouts]
  [[default]]
    [[[child1]]]
      parent = window0
      type = Terminal
    [[[window0]]]
      parent = ""
      type = Window
[plugins]
[profiles]
  [[default]]
    background_darkness = 0.59
    background_image = None
    background_type = transparent
    color_scheme = custom
    broadcast_default = off
    copy_on_selection = True
    cursor_color = "#ffffff"
    cursor_shape = ibeam
    font = Droid Sans Mono for Powerline 10
    foreground_color = "#dcdcdc"
    icon_bell = False
    login_shell = True
    palette = "#000000:#cd0000:#00cd00:#cdcd00:#1e90ff:#cd00cd:#00cdcd:#e5e5e5:#4c4c4c:#ff0000:#00ff00:#ffff00:#4682b4:#ff00ff:#00ffff:#ffffff"
    scroll_on_output = False
    scrollback_infinite = True
    scrollback_lines = 5000
    scrollbar_position = hidden
    show_titlebar = False
    use_system_font = False

EOF
