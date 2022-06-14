# ====================
# === ZSH Keybinds ===
# ====================

# remove text from cursor to eol
bindkey '^L' kill-line

# search history with query
bindkey '^R' history-incremental-search-backward

# insert from command history
bindkey '^N' insert-last-word

# clear screen and wipe history
function _clear {
    zle push-input

    BUFFER='clear'
    zle accept-line
}
zle -N _clear

bindkey -M main  '^K' _clear
bindkey -M vicmd '^K' _clear

# open line contents with editor
function _edit {
    if [[ ! $BUFFER =~ "^$EDITOR.*" ]]; then
        BUFFER="$EDITOR $BUFFER"
        zle end-of-line
    fi
}
zle -N _edit

bindkey -M main  '^E' _edit
bindkey -M vicmd '^E' _edit

# expand alias
zle -C alias-expansion complete-word _generic

bindkey -M main  '^X' alias-expansion
bindkey -M vicmd '^X' alias-expansion

zstyle ':completion:alias-expansion:*' completer _expand_alias

# vi keybinds
function vi_keybinds {
    bindkey -v
    export KEYTIMEOUT=1

    function zle-keymap-select {
        if [[ $KEYMAP == vicmd ]]; then
            printf '\e[2 q'
        elif [[ $KEYMAP == main || $KEYMAP == viins ]]; then
            printf '\e[6 q'
        fi
    }

    function zle-line-init {
        printf '\e[6 q'
    }

    function block_cursor {
        printf '\e[2 q'
    }

    zle -N zle-keymap-select
    zle -N zle-line-init

    add-zsh-hook preexec block_cursor
}
vi_keybinds
