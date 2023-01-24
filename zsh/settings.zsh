# ====================
# === ZSH Settings ===
# ====================

# ===============
# === Options ===
# ===============

# ignore duplicate lines in history
setopt HIST_IGNORE_DUPS

# don't save lines starting with space in history
setopt HIST_IGNORE_SPACE

# incrementally update history
setopt INC_APPEND_HISTORY

# allow comments in terminal
setopt INTERACTIVE_COMMENTS

# avoid exiting with ctrl-d
setopt IGNORE_EOF

# ==================
# === Completion ===
# ==================

# select completions using menu
zstyle ':completion:*' menu select

# group completions under group name
zstyle ':completion:*' group-name ''

# use ls colors in file completions
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"

# completion headers
zstyle ':completion:*:descriptions' format '%B%F{magenta}%d%f%b'
zstyle ':completion:*:messages'     format '%B%F{green}%d%f%b'
zstyle ':completion:*:warnings'     format '%B%F{red}no matches found%f%b'
