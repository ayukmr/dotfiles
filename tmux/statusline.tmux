# =======================
# === Tmux Statusline ===
# =======================

# enable status
set -g status on

# status position
set -g status-position bottom
set -g status-justify  left

# statusline styles
set -g message-command-style 'fg=#abb2bf bg=#2c323c'
set -g message-style         'fg=#abb2bf bg=#2c323c'
set -g status-style          'fg=#abb2bf bg=#2c323c'

# left side
set -g status-left-style  none
set -g status-left-length 250
set -g status-left '#[fg=#2c2e34 bg=#{?client_prefix,#61afef,#{?pane_in_mode,#98c379,#{?window_zoomed_flag,#e5c07b,#c678dd}}}] TMX #[fg=#{?client_prefix,#61afef,#{?pane_in_mode,#98c379,#{?window_zoomed_flag,#e5c07b,#c678dd}}} bg=#2c323c]'

# right side
set -g status-right-style  none
set -g status-right-length 250
set -g status-right '#T #[fg=#3e4452 bg=#2c323c]#[fg=#abb2bf bg=#3e4452]  #I:#P |  #S #[fg=#{?client_prefix,#61afef,#{?pane_in_mode,#98c379,#{?window_zoomed_flag,#e5c07b,#c678dd}}} bg=#3e4452]#[fg=#2c2e34 bg=#{?client_prefix,#61afef,#{?pane_in_mode,#98c379,#{?window_zoomed_flag,#e5c07b,#c678dd}}}] %I:%M '

# window tabs styles
setw -g window-status-activity-style none
setw -g window-status-separator ''
setw -g window-status-style 'fg=#abb2bf bg=#2c323c'

# window tabs
setw -g window-status-format '  #I:#W  '
setw -g window-status-current-format '#[fg=#2c323c bg=#3e4452]#[fg=#abb2bf bg=#3e4452] #I:#W #[fg=#3e4452 bg=#2c323c]'
