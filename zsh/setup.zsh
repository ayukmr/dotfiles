# =================
# === ZSH Setup ===
# =================

# don't show inverted %
PROMPT_EOL_MARK=''

# get command from alias
function alias_for {
    local found

    # return if command exists
    if [[ (( $+commands[$1] )) || -x "$1" ]]; then
        echo "$@"
        return
    fi

    # get alias command
    found="$(alias "$1" | sed -E -e "s/^$1=(.*)$/\1/" -e "s/^'//" -e "s/'$//")"

    if [[ -n "$found" ]]; then
        echo "$found ${@:2}"
    else
        echo "$@"
    fi
}

# set window title
function set_title {
    echo -ne "\e]2;$(print -P '%1/') – $(basename "$SHELL")\a"
    echo -ne "\033]0;$(print -P '%1/') – $(basename "$SHELL")\007"
}

# set window title with command
function set_title_cmd {
    local expanded

    # split command into parts and trim with sed
    expanded="$(alias_for "${(@s: :)1}" | tr '\n' ' ' | sed -E 's/(.{30}).+/\1…/')"

    echo -ne "\e]2;$(print -P '%1/') – $(basename "$SHELL") ◂ $expanded\a"
    echo -ne "\033]0;$(print -P '%1/') – $(basename "$SHELL") ◂ $expanded\007"
}

# update title on hooks
add-zsh-hook preexec set_title_cmd
add-zsh-hook chpwd   set_title
add-zsh-hook precmd  set_title

# set title
set_title
