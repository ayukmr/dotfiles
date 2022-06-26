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
path+=("$GEM_HOME/bin")

# python binaries
path+=("/Library/Frameworks/Python.framework/Versions/Current/bin")

# config binaries
path+=("$HOME/.cfg/bin")

# binaries folder
path+=("$HOME/.local/bin")

# export path
export PATH
