# ===================
# === Tmux Bundle ===
# ===================

# plugins directory
set-env -g TMUX_PLUGIN_MANAGER_PATH '~/.tmux/bundle'

set -g @tpm_plugins \
  'Morantron/tmux-fingers
   tmux-plugins/tmux-sessionist
   tmux-plugins/tmux-open'

run '~/.tmux/tpm/tpm'
