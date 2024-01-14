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

let s:extension_icons['cs']   = ''
let s:extension_icons['js']   = ''
let s:extension_icons['ts']   = '󰛦'
let s:extension_icons['cr']   = ''
let s:extension_icons['erb']  = ''
let s:extension_icons['org']  = ''
let s:extension_icons['xml']  = ''
let s:extension_icons['toml'] = '󰅪'
let s:extension_icons['lock'] = ''
let s:extension_icons['tmux'] = ''
let s:extension_icons['wiki'] = ''
let s:extension_icons['gitconfig'] = '󰊢'

let s:extension_icons['svelte']      = ''
let s:extension_icons['applescript'] = '󰀵'

let s:extension_icons['ttf'] = '󰛖'

" exact icons
let s:exact_icons = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = s:exact_icons

let s:exact_icons['brewfile']  = ''
let s:exact_icons['[plugins]'] = ''

let s:exact_icons['.gitignore']     = '󰊢'
let s:exact_icons['.gitattributes'] = '󰊢'

" ===============
" === FZF Vim ===
" ===============

" spawn in bottom split
let g:fzf_layout = { 'down': '30%' }

" find files
nnoremap <silent> - :call fzf#vim#files(expand('%:h:h'), fzf#vim#with_preview())<CR>

" find files in home
nnoremap <silent> _ :Files ~<CR>

" disable line numbers in fzf buffer
augroup fzf_no_numbers
  auto!
  auto FileType fzf setlocal nonumber nornu
augroup END

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

" ============
" === Lion ===
" ============

" squeeze spaces
let g:lion_squeeze_spaces = 1

" =============
" === Sneak ===
" =============

" show labels
let g:sneak#label = 1

" prompt
let g:sneak#prompt = '> '

" colors
highlight! link Sneak          WildMenu
highlight! link SneakScope     Cursor
highlight! link SneakLabel     WildMenu
highlight! link SneakLabelMask Fg

" f and t mappings
noremap f <Plug>Sneak_f
noremap F <Plug>Sneak_F
noremap t <Plug>Sneak_t
noremap T <Plug>Sneak_T

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
  \ { 'pu': 'PlugUpdate'  },
  \ { 'pc': 'PlugClean!'  },
\]

" bookmarked files
let g:startify_bookmarks = [
  \ { 'vs': '~/.cfg/vim/setup.vim'   },
  \ { 'vp': '~/.cfg/vim/plugins.vim' },
\]

" list headers
let g:startify_lists = [
  \ { 'type': 'dir',       'header': startify#pad(['󰉋 Files'    ])},
  \ { 'type': 'sessions',  'header': startify#pad([' Sessions' ])},
  \ { 'type': 'bookmarks', 'header': startify#pad([' Bookmarks'])},
  \ { 'type': 'commands',  'header': startify#pad([' Commands' ])},
\]

" disable changing directory
let g:startify_change_to_dir = 0

" colors
highlight! link StartifyBracket StartifyNumber
highlight! link StartifySlash   StartifyPath

" icons in startify
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

" disable line numbers in vim plug buffer
augroup plug_no_numbers
  auto!
  auto FileType vim-plug setlocal nonumber norelativenumber
augroup END

" ===============
" === VimWiki ===
" ===============

" wiki location
let g:vimwiki_list = [{ 'path': '~/wiki', 'syntax': 'markdown', 'ext': '.md' }]

" keybinds prefix
let g:vimwiki_map_prefix = '<Leader>v'

" disable global extension
let g:vimwiki_global_ext = 0

" disable emoji
let g:vimwiki_emoji_enable = 0

" navigate links
nnoremap [v <Plug>VimwikiPrevLink
nnoremap ]v <Plug>VimwikiNextLink

" toggle lists
nnoremap <Leader>vl <Plug>VimwikiListToggle

" search tags
nnoremap <silent> <Leader>vt :call VimwikiTag()<CR>

" header levels
nnoremap <Leader>vhj <Plug>VimwikiRemoveHeaderLevel
nnoremap <Leader>vhk <Plug>VimwikiAddHeaderLevel

" search tags and open location list
func VimwikiTag()
  " search tags
  execute 'VimwikiSearchTags ' . input('> ')

  if !get(getloclist(0, { 'winid': 0 }), 'winid', 0)
    " open location list
    lopen
  endif
endfunc
