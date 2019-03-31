mkdir -p ${HOME}/.config/terminator/plugins

if [ ! -f "${HOME}/.config/terminator/plugins/terminator-themes.py" ]; then
  wget https://git.io/v5Zww -O "${HOME}/.config/terminator/plugins/terminator-themes.py"
fi

cat >"${HOME}/.config/terminator/config.2" <<'EOF'
[global_config]
  borderless = True
  custom_url_handler = firefox
  enabled_plugins = InactivityWatch, TestPlugin, TerminatorThemes, ActivityWatch, TerminalShot, LaunchpadCodeURLHandler, APTURLHandler, Logger, LaunchpadBugURLHandler
  suppress_multiple_term_dialog = True
  title_font = Droid Sans 9
  title_inactive_bg_color = "#000000"
  title_receive_bg_color = "#817e7e"
  title_transmit_bg_color = "#000000"
  title_use_system_font = False
  use_custom_url_handler = True
  window_state = maximise
[keybindings]
  broadcast_all = None
  broadcast_group = None
  broadcast_off = None
  cycle_next = None
  cycle_prev = None
  edit_tab_title = None
  edit_terminal_title = None
  edit_window_title = None
  full_screen = None
  go_next = None
  go_prev = None
  group_all = None
  group_tab = None
  hide_window = None
  move_tab_left = None
  move_tab_right = None
  new_tab = None
  new_terminator = None
  new_window = None
  next_tab = None
  prev_tab = None
  rotate_ccw = None
  rotate_cw = None
  split_horiz = <Super>h
  split_vert = <Super>v
  switch_to_tab_1 = None
  switch_to_tab_10 = None
  switch_to_tab_2 = None
  switch_to_tab_3 = None
  switch_to_tab_4 = None
  switch_to_tab_5 = None
  switch_to_tab_6 = None
  switch_to_tab_7 = None
  switch_to_tab_8 = None
  switch_to_tab_9 = None
  toggle_zoom = <Primary><Super>m
  ungroup_all = None
  ungroup_tab = None
[layouts]
  [[default]]
    [[[child1]]]
      parent = window0
      profile = MaterialDark
      type = Terminal
    [[[window0]]]
      parent = ""
      type = Window
[plugins]
[profiles]
  [[default]]
    background_darkness = 0.8
    background_type = transparent
    color_scheme = custom
    copy_on_selection = True
    cursor_color = "#ffffff"
    cursor_shape = ibeam
    custom_command = exec /bin/zsh -l
    font = Source Code Pro for Powerline Medium 10
    foreground_color = "#ffffff"
    icon_bell = False
    login_shell = True
    palette = "#000000:#cc0000:#4e9a06:#c17d11:#204a87:#cd00cd:#00cdcd:#d3d7cf:#7f7f7f:#ef2929:#73d216:#e9b96e:#729fcf:#ff00ff:#00ffff:#eeeeec"
    scrollback_infinite = True
    scrollback_lines = 5000
    scrollbar_position = hidden
    show_titlebar = False
    use_custom_command = True
    use_system_font = False
  [[MaterialDark]]
    background_color = "#232322"
    background_darkness = 0.8
    background_type = transparent
    color_scheme = custom
    copy_on_selection = True
    cursor_color = "#16afca"
    cursor_shape = ibeam
    custom_command = exec /bin/zsh -l
    font = Source Code Pro for Powerline Medium 10
    foreground_color = "#e5e5e5"
    icon_bell = False
    login_shell = True
    palette = "#212121:#b7141f:#457b24:#f6981e:#134eb2:#560088:#0e717c:#efefef:#424242:#e83b3f:#7aba3a:#ffea2e:#54a4f3:#aa4dbc:#26bbd1:#d9d9d9"
    scrollback_infinite = True
    scrollback_lines = 5000
    scrollbar_position = hidden
    show_titlebar = False
    use_custom_command = True
    use_system_font = False
EOF

if [ -f "${HOME}/.config/terminator/config" ]; then
  info ">>> Terminator: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${HOME}/.config/terminator/config ${HOME}/.config/terminator/config.2)" ]; then
    info ">>> Terminator: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${HOME}/.config/terminator/config ${HOME}/.config/terminator/config.2
    mv ${HOME}/.config/terminator/config.2 ${HOME}/.config/terminator/config
  else
    info ">>> Terminator: No changes detected"
    mv ${HOME}/.config/terminator/config.2 ${HOME}/.config/terminator/config
  fi
else
  info ">>> Terminator: No file detected, creating new file"
  mv ${HOME}/.config/terminator/config.2 ${HOME}/.config/terminator/config
fi
