# ===================
# === Tmux Status ===
# ===================

# enable status
set -g status on

# status position
set -g status-position bottom
set -g status-justify  left

# status styles
set -g status-style  'fg=#b1b3b3 bg=#2d2d2f'
set -g message-style 'fg=#b1b3b3 bg=#2d2d2f'
set -g message-command-style 'fg=#b1b3b3 bg=#2d2d2f'

# left side
set -g status-left-style  none
set -g status-left-length 250
set -g status-left '#[fg=#2d2d2f bg=#{?client_prefix,#61afef,#{?pane_in_mode,#98c379,#{?window_zoomed_flag,#e5c07b,#c678dd}}} bold] TMX '

# right side
set -g status-right-style  none
set -g status-right-length 250
set -g status-right '#[fg=#b1b3b3 bg=#373739]  #I:#P |  #S #[fg=#2d2d2f bg=#{?client_prefix,#61afef,#{?pane_in_mode,#98c379,#{?window_zoomed_flag,#e5c07b,#c678dd}}} bold] %I:%M '

# window tabs styles
set -g window-status-separator ''
set -g window-status-style          'fg=#b1b3b3 bg=#2d2d2f'
set -g window-status-activity-style 'fg=#b1b3b3 bg=#2d2d2f'
set -g window-status-bell-style     'fg=#b1b3b3 bg=#2d2d2f'
set -g window-status-current-style  'fg=#b1b3b3 bg=#2d2d2f'

# window tabs
set -g window-status-format ' #I:#W '
set -g window-status-current-format '#[fg=#b1b3b3 bg=#373739 bold] #I:#W '
