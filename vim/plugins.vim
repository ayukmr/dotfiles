" ===================
" === Vim Plugins ===
" ===================

" ==================
" === Buffer Bye ===
" ==================

" delete buffer
nnoremap <silent> <Leader>q :Bdelete<CR>
nnoremap <silent> <Leader>Q :Bdelete!<CR>

" ================
" === DevIcons ===
" ================

" extension icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['kt']   = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ts']   = 'ﯤ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cr']   = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['erb']  = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['toml'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['lock'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tmux'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['svelte']  = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['textile'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['asc']  = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['adoc'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yml']  = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yaml'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cson']  = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jsonc'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['scpt']        = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['applescript'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ttf'] = 'ﯔ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['otf'] = 'ﯔ'

" exact icons
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}

let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['brewfile']  = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['[plugins]'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.git']           = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitignore']     = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitattributes'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['cargo.toml']   = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['package.json'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}

let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*webpack.*']  = 'ﰩ'
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['\d;#FZF']      = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['NERD_Tree_\d'] = ''

" ===============
" === FZF Vim ===
" ===============

" find files
nnoremap <silent> `` :call fzf#vim#files(expand('%:h:h'), fzf#vim#with_preview())<CR>

" find files in home
nnoremap <silent> `~ :Files ~<CR>

" ==================
" === Git Gutter ===
" ==================

" gitgutter symbols
let g:gitgutter_sign_added                   = '++'
let g:gitgutter_sign_modified                = '~~'
let g:gitgutter_sign_removed                 = '--'
let g:gitgutter_sign_removed_first_line      = '^^'
let g:gitgutter_sign_removed_above_and_below = '^_'
let g:gitgutter_sign_modified_removed        = '~-'

" disable clobbering
let g:gitgutter_sign_allow_clobber = 0

" hunk movement
nnoremap [g :GitGutterPrevHunk<CR>
nnoremap ]g :GitGutterNextHunk<CR>

" ========================
" === Highlighted Yank ===
" ========================

" highlight color
highlight! link HighlightedyankRegion Search

" mapping for vim
if !exists('##TextYankPost')
  noremap y <Plug>(highlightedyank)
endif

" ===================
" === Indent Line ===
" ===================

" indent line character
let g:indentLine_char = '▎'

" indent line color
let g:indentLine_color_gui = '#2c323c'

" disable for certain buffers
let g:indentLine_fileTypeExclude = ['help', 'startify', 'nerdtree', 'fzf', 'vim-plug', 'Trouble', 'lsp-installer']

" set conceal cursor
let g:indentLine_concealcursor = ''

" =============
" === Sneak ===
" =============

" absolute sneak direction
let g:sneak#absolute_dir = 1

" sneak labels
let g:sneak#label = 1
let g:sneak#target_labels = 'asdgqwertyuiopzxcvbnmfASDGHKLQWERTYUIOPZXCVBNMFJ'

" sneak highlights
highlight! link Sneak          WildMenu
highlight! link SneakScope     Cursor
highlight! link SneakLabel     WildMenu
highlight! link SneakLabelMask Fg

" sneak movement
noremap [s <Plug>Sneak_,
noremap ]s <Plug>Sneak_;

" ================
" === Startify ===
" ================

" startify header
let g:startify_custom_header = startify#pad([
  \ '                             .   ',
  \ '           \ | /            ==   ',
  \ '            \|/           =====/ ',
  \ '     /""""""===""""""\___/  /    ',
  \ '~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ ~~ ~~~',
  \ '     \_____  o          __/      ',
  \ '      \    \         __/         ',
  \ '        \____\______/            ',
\])

" starting commands
let g:startify_commands = [
  \ { 'ff': 'Files'       },
  \ { 'fh': 'History'     },
  \ { 'pi': 'PlugInstall' },
  \ { 'pc': 'PlugClean!'  },
\]

" bookmarked files
let g:startify_bookmarks = [
  \ { 'vs': '~/.cfg/vim/setup.vim'   },
  \ { 'vp': '~/.cfg/vim/plugins.vim' },
\]

" list headers
let g:startify_lists = [
  \ { 'type': 'dir',       'header': startify#pad(['ﱮ Files'    ])},
  \ { 'type': 'sessions',  'header': startify#pad([' Sessions' ])},
  \ { 'type': 'bookmarks', 'header': startify#pad([' Bookmarks'])},
  \ { 'type': 'commands',  'header': startify#pad([' Commands' ])},
\]

" don't change to file directory
let g:startify_change_to_dir = 0

" colors
highlight! link StartifyBracket StartifyNumber
highlight! link StartifySlash   StartifyPath

" enable devicons for startify
func! StartifyEntryFormat()
  return "WebDevIconsGetFileTypeSymbol(absolute_path) . ' ' . entry_path"
endfunc

" ===============
" === Tabular ===
" ===============

" tabularize with character
nnoremap <Leader>t :CharTabularize<CR>
vnoremap <Leader>t :CharTabularize<CR>

" tabularize with character and \zs
nnoremap <Leader>T :CharTabularize!<CR>
vnoremap <Leader>T :CharTabularize!<CR>

" tabularize with character
command! -bang -range CharTabularize call s:CharTabularize(<bang>0, <range>)

func! s:CharTabularize(add_zs, range)
  " use '<,'> for visual selection
  let s:command = a:range
    \ ? "'<,'>Tabularize /"
    \ : 'Tabularize /'

  let s:command .= nr2char(getchar())

  if a:add_zs
    " add \zs to command
    let s:command .= '\zs /l0'
  endif

  exec s:command
endfunc

" ==================
" === Unimpaired ===
" ==================

" switch tabs
nnoremap [t gT
nnoremap ]t gt

" ================
" === Vim Plug ===
" ================

augroup plug_no_numbers
  auto!
  " disable line numbers in vim plug buffer
  auto FileType vim-plug setlocal nonumber
augroup END
