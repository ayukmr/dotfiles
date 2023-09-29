# ====================
# === ZSH Keybinds ===
# ====================

# vim keybinds for selecting completions
zmodload zsh/complist
bindkey -M menuselect h vi-backward-char
bindkey -M menuselect k vi-up-line-or-history
bindkey -M menuselect l vi-forward-char
bindkey -M menuselect j vi-down-line-or-history
