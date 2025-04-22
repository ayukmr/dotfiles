# =================
# === Fish Path ===
# =================

# homebrew
fish_add_path /opt/homebrew/bin

# ruby
fish_add_path -a "$GEM_HOME/bin"

# rust
fish_add_path -a ~/.cargo/bin

# yarn
fish_add_path -a ~/.yarn/bin

# android
fish_add_path -a ~/Library/Android/sdk/platform-tools

# config
fish_add_path -a ~/.cfg/bin

# local
fish_add_path -a ~/.local/bin

# homebrew env
eval "$(brew shellenv)"

# override binaries
fish_add_path /opt/homebrew/opt/ruby/bin
fish_add_path /opt/homebrew/opt/java/bin

# export path
export PATH
