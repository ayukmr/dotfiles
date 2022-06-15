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

# vi keybinds
function vi-mode {
    bindkey -v
    bindkey jk vi-cmd-mode

    # faster keystrokes
    export KEYTIMEOUT=10

    # set cursor shape
    function zle-keymap-select {
        if [[ $KEYMAP == vicmd ]]; then
            block_cursor
        elif [[ $KEYMAP == main || $KEYMAP == viins ]]; then
            line_cursor
        fi
    }

    # set block cursor
    function block_cursor {
        printf '\e[2 q'
    }

    # set line cursor
    function line_cursor {
        printf '\e[6 q'
    }

    zle -N zle-keymap-select

    # set line cursor on prompt
    add-zsh-hook precmd line_cursor

    # set block cursor on exec
    add-zsh-hook preexec block_cursor
}
