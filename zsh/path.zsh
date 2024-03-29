# ================
# === ZSH Path ===
# ================

# defaults
path=('/usr/local/bin' '/usr/bin' '/bin' '/usr/sbin' '/sbin')

# golang binaries
path+="$HOME/go/bin"

# python binaries
path+="$HOME/Library/Python/3.8/bin"

# rust binaries
path+="$HOME/.cargo/bin"

# ruby binaries
path+="$GEM_HOME/bin"

# yarn binaries
path+="$HOME/.yarn/bin"

# config binaries
path+="$HOME/.cfg/bin"

# binaries folder
path+="$HOME/.local/bin"

# homebrew env
eval "$(brew shellenv)"
path[1,0]="$HOMEBREW_PREFIX/opt/ruby/bin"

# export path
export PATH

# add homebrew completions
fpath+="$HOMEBREW_PREFIX/share/zsh/site-functions"

# export fpath
export FPATH
