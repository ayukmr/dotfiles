# =====================
# === Yabai Colemak ===
# =====================

# switch layouts
yabai -m signal --add event=window_focused app!='^kitty|sioyek$' action='~/.cfg/yabai/layout colemak'
yabai -m signal --add event=window_focused app='^kitty|sioyek$'  action='~/.cfg/yabai/layout abc'
