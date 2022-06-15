# ============================
# === ZSH Multiline Prompt ===
# ============================

# get prompt git info
function git_info {
    if git status &> /dev/null; then
        local info=''

        # stashed files
        if [[ -n $(git stash list) ]]; then
            info+='$'
        fi

        # staged files
        if ! git diff --cached --quiet; then
            info+='+'
        fi

        # modified files
        if ! git diff --no-ext-diff --quiet; then
            info+='!'
        fi

        # untracked files
        if [[ -n $(git ls-files --others --exclude-standard) ]]; then
            info+='?'
        fi

        if [[ -n $info ]]; then
            info=" %F{red}[$info]"
        fi

        local branch="%B%F{magenta} $(git symbolic-ref --short HEAD)"

        # send git info back to caller
        echo "%f%b on $branch%f$info%f%b"
    fi
}

# pad exec command with newline
function pad_exec { echo }
preexec_functions+=('pad_exec')

# set prompt header
function set_header {
    if $FIRST_LINE; then
        FIRST_LINE=false
    else
        echo
    fi

    local header_root="%(!.%F{red}root%f%b in %B.)"
    local header_git=$(git_info)
    local header_path="%F{blue}$(print -P '%2~' | sed -E 's|[^~]+/||')%f%b"

    # prompt header
    print -P "%B$header_root$header_path$header_git"
}
precmd_functions+=('set_header')

# prompt
PROMPT='%B%(?.%F{green}.%F{red})❯%f%b '
PS2='%B%F{yellow}…%f%b '
