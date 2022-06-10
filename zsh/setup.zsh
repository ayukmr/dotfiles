# =================
# === ZSH Setup ===
# =================

# select completions using menu
zstyle ':completion:*' menu select

# group completions under group name
zstyle ':completion:*' group-name ''

# use ls colors in file completions
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# completion headers
zstyle ':completion:*:descriptions' format '%B%F{green}%d%f%b'
zstyle ':completion:*:corrections'  format '%B%F{yellow}%d (errors: %e)%f%b'
zstyle ':completion:*:messages'     format '%B%F{magenta}%d%f%b'
zstyle ':completion:*:warnings'     format '%B%F{red}no matches found%f%b'

# don't show inverted %
PROMPT_EOL_MARK=''

# get command from alias
function alias_for {
    if [[ $1 =~ '[[:punct:]]' ]]; then
        echo $@
        return
    fi

    # get alias command
    local found=$(alias -m $1 | sed -E -e "s/^$1=(.*)$/\1/" -e "s/^'//" -e "s/'$//")

    if [[ -n $found ]]; then
        local full="$found ${@:2}"
    else
        local full=$@
    fi

    # strip trailing whitespace
    echo ${(MS)full##[[:graph:]]*[[:graph:]]}
}

# set window title
function set_title {
    printf '\e]2;%s\a'     "$(print -P '%1/') – $(basename $SHELL)"
    printf '\033]0;%s\007' "$(print -P '%1/') – $(basename $SHELL)"
}

# set window title with command
function set_title_cmd {
    # split $1 into parts and trim with sed
    local expanded=$(alias_for ${(@s: :)1} | sed -E 's/(.{30}).+/\1…/')

    printf '\e]2;%s\a'     "$(print -P '%1/') – $(basename $SHELL) ◂ $expanded"
    printf '\033]0;%s\007' "$(print -P '%1/') – $(basename $SHELL) ◂ $expanded"
}

# update title on hooks
add-zsh-hook preexec set_title_cmd
add-zsh-hook chpwd   set_title
add-zsh-hook precmd  set_title

# set title
set_title

# quark
eval "$(quark hook zsh)"
