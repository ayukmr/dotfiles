" ======================
" === Neovim Plugins ===
" ======================

" ==================
" === Treesitter ===
" ==================

lua <<EOF
-- treesitter module
local treesitter = require 'nvim-treesitter.configs'

-- setup treesitter
treesitter.setup {
  ensure_installed = 'all',

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },

  -- matchup support
  matchup = {
    enable = true,
  },
}
EOF

