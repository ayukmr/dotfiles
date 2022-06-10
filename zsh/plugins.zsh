# ===================
# === ZSH Plugins ===
# ===================

# ====================
# === Highlighting ===
# ====================

# highlight variable
typeset -A ZSH_HIGHLIGHT_STYLES

# highlight colors
ZSH_HIGHLIGHT_STYLES[builtin]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold,underline'
ZSH_HIGHLIGHT_STYLES[comment]='fg=8,bold'
