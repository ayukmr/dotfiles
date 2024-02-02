" ===================
" === Vim Plugins ===
" ===================

" ==================
" === Buffer Bye ===
" ==================

" delete buffer
nnoremap <silent> <Leader>q :Bdelete<CR>
nnoremap <silent> <Leader>Q :Bdelete!<CR>

" =====================
" === Better Escape ===
" =====================

" escape shortcut
let g:better_escape_shortcut = 'jk'

" ================
" === DevIcons ===
" ================

" extension icons
let s:extension_icons = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = s:extension_icons

let s:extension_icons['cs']   = ''
let s:extension_icons['cr']   = ''
let s:extension_icons['js']   = ''
let s:extension_icons['ts']   = '󰛦'
let s:extension_icons['erb']  = ''
let s:extension_icons['mjs']  = ''
let s:extension_icons['org']  = ''
let s:extension_icons['ttf']  = '󰛖'
let s:extension_icons['xml']  = ''
let s:extension_icons['toml'] = '󰅪'
let s:extension_icons['lock'] = ''
let s:extension_icons['tmux'] = ''
let s:extension_icons['wiki'] = ''
let s:extension_icons['svelte']      = ''
let s:extension_icons['gitconfig']   = '󰊢'
let s:extension_icons['applescript'] = '󰀵'

" exact icons
let s:exact_icons = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = s:exact_icons

let s:exact_icons['brewfile']  = ''
let s:exact_icons['[plugins]'] = ''

let s:exact_icons['.gitignore']     = '󰊢'
let s:exact_icons['.gitattributes'] = '󰊢'

" ===============
" === Dirvish ===
" ===============

" view parent directory
nnoremap + <Plug>(dirvish_up)

" disable line numbers in dirvish buffer
augroup dirvish_no_numbers
  auto!
  auto FileType dirvish setlocal nonumber norelativenumber foldcolumn=1
augroup END

" ===============
" === FZF Vim ===
" ===============

" spawn in bottom split
let g:fzf_layout = { 'down': '15' }

" find files
nnoremap <silent> - :call fzf#vim#files(
  \ FindRootDirectory() != '' ? FindRootDirectory() : expand('%:h'), fzf#vim#with_preview()
\)<CR>

" find files in home
nnoremap <silent> _ :Files ~<CR>

" disable line numbers in fzf buffer
augroup fzf_no_numbers
  auto!
  auto FileType fzf setlocal nonumber norelativenumber
augroup END

" =================
" === GitGutter ===
" =================

" gitgutter symbols
let g:gitgutter_sign_added                   = '++'
let g:gitgutter_sign_modified                = '~~'
let g:gitgutter_sign_removed                 = '--'
let g:gitgutter_sign_removed_first_line      = '^^'
let g:gitgutter_sign_removed_above_and_below = '^-'
let g:gitgutter_sign_modified_removed        = '~-'

" disable clobbering
let g:gitgutter_sign_allow_clobber = 0

" disable by default
let g:gitgutter_enabled = 0

" toggle gitgutter
nnoremap <silent> ]og :GitGutterDisable<CR>
nnoremap <silent> [og :GitGutterEnable<CR>
nnoremap <silent> yog :GitGutterToggle<CR>

" ============
" === Lion ===
" ============

" squeeze spaces
let g:lion_squeeze_spaces = 1

" ===============
" === MatchUp ===
" ===============

" hide offscreen matches
let g:matchup_matchparen_offscreen = {}

" ==============
" === Rooter ===
" ==============

" disable automatic switching
let g:rooter_manual_only = 1

" root patterns
let g:rooter_patterns = [
  \ '.git',
  \ 'Makefile', 'Gemfile', 'Cargo.toml', 'package.json', 'shard.yml',
  \ '=wiki', '=org',
\]

" =============
" === Sneak ===
" =============

" show labels
let g:sneak#label = 1

" prompt
let g:sneak#prompt = '> '

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
  \ { 'vo': '~/org/tasks.org' },
  \ { 'vi': '~/wiki/index.md' },
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

" icons in startify
func! StartifyEntryFormat() abort
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
nnoremap <silent> <Leader>vt :call <SID>vimwiki_fzf()<CR>

" header levels
nnoremap <Leader>vhj <Plug>VimwikiRemoveHeaderLevel
nnoremap <Leader>vhk <Plug>VimwikiAddHeaderLevel

" normalize links
nnoremap <Leader>v+ <Plug>VimwikiNormalizeLink
vnoremap <Leader>v+ <Plug>VimwikiNormalizeLinkVisual

" search tags using fzf
func! s:vimwiki_fzf() abort
  " get tags
  let l:all_tags = systemlist([
    \ 'rg', '-o', '-I', '--no-column', '-r', '$1', ':([\w-]+):', '/Users/ayukuma/wiki'
  \])
  let l:tags = uniq(sort(l:all_tags))

  " select using fzf
  call fzf#run({
    \ 'source': l:tags,
    \ 'sink':   funcref('s:vimwiki_on_tag'),
    \ 'down':   '30%',
  \})
endfunc

" on fzf tag selection
func! s:vimwiki_on_tag(query) abort
  " search tags
  exec 'VimwikiSearchTags ' . a:query

  if !get(getloclist(0, { 'winid': 0 }), 'winid', 0)
    " open location list
    lopen
  endif
endfunc
