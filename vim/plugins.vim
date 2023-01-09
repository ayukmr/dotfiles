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
let s:extension_icons = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = s:extension_icons

let s:extension_icons['kt']      = ''
let s:extension_icons['ts']      = 'ﯤ'
let s:extension_icons['cr']      = ''
let s:extension_icons['erb']     = ''
let s:extension_icons['toml']    = ''
let s:extension_icons['lock']    = ''
let s:extension_icons['tmux']    = ''
let s:extension_icons['svelte']  = ''
let s:extension_icons['textile'] = ''

let s:extension_icons['asc']  = ''
let s:extension_icons['adoc'] = ''

let s:extension_icons['yml']  = ''
let s:extension_icons['yaml'] = ''

let s:extension_icons['cson']  = ''
let s:extension_icons['jsonc'] = ''

let s:extension_icons['scpt']        = ''
let s:extension_icons['applescript'] = ''

let s:extension_icons['ttf'] = 'ﯔ'
let s:extension_icons['otf'] = 'ﯔ'

" exact icons
let s:exact_icons = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = s:exact_icons

let s:exact_icons['brewfile']  = ''
let s:exact_icons['[plugins]'] = ''

let s:exact_icons['.git']           = ''
let s:exact_icons['.gitignore']     = ''
let s:exact_icons['.gitattributes'] = ''

let s:exact_icons['cargo.toml']   = ''
let s:exact_icons['package.json'] = ''

" pattern icons
let s:pattern_icons = {}
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = s:pattern_icons

let s:pattern_icons['.*webpack.*'] = 'ﰩ'
let s:pattern_icons['\d;#FZF']     = ''

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

" ============
" === Lion ===
" ============

" squeeze spaces
let g:lion_squeeze_spaces = 1

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
