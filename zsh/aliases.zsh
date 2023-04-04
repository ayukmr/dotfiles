# ===================
# === ZSH Aliases ===
# ===================

# general aliases
alias e='$EDITOR'
alias rmd='rm -rf'
alias bel='tput bel'
alias rel='exec $SHELL -l'
alias lst='cd - &> /dev/null'
alias files='find . -type file'
alias -- +x='chmod +x'

# command aliases
alias clr='clear'
alias path='echo $PATH | tr -s ":" "\n"'
alias rmds='find . -name .DS_Store -type file -delete'
alias badge='tput bel && notify'
alias zgenr='zgen reset && exec $SHELL -l'
alias clear='tput reset && unset FIRST_LINE'

# ls aliases
alias l='ls -AhG'
alias ll='ls -AlhG'

# cd aliases
alias cdf='cd $(pwdf)'
alias home='cd ~'
function back { cd ${(l:$1*3::../:)} }
function mkcd { mkdir -p $@ && cd $_ }

# dot aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# creation aliases
alias mk='touch'
alias mkd='mkdir -p'

# lang aliases
alias js='node'
alias sw='swift'
alias gr='go run .'
alias osa='osascript'

# sqlite aliases
alias sqt='sqlite3'
alias ltc='litecli'

# ruby aliases
alias rb='ruby'
alias rk='rake'
alias bn='bundle'

# crystal aliases
alias sr='shards run'
alias sb='shards build'
alias si='shards install'

# python aliases
alias py='python3'
alias py2='python'
alias ipy='ipython'

# rust aliases
alias rc='rustc'
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
alias ys='yarn start'
alias yb='yarn build'
alias yg='yarn global'
alias ysv='yarn serve'
alias yga='yarn global add'
alias ybs='yarn build && yarn start'
alias yrs='yarn run react-scripts start'

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

# tmux aliases
alias tm='tmux'
alias tx='tmuxinator'
alias td='tmux detach'
alias tch='tmux clear-history'
alias tls='tmux list-sessions'

# vim aliases
alias v='anyvim'
alias vi='vim'
alias nv='nvim'

# tldr aliases
alias tl='tldr'
alias tlu='tldr --update'

# system aliases
alias svr='open -a ScreenSaverEngine'
alias slp='pmset sleepnow &> /dev/null'

# other aliases
alias qk='quark'
