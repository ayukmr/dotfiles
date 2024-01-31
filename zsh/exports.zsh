# ===================
# === ZSH Exports ===
# ===================

# ================
# === Defaults ===
# ================

# editor
export EDITOR='anyvim'

# disable deprecation message in bash
export BASH_SILENCE_DEPRECATION_WARNING=1

# ================
# === Commands ===
# ================

# colors for ls
export LSCOLORS='ExFxxxDxBxhxhxhxhxcxcx'
export LS_COLORS="$(tr '\n' ':' < ~/.cfg/zsh/LS_COLORS)"

# colorize man pages
export LESS_TERMCAP_md="$(print -P '%B%F{blue}')"
export LESS_TERMCAP_us="$(print -P '%F{green}')"
export LESS_TERMCAP_ue="$(print -P '%f')"

# fzf options
export FZF_DEFAULT_COMMAND="rg --files --hidden"
export FZF_DEFAULT_OPTS="
  --exact
  --reverse

  --no-info
  --no-scrollbar

  --marker '*'
  --ellipsis '…'
  --preview-window noborder

  --color bg:#1f1f1f,bg+:#252525,fg:#a9a9a9,fg+:#a9a9a9
  --color hl:#519fdf,hl+:#46a6b2,spinner:#d5b06b,info:#56b6c2
  --color pointer:#519fdf,marker:#d5b06b,gutter:#1f1f1f,header:#b668cd,prompt:#b668cd
"

# homebrew styling
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_NO_ENV_HINTS=1

# =============
# === Files ===
# =============

# xdg specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ripgrep config location
export RIPGREP_CONFIG_PATH="$HOME/.cfg/ripgrep/rgconfig"

# rubygems home
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
path+="$GEM_HOME/bin"

# =============
# === Shell ===
# =============

# history size
export HISTSIZE=32768
export SAVEHIST=32768
