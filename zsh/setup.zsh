# =================
# === ZSH Setup ===
# =================

# don't show inverted %
PROMPT_EOL_MARK=''

# get command from alias
function alias_for {
  local found

  # return if command exists
  if [[ $+commands[$1] == 1 || -x "$1" ]]; then
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
  echo -n "\e]2;$(print -P '%1/') – $(basename "$SHELL")\a"
}

# set window title with command
function set_title_cmd {
  local expanded

  # expand and format command
  expanded="$(
    alias_for "$1" 2> /dev/null |
      tr '\n' ' ' |
      sed -E -e 's/^ +//' -e 's/ +$//' |
      sed -E 's/(.{30}).+/\1…/'
  )"

  echo -n "\e]2;$(print -P '%1/') – $(basename "$SHELL") ◂ $expanded\a"
}

# update title on hooks
add-zsh-hook preexec set_title_cmd
add-zsh-hook chpwd   set_title
add-zsh-hook precmd  set_title

# set title
set_title
