# ==========================
# === QuteBrowser Config ===
# ==========================

from os.path import expanduser

config.load_autoconfig(False)

config.source(expanduser('~/.cfg/qutebrowser/settings.py'))
config.source(expanduser('~/.cfg/qutebrowser/colors.py'))
