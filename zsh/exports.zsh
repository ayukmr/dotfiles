# ===================
# === ZSH Exports ===
# ===================

# editor
export EDITOR='anyvim'

# xdg specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# python config file
export PYTHONSTARTUP="$HOME/.cfg/python/init.py"

# history size
export HISTSIZE=32768
export SAVEHIST=32768

# disable deprecation message in bash
export BASH_SILENCE_DEPRECATION_WARNING=1

# colors for ls
export LSCOLORS='ExFxxxDxBxhxhxhxhxcxcx'
export LS_COLORS="$(tr '\n' ':' < ~/.cfg/zsh/lscolors.txt)"

# colorize man pages
export LESS_TERMCAP_md="$(print -P '%B%F{blue}')"
export LESS_TERMCAP_us="$(print -P '%F{green}')"
export LESS_TERMCAP_ue="$(print -P '%f')"

# rubygems home
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"

# bat theme
export BAT_THEME='TwoDark'

# ripgrep config location
export RIPGREP_CONFIG_PATH="$HOME/.cfg/ripgrep/rgconfig"

# fzf options
export FZF_DEFAULT_OPTS="
    --color bg:#282c34,bg+:#282c34,fg:#abb2bf,fg+:#c2c7d1
    --color hl:#61afef,hl+:#5fd7ff,spinner:#e5c07b,info:#56b6c2
    --color pointer:#61afef,marker:#61afef,header:#c678dd,prompt:#c678dd

    --reverse
    --no-scrollbar
    --marker '*'
    --preview-window noborder
"
export FZF_DEFAULT_COMMAND="rg --files --hidden --ignore-case --glob '!Library/**'"

# homebrew styling
export HOMEBREW_INSTALL_BADGE='🍻'
export HOMEBREW_NO_ENV_HINTS=1

# load add-zsh-hook
autoload -Uz add-zsh-hook
