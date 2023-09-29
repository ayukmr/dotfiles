# ==================
# === ZSH Prompt ===
# ==================

# get prompt git info
function git_info {
  local info
  local branch

  if git status &> /dev/null; then
    info=''

    # stashed files
    if [[ -n "$(git stash list)" ]]; then
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
    if [[ -n "$(git ls-files --others --exclude-standard)" ]]; then
      info+='?'
    fi

    # format info
    if [[ -n "$info" ]]; then
      info="%B%F{magenta}:%F{red}[$info]"
    fi

    branch="%B%F{magenta}$(git symbolic-ref --short HEAD)"
    echo "$branch%f%b$info%f%b"
  fi
}

# load rprompt async
function async_rprompt {
  function async {
    echo "$(git_info)" > "/tmp/rprompt$$"

    # signal to update prompt
    kill -s USR1 $$
  }

  async &!
  ASYNC_PROC=$$
}

# trap usr1 signal
function TRAPUSR1 {
  if [[ -f "/tmp/rprompt$ASYNC_PROC" ]]; then
    RPROMPT="$(< "/tmp/rprompt$ASYNC_PROC")"
    rm "/tmp/rprompt$ASYNC_PROC"
  fi

  ASYNC_PROC=0

  # redraw prompt
  zle && zle reset-prompt
}

add-zsh-hook precmd async_rprompt

# prompt
PROMPT='%B%F{blue}%~%(?.%F{green}.%b%f %B%F{red}[%?])>%f%b '

# pad if not first line
function pad_prompt {
  if $FIRST_LINE; then
    FIRST_LINE=false
  else
    echo
  fi
}

add-zsh-hook precmd pad_prompt
