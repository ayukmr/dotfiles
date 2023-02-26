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
bind [ select-window -p
bind ] select-window -n

# switch sessions
bind N switch-client -p
bind n switch-client -n

# open or detach popup session
bind C-p \
  if-shell "[[ \"$(tmux display-message -p '#S')\" == 'popup' ]]" \
    'detach' \
    "popup -E -h 75% -w 75% 'tmuxinator start popup; tmux attach -t popup'"

# switch panes
bind -n M-Left  select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up    select-pane -U
bind -n M-Down  select-pane -D

# vim keybinds
set -g mode-keys vi
