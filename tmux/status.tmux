# ===================
# === Tmux Status ===
# ===================

# enable status
set -g status on

# status position
set -g status-position bottom
set -g status-justify  left

# status styles
set -g status-style  'fg=#a9a9a9 bg=#252525'
set -g message-style 'fg=#a9a9a9 bg=#252525'
set -g message-command-style 'fg=#a9a9a9 bg=#252525'

# left side
set -g status-left-style  none
set -g status-left-length 250
set -g status-left '#[fg=#252525 bg=#{?client_prefix,#519fdf,#{?pane_in_mode,#88b369,#{?window_zoomed_flag,#e5c07b,#b668cd}}} bold] TMX '

# right side
set -g status-right-style  none
set -g status-right-length 250
set -g status-right '#T #[fg=#a9a9a9 bg=#303030]  #I:#P |  #S #[fg=#252525 bg=#{?client_prefix,#519fdf,#{?pane_in_mode,#88b369,#{?window_zoomed_flag,#e5c07b,#b668cd}}} bold] %I:%M '

# window tabs styles
set -g window-status-separator ''
set -g window-status-style          'fg=#a9a9a9 bg=#252525'
set -g window-status-activity-style 'fg=#a9a9a9 bg=#252525'
set -g window-status-bell-style     'fg=#a9a9a9 bg=#252525'
set -g window-status-current-style  'fg=#a9a9a9 bg=#252525'

# window tabs
set -g window-status-format ' #W '
set -g window-status-current-format '#[fg=#a9a9a9 bg=#303030 bold] #W '
