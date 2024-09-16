# ==========================
# === Fish Abbreviations ===
# ==========================

# general aliases
alias e='$EDITOR'
alias rel='exec fish'
alias +x='chmod +x'

# complex aliases
alias rmds='find . -name .DS_Store -type file -delete'

# ls aliases
alias l='lsd'
alias ll='lsd -l'
alias lt='lsd --tree'

# recursive aliases
alias rmr='rm -r'
alias rmf='rm -rf'
alias cpr='cp -r'

# shorthands
alias b='bat'
alias so='source'
alias drv='direnv'

# creation aliases
alias mk='touch'
alias mkd='mkdir'

# lang aliases
alias jl='julia'
alias sw='swift'

# sqlite aliases
alias sqt='sqlite3'
alias ltc='litecli'

# ruby aliases
alias rb='ruby'
alias ru='rackup'

# python aliases
alias py='python3'
alias ipy='ipython'

# crystal aliases
alias s='shards'
alias sr='shards run'

# flutter aliases
alias f='flutter'
alias fr='flutter run'
alias fb='flutter build'
alias fe='flutter emulator'
alias fel='flutter emulator --launch'
alias fp='flutter pub'
alias fpg='flutter pub get'
alias fpa='flutter pub add'

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

# httpie aliases
alias hp='https'
alias hpx='http'
