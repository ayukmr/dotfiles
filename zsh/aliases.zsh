# ===================
# === ZSH Aliases ===
# ===================

# general aliases
alias e='$EDITOR'
alias w='warp'
alias gz='gzip -k'
alias ungz='gzip -dk'
alias rel='exec $SHELL -l'
alias lst='cd - &> /dev/null'

alias bel='tput bel'
alias mk='touch'
alias mkd='mkdir'
alias rmd='rm -rf'
alias files='find . -type file'
alias -- +x='chmod +x'

# command aliases
alias clr='tput reset && unset FIRST_LINE'
alias badge='tput bel && notify'
alias pbuuid='uuidgen | pbcopy && pbpaste'
alias rmds='find . -name .DS_Store -type file -delete'
alias path='echo $PATH | tr -s ":" "\n"'

# ls aliases
alias l='na -ic'
alias lt='na -ict'
alias ll='ls -AlhG'

# cd aliases
alias home='cd ~'
alias cdf='cd $(pwdf)'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkcd='function { mkdir -p $@ && cd $1 }'
alias back='function { cd ${(l:$1*3::../:)} }'
alias bk='back'

# safety aliases
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# lang aliases
alias js='node'
alias gr='go run .'
alias sw='swift'
alias osa='osascript'

# sqlite aliases
alias sqt='sqlite3'
alias lite='litecli'

# ruby aliases
alias rb='ruby'
alias gm='gem'
alias rk='rake'
alias bnd='bundler'

# crystal aliases
alias si='shards install'
alias sr='shards run'
alias sb='shards build'

# python aliases
alias py='python3'
alias py2='python'
alias pi='pip3 install'
alias ipy='ipython'

# rust aliases
alias rc='rustc'
alias c='cargo'
alias cr='cargo run'
alias cb='cargo build'
alias cbr='cargo build --release'
alias ct='cargo test'
alias ccl='cargo clippy'

# yarn aliases
alias y='yarn'
alias yg='yarn global'
alias yga='yarn global add'
alias yd='yarn dev'
alias ys='yarn start'
alias ysv='yarn serve'
alias ya='yarn add'
alias yb='yarn build'
alias ybs='yarn build && yarn start'
alias yrs='yarn run react-scripts start'

# git aliases
alias ga='git add'
alias gp='git push'
alias gd='git diff'
alias gs='git status -s'
alias gl='git log -n 20 --oneline'
alias gsh='git show'
alias grs='git reset'
alias gcl='git clone'
alias gbr='git branch'
alias gst='git status'
alias gct='git commit'
alias ghm='git heatmap'
alias gco='git checkout'
alias gds='git diffstat'
alias gcm='git commit -m'
alias gdc='git diff --cached'

# tmux aliases
alias tm='tmux'
alias tx='tmuxinator'
alias td='tmux detach'
alias tls='tmux list-sessions'

# vim aliases
alias v='anyvim'
alias vi='vim'
alias nv='nvim'

# app aliases
alias svr='open -a ScreenSaverEngine'
alias xcode='open -a Xcode'
alias vscode='open -a "Visual Studio Code"'

# clear screen and history
function clear {
    tput reset
    unset FIRST_LINE

    if [[ -n $TMUX ]] && (( $+commands[tmux] )); then
        tmux clear-history
    fi
}
