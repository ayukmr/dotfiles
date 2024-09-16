# =================
# === Fish Path ===
# =================

# homebrew
fish_add_path /opt/homebrew/bin

# golang binaries
fish_add_path -a ~/go/bin

# rust binaries
fish_add_path -a ~/.cargo/bin

# ruby binaries
fish_add_path -a "$GEM_HOME/bin"

# yarn binaries
fish_add_path -a ~/.yarn/bin

# config binaries
fish_add_path -a ~/.cfg/bin

# binaries folder
fish_add_path -a ~/.local/bin

# homebrew env
eval "$(brew shellenv)"
fish_add_path "$HOMEBREW_PREFIX/opt/ruby/bin"

# export path
export PATH
