# ================
# === ZSH Path ===
# ================

# defaults
path=('/opt/homebrew/bin' '/usr/local/bin' '/usr/bin' '/bin' '/usr/sbin' '/sbin')

# golang binaries
path+=~/go/bin

# rust binaries
path+=~/.cargo/bin

# ruby binaries
path+="$GEM_HOME/bin"

# yarn binaries
path+=~/.yarn/bin

# config binaries
path+=~/.cfg/bin

# binaries folder
path+=~/.local/bin

# homebrew env
eval "$(brew shellenv)"
path[1,0]="$HOMEBREW_PREFIX/opt/ruby/bin"

# export path
export PATH

# add homebrew completions
fpath+="$HOMEBREW_PREFIX/share/zsh/site-functions"

# export fpath
export FPATH
