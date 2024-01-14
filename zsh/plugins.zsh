# ===================
# === ZSH Plugins ===
# ===================

# ==============
# === Direnv ===
# ==============

# load direnv
if [[ -n "${commands[direnv]}" ]]; then
  eval "$(direnv hook zsh)"
fi

# ================================
# === History Substring Search ===
# ================================

# bind keys to search
bindkey -M vicmd j history-substring-search-down
bindkey -M vicmd k history-substring-search-up

# highlight colors
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=''
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''

# =============
# === Quark ===
# =============

# load quark
if [[ -n "${commands[quark]}" ]]; then
  eval "$(quark hook zsh)"
fi

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

# ===============
# === Vi Mode ===
# ===============

# escape from insert mode
ZVM_VI_INSERT_ESCAPE_BINDKEY='jk'

# visual selection
ZVM_VI_HIGHLIGHT_FOREGROUND='#a9a9a9'
ZVM_VI_HIGHLIGHT_BACKGROUND='#303030'

# faster keystrokes
ZVM_KEYTIMEOUT=0.1

function zvm_after_init {
  # add custom keybinds
  source ~/.cfg/zsh/keybinds.zsh
}
