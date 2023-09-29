# ======================
# === IPython Config ===
# ======================

import sys
from os.path import expanduser

sys.path.append(expanduser('~/.cfg/ipython'))
from prompt import Prompt

def configure(c):
    # disable banner
    c.TerminalIPythonApp.display_banner = False

    # colors
    c.TerminalInteractiveShell.highlighting_style = 'one-dark'

    # title string
    c.TerminalInteractiveShell.term_title_format = '{cwd} – ipython'

    # custom prompt
    c.TerminalInteractiveShell.prompts_class = Prompt

    # enable truecolor
    c.TerminalInteractiveShell.true_color = True

    # disable confirming exit
    c.TerminalInteractiveShell.confirm_exit = False
