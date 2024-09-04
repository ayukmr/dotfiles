" ======================
" === Neovim Plugins ===
" ======================

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
