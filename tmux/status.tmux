# ===================
# === Tmux Status ===
# ===================

# enable status
set -g status on

# status position
set -g status-position bottom
set -g status-justify  left

# status styles
set -g status-style  'fg=#abb2bf bg=#2c323c'
set -g message-style 'fg=#abb2bf bg=#2c323c'
set -g message-command-style 'fg=#abb2bf bg=#2c323c'

# left side
set -g status-left-style  none
set -g status-left-length 250
set -g status-left '#[fg=#2c2e34 bg=#{?client_prefix,#61afef,#{?pane_in_mode,#98c379,#{?window_zoomed_flag,#e5c07b,#c678dd}}} bold] TMX #[fg=#{?client_prefix,#61afef,#{?pane_in_mode,#98c379,#{?window_zoomed_flag,#e5c07b,#c678dd}}} bg=#2c323c none]'

# right side
set -g status-right-style  none
set -g status-right-length 250
set -g status-right '#[fg=#3e4452 bg=#2c323c]#[fg=#abb2bf bg=#3e4452]  #I:#P |  #S #[fg=#{?client_prefix,#61afef,#{?pane_in_mode,#98c379,#{?window_zoomed_flag,#e5c07b,#c678dd}}} bg=#3e4452]#[fg=#2c2e34 bg=#{?client_prefix,#61afef,#{?pane_in_mode,#98c379,#{?window_zoomed_flag,#e5c07b,#c678dd}}} bold] %I:%M '

# window tabs styles
set -g window-status-separator ''
set -g window-status-style          'fg=#abb2bf bg=#2c323c'
set -g window-status-activity-style 'fg=#abb2bf bg=#2c323c'
set -g window-status-bell-style     'fg=#abb2bf bg=#2c323c'
set -g window-status-current-style  'fg=#abb2bf bg=#2c323c'

# window tabs
set -g window-status-format '  #I:#W  '
set -g window-status-current-format '#[fg=#2c323c bg=#3e4452]#[fg=#abb2bf bg=#3e4452 bold] #I:#W #[fg=#3e4452 bg=#2c323c none]'
