# ======================
# === IPython Prompt ===
# ======================

from IPython.terminal.prompts import Prompts, Token

# custom prompt
class Prompt(Prompts):
    # default prompt
    def in_prompt_tokens(self):
        return [(Token.Prompt, '>> ')]

    # output prompt
    def out_prompt_tokens(self):
        return [(Token.Prompt, '=> ')]

    # continuation prompt
    def continuation_prompt_tokens(self):
        return [(Token.Prompt, '** ')]
