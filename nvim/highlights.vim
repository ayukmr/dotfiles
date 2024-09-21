" =========================
" === Neovim Highlights ===
" =========================

" ================
" === One Dark ===
" ================

" theme config
let g:onedark_config = {
  \ 'ending_tildes': 1,
  \ 'colors': {
  \   'bg0': '#1f1f1f',
  \   'bg1': '#252525',
  \   'bg2': '#303030',
  \   'bg3': '#303030',
  \
  \   'fg':         '#a9a9a9',
  \   'grey':       '#474747',
  \   'light_grey': '#a9a9a9',
  \   'red':        '#d05c65',
  \   'green':      '#88b369',
  \   'orange':     '#d5b06b',
  \   'yellow':     '#d5b06b',
  \   'blue':       '#519fdf',
  \   'purple':     '#b668cd',
  \   'cyan':       '#46a6b2',
  \ },
  \ 'highlights': {
  \   '@constructor': { 'fg': '$yellow', 'fmt': 'none' },
  \ },
  \ 'diagnostics': {
  \   'undercurl': v:false,
  \ }
\}

" one dark theme
colorscheme onedark

" set highlights
func! s:set_highlights() abort
  " search highlight
  highlight Search cterm=bold ctermfg=235 ctermbg=180 gui=bold guifg=#1f1f1f guibg=#d5b06b
  highlight! link IncSearch  Search
  highlight! link CurSearch  Search
  highlight! link Substitute Search

  " menu selections
  highlight PmenuSel cterm=bold ctermfg=236 ctermbg=39 gui=bold guifg=#252525 guibg=#519fdf
  highlight! link WildMenu PmenuSel

  " diagnostic highlights
  highlight DiagnosticUnderlineError ctermfg=204 guifg=#d05c65
  highlight DiagnosticUnderlineWarn  ctermfg=180 guifg=#d5b06b
  highlight DiagnosticUnderlineInfo  ctermfg=39  guifg=#519fdf

  " lightline linter symbols
  highlight LightlineError ctermfg=204 ctermbg=236 guifg=#d05c65 guibg=#252525
  highlight LightlineWarn  ctermfg=180 ctermbg=236 guifg=#d5b06b guibg=#252525
  highlight LightlineInfo  ctermfg=39  ctermbg=236 guifg=#519fdf guibg=#252525

  " sneak colors
  highlight! link Sneak      PmenuSel
  highlight! link SneakLabel PmenuSel
  highlight! link SneakScope Cursor

  " concealed text
  highlight clear Conceal

  " highlighted paren
  highlight MatchParen cterm=underline ctermfg=39 ctermbg=none gui=underline guifg=#519fdf guibg=none

  " quickfix selection
  highlight QuickFixLine cterm=bold ctermfg=235 ctermbg=180 gui=bold guifg=#1f1f1f guibg=#d5b06b

  if has('nvim')
    " cmp matching text
    highlight CmpItemAbbrMatch      cterm=bold ctermfg=39 gui=bold guifg=#519fdf
    highlight CmpItemAbbrMatchFuzzy cterm=bold ctermfg=39 gui=bold guifg=#519fdf

    " float cursor line
    highlight DressingCursorLine ctermbg=237 guibg=#393939
  endif
endfunc

" set highlights on theme change
augroup set_highlights
  au!
  au ColorScheme onedark call s:set_highlights()
augroup END

" initialize highlights
call s:set_highlights()

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

    -- vim highlighting for markdown
    additional_vim_regex_highlighting = { "markdown" },
  },

  -- matchup support
  matchup = {
    enable = true,
  },
}
EOF
