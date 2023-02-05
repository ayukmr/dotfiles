# ===================
# === Tmux Bundle ===
# ===================

# set plugins directory
set-env -g TMUX_PLUGIN_MANAGER_PATH '~/.tmux/bundle'

set -g @tpm_plugins \
  'tmux-plugins/tmux-sessionist
   tmux-plugins/tmux-copycat
   tmux-plugins/tmux-open'

run '~/.tmux/tpm/tpm'
