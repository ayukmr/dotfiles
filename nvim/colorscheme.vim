" ===========================
" === Neovim Color Scheme ===
" ===========================

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
  highlight Search    ctermfg=235 ctermbg=180 guifg=#1f1f1f guibg=#d5b06b
  highlight CurSearch cterm=bold ctermfg=235 ctermbg=180 gui=bold guifg=#1f1f1f guibg=#d5b06b
  highlight! link IncSearch CurSearch

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
  highlight Sneak      ctermfg=236 ctermbg=39 guifg=#252525 guibg=#519fdf
  highlight SneakLabel ctermfg=236 ctermbg=39 guifg=#252525 guibg=#519fdf
  highlight SneakCurrent cterm=bold ctermfg=236 ctermbg=39 gui=bold guifg=#252525 guibg=#519fdf
  highlight! link SneakScope CursorLine

  " cmp matching text
  highlight CmpItemAbbrMatch      cterm=bold ctermfg=39 gui=bold guifg=#519fdf
  highlight CmpItemAbbrMatchFuzzy cterm=bold ctermfg=39 gui=bold guifg=#519fdf

  " yank color
  highlight! link HighlightedyankRegion Search

  " cursor line number
  highlight! link CursorLineNr CursorLine

  " float cursor line
  highlight DressingCursorLine ctermbg=237 guibg=#393939

  " concealed text
  highlight clear Conceal

  " highlighted paren
  highlight MatchParen cterm=underline ctermfg=39 ctermbg=none gui=underline guifg=#519fdf guibg=none

  " quickfix selection
  highlight QuickFixLine cterm=bold ctermfg=235 ctermbg=180 gui=bold guifg=#1f1f1f guibg=#d5b06b

  " crystal strings
  highlight! link crystalStringDelimiter String
endfunc

" set highlights on theme change
augroup set_highlights
  au!
  au ColorScheme onedark call s:set_highlights()
augroup END

" initialize highlights
call s:set_highlights()
