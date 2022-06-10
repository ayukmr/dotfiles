# ===================
# === ZSH Exports ===
# ===================

# editor
export EDITOR='anyvim'

# config locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export ZDOTDIR="$HOME/.zsh"
export PYTHONSTARTUP="$HOME/.cfg/python/init.py"

# history size
export HISTSIZE=32768
export SAVEHIST=32768

# disable deprecation message in bash
export BASH_SILENCE_DEPRECATION_WARNING=1

# colors for gnu ls
export LS_COLORS=$(cat ~/.cfg/zsh/lscolors.txt | tr '\n' ':')
# colors for bsd ls
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
    --color fg:#abb2bf,hl:#61afef,fg+:#c2c7d1,bg+:#32353d
    --color hl+:#5fd7ff,info:#56b6c2,prompt:#c678dd,pointer:#61afef
    --color marker:#61afef,spinner:#e5c07b,header:#c678dd,border:#9ba2af,bg:-1
    --reverse
    --marker "* "
    --margin 1,4
    --preview-window right:60%
    --border rounded
'
export FZF_DEFAULT_COMMAND='rg --files --hidden --ignore-case'

# homebrew
export HOMEBREW_INSTALL_BADGE='🍻'
export HOMEBREW_NO_ENV_HINTS=1

# load add-zsh-hook
autoload -Uz add-zsh-hook
