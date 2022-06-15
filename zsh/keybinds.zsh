# ====================
# === ZSH Keybinds ===
# ====================

# remove text from cursor to eol
bindkey ^L kill-line

# search history with query
bindkey ^R history-incremental-search-backward

# insert from command history
bindkey ^N insert-last-word

# clear screen and wipe history
function _clear {
    zle push-input

    BUFFER='clear'
    zle accept-line
}
zle -N _clear

bindkey -M main  ^K _clear
bindkey -M vicmd ^K _clear

# open line contents with editor
function _edit {
    if [[ ! $BUFFER =~ "^$EDITOR.*" ]]; then
        BUFFER="$EDITOR $BUFFER"
        zle end-of-line
    fi
}
zle -N _edit

bindkey -M main  ^E _edit
bindkey -M vicmd ^E _edit
