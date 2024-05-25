# ===================
# === ZSH Aliases ===
# ===================

# general aliases
alias e='$EDITOR'
alias bel='tput bel'
alias rel='exec -l zsh'
alias qlm='qlmanage -p'
alias fls='find . -type file'
alias -- +x='chmod +x'

# complex aliases
alias bdg='tput bel && notify'
alias path='tr -s ":" "\n" <<< "$PATH"'
alias rmds='find . -name .DS_Store -type file -delete'
alias zgnr='zgen reset && exec -l "$SHELL"'
alias clear='tput reset && unset FIRST_LINE'

# ls aliases
alias l='lsd'
alias ll='lsd -l'
alias lt='lsd --tree'

# recursive aliases
alias rmr='rm -r'
alias rmf='rm -rf'
alias cpr='cp -r'

# cd aliases
alias cdf='cd "$(pwdf)"'

function mkcd {
  mkdir -p "$@" && cd "$_"
}

# shorthands
alias b='bat'
alias bw='brew'
alias cl='curl'
alias clr='clear'
alias drv='direnv'
alias sha='sha1sum'

# creation aliases
alias mk='touch'
alias mkd='mkdir'

# lang aliases
alias nd='node'
alias sw='swift'
alias gr='go run .'
alias osa='osascript'

# sqlite aliases
alias sqt='sqlite3'
alias ltc='litecli'

# ruby aliases
alias rb='ruby'
alias ru='rackup'
alias bnd='bundle'

# python aliases
alias py='python3'
alias ipy='ipython'

# crystal aliases
alias s='shards'
alias sr='shards run'

# rust aliases
alias c='cargo'
alias cr='cargo run'
alias ct='cargo test'
alias cb='cargo build'
alias ccl='cargo clippy'
alias crr='cargo run --release'
alias cbr='cargo build --release'

# yarn aliases
alias y='yarn'
alias ya='yarn add'
alias yd='yarn dev'
alias yr='yarn run'
alias ys='yarn start'
alias yb='yarn build'
alias yg='yarn global'
alias ysv='yarn serve'
alias yrm='yarn remove'

# git aliases
alias ga='git add'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gs='git status -s'
alias gl='git log -n 20 --oneline'
alias glg='git log'
alias gsh='git show'
alias gpl='git pull'
alias grs='git reset'
alias gcl='git clone'
alias gbr='git branch'
alias gst='git status'
alias gap='git add -p'
alias ghm='git heatmap'
alias gpf='git push -f'
alias gco='git checkout'
alias gds='git diffstat'
alias gsl='git shortlog'
alias gcm='git commit -m'
alias glo='git log --oneline'
alias gdc='git diff --cached'

# tmux command aliases
alias tm='tmux'
alias tmx='tmuxinator'

# tmux aliases
alias td='tmux detach'
alias tch='tmux clear-history'
alias tls='tmux list-sessions'

# vim aliases
alias v='anyvim'
alias vi='vim'
alias nv='nvim'

# quark aliases
alias qk='quark'
alias ql='quark list'
alias qcl='quark clean'

# zest aliases
alias zt='zest'
alias ztc='zest config run'
alias ztp='zest packages run'
alias zts='zest script run'

# tldr aliases
alias tl='tldr'
alias tlu='tldr --update'

# httpie aliases
alias hp='https'
alias hpx='http'

# system aliases
alias svr='open -a ScreenSaverEngine'
alias slp='pmset sleepnow &> /dev/null'
