# ====================
# === ZSH Keybinds ===
# ====================

# clear screen
bindkey -M main  ^K _clear
bindkey -M vicmd ^K _clear

function _clear {
  zle push-input

  BUFFER='clear'
  zle accept-line
}
zle -N _clear

# use vim keybinds for selecting completions
zmodload zsh/complist
bindkey -M menuselect h vi-backward-char
bindkey -M menuselect k vi-up-line-or-history
bindkey -M menuselect l vi-forward-char
bindkey -M menuselect j vi-down-line-or-history
