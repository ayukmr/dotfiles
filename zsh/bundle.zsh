# ==================
# === ZSH Bundle ===
# ==================

# zplug location
ZPLUG_HOME="$HOME/.zsh/zplug"
# plugins location
ZPLUG_REPOS="$HOME/.zsh/bundle"

source ~/.zsh/zplug/init.zsh

# =================
# === Oh My ZSH ===
# =================

# [acs] aliases cheatsheet
zplug plugins/aliases, from:oh-my-zsh

# [dotenv] read .env files
zplug plugins/dotenv, from:oh-my-zsh

# ===============
# === General ===
# ===============

# [autosuggestions] fish-like autosuggestions
zplug zsh-users/zsh-autosuggestions

# [syntax-highlighting] fish-like syntax highlighting
zplug zsh-users/zsh-syntax-highlighting, defer:2

zplug load
