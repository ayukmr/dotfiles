# ====================
# === Fish Exports ===
# ====================

# ================
# === Defaults ===
# ================

# editor
set -x EDITOR 'anyvim'

# ================
# === Commands ===
# ================

# colors for lsd
set -x LS_COLORS (tr '\n' ':' < ~/.cfg/zsh/LS_COLORS)

# colorize man pages
set -x LESS_TERMCAP_md (set_color --bold blue)
set -x LESS_TERMCAP_us (set_color green)
set -x LESS_TERMCAP_ue (set_color normal)

# fzf options
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden'
set -x FZF_DEFAULT_OPTS "
  --exact
  --reverse

  --no-scrollbar

  --prompt   '❯ '
  --pointer  '>'
  --marker   '+'
  --ellipsis '…'

  --info inline-right
  --preview-window border-left

  --color bg:#1f1f1f,bg+:#252525,fg:#909090,fg+:#a9a9a9
  --color hl:#519fdf,hl+:#46a6b2,spinner:#d5b06b,info:#56b6c2
  --color pointer:#519fdf,marker:#d5b06b,header:#46a6b2,prompt:#b668cd
  --color gutter:#1f1f1f,border:#909090
"

# homebrew styling
set -x HOMEBREW_NO_EMOJI 1
set -x HOMEBREW_NO_ENV_HINTS 1

# disable venv prompt
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# =============
# === Files ===
# =============

# xdg specification
set -x XDG_CONFIG_HOME ~/.config
set -x XDG_CACHE_HOME  ~/.cache
set -x XDG_DATA_HOME   ~/.local/share
set -x XDG_STATE_HOME  ~/.local/state

# ripgrep config location
set -x RIPGREP_CONFIG_PATH ~/.cfg/rg/rgconfig

# rubygems home
set -x GEM_HOME (ruby -e 'puts Gem.user_dir')

# =============
# === Shell ===
# =============

# history size
set -x HISTSIZE 32768
set -x SAVEHIST 32768
