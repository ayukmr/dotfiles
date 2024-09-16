# =====================
# === Fish Settings ===
# =====================

# hide greeting
set fish_greeting

# window title
function fish_title
    set -l command $argv[1]

    if [ -z $command ]
        echo (prompt_pwd) — (basename $SHELL)
    else
        # show current command
        echo (prompt_pwd) — (basename $SHELL) ◂ $command
    end
end
