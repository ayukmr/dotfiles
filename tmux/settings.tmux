# =====================
# === Tmux Settings ===
# =====================

# allow 256 colors
set -g default-terminal xterm-256color
set -ga terminal-overrides ',*256col*:Tc'

# default shell
set -g default-shell /bin/zsh

# clock mode
set -g clock-mode-colour '#88b369'
set -g clock-mode-style  12

# pane border colors
set -g pane-border-style        'fg=#303030'
set -g pane-active-border-style 'fg=#88b369'

# automatic windows
set -g automatic-rename on
set -g renumber-windows on

# agressive resizing of windows
set -g aggressive-resize on

# display messages for 4 secs
set -g display-time 4000

# window title
set -g set-titles on
set -g set-titles-string '#T'

# fix vim lagging
set -s escape-time 10

# highlighted text
set -g mode-style 'bg=#303030'

# one as base index
set -g base-index      1
set -g pane-base-index 1
