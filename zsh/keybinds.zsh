# ====================
# === ZSH Keybinds ===
# ====================

# remove text from cursor to eol
bindkey ^L kill-line

# search history with query
bindkey ^R history-incremental-search-backward

# insert from command history
bindkey ^N insert-last-word

# clear screen
bindkey -M main  ^K _clear
bindkey -M vicmd ^K _clear

function _clear {
    zle push-input

    BUFFER='clear'
    zle accept-line
}
zle -N _clear

# edit using editor
bindkey -M main  ^E _edit
bindkey -M vicmd ^E _edit

function _edit {
    if [[ ! $BUFFER =~ "^$EDITOR.*" ]]; then
        BUFFER="$EDITOR $BUFFER"
        zle end-of-line
    fi
}
zle -N _edit

# select completions
zmodload zsh/complist

bindkey -M menuselect h vi-backward-char
bindkey -M menuselect k vi-up-line-or-history
bindkey -M menuselect l vi-forward-char
bindkey -M menuselect j vi-down-line-or-history
