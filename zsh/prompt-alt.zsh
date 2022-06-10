# ==================
# === ZSH Prompt ===
# ==================

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

        local branch="%B%F{magenta} $(git symbolic-ref --short HEAD)"

        # send git info back to caller
        echo "%f%b$branch%f$info%f%b"
    fi
}

# pad exec command with newline
function pad_exec { echo }
add-zsh-hook preexec pad_exec

# set prompt
function set_prompt {
    if $FIRST_LINE; then
        FIRST_LINE=false
    else
        echo
    fi

    local prompt_git=$(git_info)
    local prompt_path="%F{blue}$(print -P '%2~' | sed -E 's|[^~]+/||')%f%b"

    PROMPT="%B$prompt_path %(?.%F{green}.%F{red})%#%f%b "
    RPROMPT="%B$prompt_git%b"
}
add-zsh-hook precmd set_prompt

# prompt
PROMPT='%B%(?.%F{green}.%F{red})%#%f%b '
