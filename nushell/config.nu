# ======================
# === Nushell Config ===
# ======================

let-env config = {
  table: {
    # use compact mode
    mode: compact
  }

  ls: {
    # disable clickable links
    clickable_links: false
  }

  cd: {
    # allow abbreviations
    abbreviations: true
  }

  # use vim keybinds
  edit_mode: vi

  # disable banner
  show_banner: false
}
