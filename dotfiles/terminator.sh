mkdir -p ${HOME}/.config/terminator/plugins

if [ ! -f "${HOME}/.config/terminator/plugins/terminator-themes.py" ]; then
  wget https://git.io/v5Zww -O "${HOME}/.config/terminator/plugins/terminator-themes.py"
fi

cat >"${HOME}/.config/terminator/config.2" <<'EOF'
[global_config]
  window_state = maximise
  borderless = True
  use_custom_url_handler = True
  custom_url_handler = google-chrome-stable
  title_transmit_bg_color = "#000000"
  title_receive_bg_color = "#817e7e"
  title_inactive_bg_color = "#000000"
  enabled_plugins = InactivityWatch, TestPlugin, ActivityWatch, TerminalShot, LaunchpadCodeURLHandler, APTURLHandler, Logger, LaunchpadBugURLHandler
  suppress_multiple_term_dialog = True
  title_use_system_font = False
  title_font = Source Code Pro for Powerline Medium 10
[keybindings]
  new_tab = None
  cycle_next = None
  cycle_prev = None
  go_next = None
  go_prev = None
  rotate_cw = None
  rotate_ccw = None
  split_horiz = <Super>h
  split_vert = <Super>v
  move_tab_right = None
  move_tab_left = None
  toggle_zoom = <Primary><Super>m
  next_tab = None
  prev_tab = None
  switch_to_tab_1 = None
  switch_to_tab_2 = None
  switch_to_tab_3 = None
  switch_to_tab_4 = None
  switch_to_tab_5 = None
  switch_to_tab_6 = None
  switch_to_tab_7 = None
  switch_to_tab_8 = None
  switch_to_tab_9 = None
  switch_to_tab_10 = None
  full_screen = None
  hide_window = None
  group_all = None
  ungroup_all = None
  group_tab = None
  ungroup_tab = None
  new_window = None
  new_terminator = None
  broadcast_off = None
  broadcast_group = None
  broadcast_all = None
  edit_window_title = None
  edit_tab_title = None
  edit_terminal_title = None
[profiles]
  [[default]]
    icon_bell = False
    background_color = "#060606"
    background_darkness = 0.8
    background_type = transparent
    color_scheme = custom
    cursor_shape = ibeam
    cursor_color = "#16afca"
    font = SauceCodePro Nerd Font Mono 11
    foreground_color = "#e5e5e5"
    show_titlebar = False
    scrollbar_position = hidden
    scrollback_lines = 5000
    scrollback_infinite = True
    palette = "#212121:#b7141f:#457b24:#e98e17:#134eb2:#560088:#0e717c:#efefef:#424242:#e83b3f:#7aba3a:#ffea2e:#54a4f3:#aa4dbc:#26bbd1:#d9d9d9"
    use_system_font = False
    copy_on_selection = True
[layouts]
  [[default]]
    [[[child1]]]
      parent = window0
      profile = default
      type = Terminal
    [[[window0]]]
      parent = ""
      type = Window
[plugins]
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
