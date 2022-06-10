# ===================
# === Python Init ===
# ===================

import os
import sys
import atexit
import readline

# ================
# === Settings ===
# ================

# custom prompt
sys.ps1 = '\001\033[32m\002>>\001\033[0m\002 '
sys.ps2 = '\001\033[33m\002**\001\033[0m\002 '

# tab completions
readline.parse_and_bind('tab: complete')

# ========================
# === Set History File ===
# ========================

# history file location
history = os.path.join(
    os.environ['XDG_CACHE_HOME'],
    'python',
    'history'
)

try:
    readline.read_history_file(history)
except OSError:
    pass

# write to history file
def write_history():
    try:
        readline.write_history_file(history)
    except OSError:
        pass

atexit.register(write_history)
