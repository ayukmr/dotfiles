# =======================
# === Neofetch Config ===
# =======================

# print info
function print_info {
  info title
  info ' os ' distro
  info '󰏖 pkg' packages
  info ' sh ' shell
  info ' wm ' wm
  info ' cpu' cpu
  info ' gpu' gpu
}

# leading newline
echo

# os shorthand
os_arch=off
distro_shorthand=on

# cpu shorthand
cpu_brand=off
cpu_speed=off
speed_shorthand=on

# gpu shorthand
gpu_brand=off

# separator
separator=' '

# text colors
colors=(2 7 7 1 2 7)

# image source
image_source=~/.cfg/neofetch/ascii-source

# image colors
ascii_colors=(2 3 1 5 4 7)
