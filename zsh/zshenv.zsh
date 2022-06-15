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

# zsh files
export ZDOTDIR="$HOME/.zsh"

# python config file
export PYTHONSTARTUP="$HOME/.cfg/python/init.py"

# history size
export HISTSIZE=32768
export SAVEHIST=32768

# disable deprecation message in bash
export BASH_SILENCE_DEPRECATION_WARNING=1

# colors for ls
export LS_COLORS=$(cat ~/.cfg/zsh/lscolors.txt | tr '\n' ':')
export LSCOLORS='ExFxxxDxBxhxhxhxhxcxcx'

# colorize man pages
export LESS_TERMCAP_md=$(tput bold; tput setaf 4)
export LESS_TERMCAP_us=$(tput setaf 2)
export LESS_TERMCAP_ue=$(tput setaf 7)

# rubygems home
export GEM_HOME=$(ruby -e 'puts Gem.user_dir')

# bat theme
export BAT_THEME='TwoDark'

# ripgrep config location
export RIPGREP_CONFIG_PATH="$HOME/.cfg/ripgrep/rgconfig"

# fzf
export FZF_DEFAULT_OPTS='
    --color bg+:#32353d,bg:#282c34,spinner:#e5c07b,hl:#61afef
    --color fg:#abb2bf,header:#c678dd,info:#56b6c2,pointer:#61afef
    --color marker:#61afef,fg+:#c2c7d1,prompt:#c678dd,hl+:#5fd7ff

    --reverse
    --marker "* "
    --preview-window right:50%
'
export FZF_DEFAULT_COMMAND='rg --files --hidden --ignore-case'

# homebrew
export HOMEBREW_INSTALL_BADGE='🍻'
export HOMEBREW_NO_ENV_HINTS=1

# load add-zsh-hook
autoload -Uz add-zsh-hook
