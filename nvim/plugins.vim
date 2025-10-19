" ======================
" === Neovim Plugins ===
" ======================

" ==================
" === Treesitter ===
" ==================

lua <<EOF
-- treesitter module
local treesitter = require "nvim-treesitter.configs"

-- setup treesitter
treesitter.setup {
  ensure_installed = "all",

  highlight = {
    enable = true,
  },

  indent = {
    enable = true,
  },

  -- matchup support
  matchup = {
    enable = true,
    disable_virtual_text = true,
  },
}
EOF

" ==============
" === TreeSJ ===
" ==============

" keybinds
nnoremap <silent> gJ :TSJJoin<CR>
nnoremap <silent> gS :TSJSplit<CR>

lua <<EOF
-- treesj module
local treesj = require "treesj"

-- setup treesj
treesj.setup {
  use_default_keymaps = false,
}
EOF
