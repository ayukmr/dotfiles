# ===================
# === Fish Prompt ===
# ===================

# main prompt
function fish_prompt
    set -l stat_color

    # status color
    if [ $status = 0 ]
        set stat_color (set_color green)
    else
        set stat_color (set_color red)
    end

    string join '' -- (set_color --bold) (set_color blue) (prompt_pwd) (set_color normal) ' ' $stat_color '❯' (set_color normal) ' '
end

# git info shown
set __fish_git_prompt_showdirtystate     true
set __fish_git_prompt_showuntrackedfiles true
set __fish_git_prompt_showcolorhints     true
set __fish_git_prompt_showstashstate     true

# git symbols
set __fish_git_prompt_char_dirtystate     '!'
set __fish_git_prompt_char_untrackedfiles '?'

# git section colors
set __fish_git_prompt_color_branch      --bold magenta
set __fish_git_prompt_color_dirtystate  --bold red
set __fish_git_prompt_color_stagedstate --bold green
set __fish_git_prompt_color_flags       --bold red

# right prompt
function fish_right_prompt
    set -l git_prompt (fish_git_prompt)

    if [ $status = 0 ]
        set -l prompt (string sub -s 3 -e -1 $git_prompt)
        string join '' -- (set_color --bold magenta) 󰘬 (set_color normal) ' ' $prompt
    end
end

# vi mode prompt
function fish_mode_prompt
end

# pad prompt
function pad_prompt --on-event fish_postexec
    echo
end
