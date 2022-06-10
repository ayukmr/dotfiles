# =====================
# === Tmux Keybinds ===
# =====================

# set prefix to ctrl-s
set -g prefix C-s

# send prefix
bind C-s send-prefix

# reload config
bind r source ~/.config/tmux/tmux.conf \; display 'config reloaded!'

# copy mode
bind a copy-mode
bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi y send -X copy-selection
bind -T copy-mode-vi r send -X rectangle-toggle

# paste text
bind p paste-buffer

# split window
bind v split-window -h
bind h split-window -v

# switch windows
bind '[' select-window -p
bind ']' select-window -n

# switch panes without prefix
bind -n M-Left  select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up    select-pane -U
bind -n M-Down  select-pane -D

# kill pane without confirmation
unbind x
bind x kill-pane

# vim keybinds
set -wg mode-keys vi
