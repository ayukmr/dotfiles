# ================
# === ZSH Path ===
# ================

# defaults
path=('/opt/homebrew/bin' '/usr/local/bin' '/usr/bin' '/bin' '/usr/sbin' '/sbin')

# ruby
path+="$GEM_HOME/bin"

# rust
path+=~/.cargo/bin

# yarn
path+=~/.yarn/bin

# android
path+=~/Library/Android/sdk/platform-tools

# config
path+=~/.cfg/bin

# local
path+=~/.local/bin

# homebrew env
eval "$(brew shellenv)"

# override binaries
path[1,0]=/opt/homebrew/opt/ruby/bin
path[1,0]=/opt/homebrew/opt/java/bin

# export path
export PATH

# add homebrew completions
fpath+=/opt/homebrew/share/zsh/site-functions

# export fpath
export FPATH
