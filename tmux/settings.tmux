# =====================
# === Tmux Settings ===
# =====================

# allow 256 colors
set -g default-terminal xterm-256color

# set default shell
set -g default-shell /bin/zsh

# clock mode
setw -g clock-mode-colour '#98c379'
setw -g clock-mode-style  12

# pane border colors
set -g pane-border-style        'fg=#3e4452'
set -g pane-active-border-style 'fg=#98c379'

# automatic windows
setw -g automatic-rename on
set  -g renumber-windows on

# agressive resizing of windows
setw -g aggressive-resize on

# display messages for 4 secs
set -g display-time 4000

# set window title
set -g set-titles on
set -g set-titles-string '#T'

# fix vim lagging
set -s escape-time 10

# highlighted text, selections
set -g mode-style 'bg=#3e4452'

# use one as base index
set  -g base-index      1
setw -g pane-base-index 1
