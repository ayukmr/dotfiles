# ================
# === ZSH Path ===
# ================

# defaults
path=('/usr/local/bin' '/usr/bin' '/bin' '/usr/sbin' '/sbin')

# golang
path+=('/usr/local/go/bin')

# yarn binaries
path+=("$HOME/.yarn/bin")

# rust binaries
path+=("$HOME/.cargo/bin")

# ruby binaries
path+=("$HOME/.gem/ruby/2.6.0/bin")

# python binaries
path+=("$HOME/Library/Python/3.9/bin")

# zplug binaries
path+=("$ZPLUG_HOME/bin")

# config binaries
path+=("$HOME/.cfg/bin")

# binaries folder
path+=("$HOME/.local/bin")

# export path
export PATH
