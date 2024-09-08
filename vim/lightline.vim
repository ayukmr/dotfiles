" =================
" === Lightline ===
" =================

" linter errors count for lightline
func! LightlineErrors() abort
  return luaeval('#vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })')
endfunc

" linter warnings count for lightline
func! LightlineWarnings() abort
  return luaeval('#vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })')
endfunc

" linter info count for lightline
func! LightlineInfo() abort
  return luaeval('#vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })')
endfunc

" add file icon to filetype
func! LightlineFiletype() abort
  return
    \ WebDevIconsGetFileTypeSymbol() . ' ' . (
    \   !empty(&filetype) ? &filetype : 'none'
    \ )
endfunc

" lightline config
let g:lightline = {}

" colorscheme
let g:lightline.colorscheme = 'onedark'

" mode abbreviations
let g:lightline.mode_map = {
  \ 'n':      'NML',
  \ 'i':      'INS',
  \ 'R':      'RPL',
  \ 'v':      'VIS',
  \ 'V':      'VLN',
  \ "\<C-v>": 'VBL',
  \ 'c':      'CMD',
  \ 's':      'SEL',
  \ 'S':      'SLN',
  \ "\<C-s>": 'SBL',
  \ 't':      'TMN',
\}

" active statusline
let g:lightline.active = {
  \ 'left': [
  \   ['mode'],
  \   ['readonly', 'filename', 'modified'],
  \   has('nvim') ? ['errors', 'warnings', 'info'] : [],
  \ ],
  \ 'right': [
  \   ['lineinfo'],
  \   ['filetype'],
  \   ['fileformat', 'fileencoding'],
  \ ],
\}

" inactive statusline
let g:lightline.inactive = {
  \ 'left': [
  \   ['filename', 'modified']
  \ ],
  \ 'right': [
  \   ['filetype']
  \ ],
\}

" tabline
let g:lightline.tabline = {
  \ 'left':  [['buffers']],
  \ 'right': [['tabs']],
\}

" single tab
let g:lightline.tab = {
  \ 'active':   ['tabnum'],
  \ 'inactive': ['tabnum'],
\}

" components
let g:lightline.component = {
  \ 'lineinfo': '%02l:%02c',
  \
  \ 'errors':   '%#LightlineError#%#LightlineMiddle_normal# %{LightlineErrors()}',
  \ 'warnings': '%#LightlineWarn#%#LightlineMiddle_normal# %{LightlineWarnings()}',
  \ 'info':     '%#LightlineInfo#%#LightlineMiddle_normal# %{LightlineInfo()}',
\}

" functions
let g:lightline.component_function = {
  \ 'filetype': 'LightlineFiletype',
\}

" bufferline component
let g:lightline.component_expand = {
  \ 'buffers': 'lightline#bufferline#buffers',
\}

" bufferline component type
let g:lightline.component_type = {
  \ 'buffers': 'tabsel',
\}

" ============================
" === Lightline Bufferline ===
" ============================

" icons in bufferline tabs
let g:lightline#bufferline#enable_devicons = 1

" title for unnamed buffers
let g:lightline#bufferline#unnamed = '[No Name]'

" buffer movement
nnoremap <silent> [b :<C-u>call lightline#bufferline#go_relative(-v:count1)<CR>
nnoremap <silent> ]b :<C-u>call lightline#bufferline#go_relative(v:count1)<CR>

" ================
" === One Dark ===
" ================

" colors
let s:red    = ['#d05c65', 204]
let s:green  = ['#88b369', 114]
let s:yellow = ['#d5b06b', 180]
let s:blue   = ['#519fdf', 39]
let s:cyan   = ['#46a6b2', 38]
let s:purple = ['#b668cd', 170]
let s:white  = ['#a9a9a9', 145]
let s:cursor_grey = ['#252525', 236]
let s:visual_grey = ['#303030', 237]

" define palette
let s:palette = {}

" normal
let s:palette.normal = {
  \ 'left':   [[s:cursor_grey, s:green, 'bold'], [s:white, s:visual_grey]],
  \ 'middle': [[s:white, s:cursor_grey]],
  \ 'right':  [[s:cursor_grey, s:green, 'bold'], [s:white, s:visual_grey]],
  \
  \ 'warning': [[s:cursor_grey, s:yellow]],
  \ 'error':   [[s:cursor_grey, s:red]],
\}

" inactive
let s:palette.inactive = {
  \ 'left':   [[s:cursor_grey, s:white], [s:cursor_grey, s:white]],
  \ 'middle': [[s:white, s:cursor_grey]],
  \ 'right':  [[s:cursor_grey, s:white], [s:cursor_grey, s:white]],
\}

" insert mode
let s:palette.insert = {
  \ 'left':  [[s:cursor_grey, s:blue, 'bold'], [s:white, s:visual_grey]],
  \ 'right': [[s:cursor_grey, s:blue, 'bold'], [s:white, s:visual_grey]],
\}

" replace mode
let s:palette.replace = {
  \ 'left':  [[s:cursor_grey, s:red, 'bold'], [s:white, s:visual_grey]],
  \ 'right': [[s:cursor_grey, s:red, 'bold'], [s:white, s:visual_grey]],
\}

" visual mode
let s:palette.visual = {
  \ 'left':  [[s:cursor_grey, s:yellow, 'bold'], [s:white, s:visual_grey]],
  \ 'right': [[s:cursor_grey, s:yellow, 'bold'], [s:white, s:visual_grey]],
\}

" tabline
let s:palette.tabline = {
  \ 'left':   [[s:white, s:visual_grey]],
  \ 'middle': [[s:white, s:cursor_grey]],
  \
  \ 'right':  [[s:white,       s:visual_grey]],
  \ 'tabsel': [[s:cursor_grey, s:purple, 'bold']],
\}

" flatten palette
let g:lightline#colorscheme#onedark#palette = lightline#colorscheme#flatten(s:palette)
