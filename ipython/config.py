# ======================
# === IPython Config ===
# ======================

import sys
from os.path import expanduser

sys.path.append(expanduser('~/.cfg/ipython'))

from prompt import Prompt

def configure(c):
    # ipython logo as banner
    c.TerminalInteractiveShell.banner1 = 'IP\33[34m[\33[0my\33[34m]\33[0m | IPython v8.3.0\n'

    # set colors
    c.InteractiveShell.colors = 'Linux'

    # set title string
    c.TerminalInteractiveShell.term_title_format = '{cwd} – ipython'

    # set custom prompt
    c.TerminalInteractiveShell.prompts_class = Prompt

    # enable truecolor
    c.TerminalInteractiveShell.true_color = True
