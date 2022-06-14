# ===================
# === ZSH Plugins ===
# ===================

# ================================
# === History Substring Search ===
# ================================

# bind keys to search
bindkey -M vicmd k history-substring-search-up
bindkey -M vicmd j history-substring-search-down

# highlight colors
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=black,bg=green,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''

# ===========================
# === Syntax Highlighting ===
# ===========================

# syntax colors
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[builtin]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold,underline'
ZSH_HIGHLIGHT_STYLES[comment]='fg=8,bold'
