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
    \   strlen(&filetype) ? &filetype : 'none'
    \ )
endfunc

" amount of tabs
func! LightlineTabNum()
  return ' ' . tabpagenr()
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
  \ 'left': [
  \   ['buffers'],
  \ ],
  \ 'right': [
  \   ['tabnum'],
  \ ]
\}

" components
let g:lightline.component = {
  \ 'lineinfo': '%02l:%02c',
  \
  \ 'errors':   '%#LightlineError#%#LightlineLeft_active_2# %{LightlineErrors()}',
  \ 'warnings': '%#LightlineWarn#%#LightlineLeft_active_2# %{LightlineWarnings()}',
  \ 'info':     '%#LightlineInfo#%#LightlineLeft_active_2# %{LightlineInfo()}',
\}

" functions
let g:lightline.component_function = {
  \ 'filetype': 'LightlineFiletype',
  \ 'tabnum':   'LightlineTabNum',
\}

" bufferline component
let g:lightline.component_expand = {
  \ 'buffers': 'lightline#bufferline#buffers',
\}

" bufferline component type
let g:lightline.component_type = {
  \ 'buffers': 'tabsel',
\}

" refresh with timer
call timer_start(&updatetime, {-> lightline#update() }, { 'repeat': -1 })

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

" default colors
let s:colors = onedark#GetColors()

" colors
let s:red    = [s:colors.red.gui,    s:colors.red.cterm]
let s:green  = [s:colors.green.gui,  s:colors.green.cterm]
let s:yellow = [s:colors.yellow.gui, s:colors.yellow.cterm]
let s:blue   = [s:colors.blue.gui,   s:colors.blue.cterm]
let s:cyan   = [s:colors.cyan.gui,   s:colors.cyan.cterm]
let s:purple = [s:colors.purple.gui, s:colors.purple.cterm]
let s:white  = [s:colors.white.gui,  s:colors.white.cterm]
let s:cursor_grey = [s:colors.cursor_grey.gui, s:colors.cursor_grey.cterm]
let s:visual_grey = [s:colors.visual_grey.gui, s:colors.visual_grey.cterm]

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
  \ 'right':  [[s:purple,      s:visual_grey, 'bold']],
  \ 'tabsel': [[s:cursor_grey, s:purple,      'bold']],
\}

" flatten palette
let g:lightline#colorscheme#onedark#palette = lightline#colorscheme#flatten(s:palette)
