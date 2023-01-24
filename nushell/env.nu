# ===================
# === Nushell Env ===
# ===================

# set prompt character
let-env PROMPT_INDICATOR = '> '
let-env PROMPT_INDICATOR_VI_INSERT = '> '
let-env PROMPT_INDICATOR_VI_NORMAL = '> '

# show path in prompt
let-env PROMPT_COMMAND = { pwd | str replace -s $nu.home-path '~' }
