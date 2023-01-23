# ==================
# === ZSH Bundle ===
# ==================

# plugins location
ZGEN_DIR="$HOME/.zsh/bundle"

source ~/.zsh/zgen/zgen.zsh

if ! zgen saved; then
    # [autosuggestions] fish-like autosuggestions
    zgen load zsh-users/zsh-autosuggestions

    # [history-substring-search] search for substring in history
    zgen load zsh-users/zsh-history-substring-search

    # [syntax-highlighting] fish-like syntax highlighting
    zgen load zsh-users/zsh-syntax-highlighting

    # [vi-mode] better vi keybinds for zsh
    zgen load jeffreytse/zsh-vi-mode

    zgen save
fi
