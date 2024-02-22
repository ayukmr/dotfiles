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

" ===================
" === DelimitMate ===
" ===================

" matching pairs
let delimitMate_matchpairs = "(:),[:],{:}"

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

" disable line numbers
augroup dirvish_no_numbers
  au!
  au FileType dirvish setlocal nonumber
augroup END

" ===============
" === FZF Vim ===
" ===============

" float styling
let $FZF_DEFAULT_OPTS = $FZF_DEFAULT_OPTS . '--border sharp --padding 0,1,0,0'

" find files
nnoremap <silent> - :call fzf#vim#files(
  \ FindRootDirectory() != '' ? FindRootDirectory() : expand('%:h'),
  \ fzf#vim#with_preview({ 'options': "--prompt '❯ '" }),
\)<CR>

" find files in home
nnoremap <silent> _ :call fzf#vim#files(
  \ expand('~'),
  \ fzf#vim#with_preview({ 'options': "--prompt '❯ '" }),
\)<CR>

" select buffer
nnoremap <silent> <Leader><Leader> :call fzf#vim#buffers(
  \ '', fzf#vim#with_preview({ 'options': "--prompt '❯ '" })
\)<CR>

" find text
nnoremap <silent> <Leader>G :call fzf#vim#grep2(
  \ 'rg --column --line-number --no-heading --smart-case --color always -- ', '',
  \ fzf#vim#with_preview({ 'options': "--prompt '❯ '" })
\)<CR>

" disable line numbers
augroup fzf_no_numbers
  au!
  au FileType fzf setlocal nonumber
augroup END

" disable fzf statusline
augroup fzf_no_statusline
  au!
  au User FzfStatusLine :
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
" === Goyo ===
" ============

" sizing
let g:goyo_width='115'
let g:goyo_height='90%'

" line numbers
let g:goyo_linenr = 1

" setup goyo
augroup goyo_setup
  au!
  au User GoyoEnter call s:goyo_enter()
  au User GoyoLeave call s:goyo_leave()
augroup END

" on goyo enter
func! s:goyo_enter() abort
  " fix nontext highlight
  highlight NonText ctermfg=238 guifg=#303030

  " text wrapping
  set wrap linebreak

  " show tabline
  let g:lightline.enable = {
    \ 'statusline': 0,
    \ 'tabline':    1,
  \}
  set showtabline=2
  call lightline#enable()

  " move visually
  noremap j gj
  noremap k gk
  noremap 0 g0
  noremap ^ g^
  noremap $ g$
endfunc

" on goyo leave
func! s:goyo_leave() abort
  " disable wrapping
  set nowrap nolinebreak

  " show both lines
  let g:lightline.enable = {
    \ 'statusline': 1,
    \ 'tabline':    1,
  \}
  call lightline#enable()

  " move normally
  nunmap j
  nunmap k
  nunmap 0
  nunmap ^
  nunmap $
endfunc

" ============
" === Lion ===
" ============

" squeeze spaces
let g:lion_squeeze_spaces = 1

" ================
" === Markdown ===
" ================

" allow latex
let g:vim_markdown_math = 1

" show strikethrough
let g:vim_markdown_strikethrough = 1

" links without extension
let g:vim_markdown_no_extensions_in_markdown = 1

" disable list indentation
let g:vim_markdown_new_list_item_indent = 0

" disable default keybinds
let g:vim_markdown_no_default_key_mappings = 1

" filetype keybinds
augroup markdown_keybinds
  au!
  au FileType markdown call s:markdown_keybinds()
augroup END

" define markdown keybinds
func! s:markdown_keybinds() abort
  " create bullet
  nnoremap <buffer> <CR> A<CR>

  " go to link
  nnoremap <buffer> gf <Plug>Markdown_EditUrlUnderCursor
endfunc

" ===============
" === MatchUp ===
" ===============

" hide offscreen matches
let g:matchup_matchparen_offscreen = {}

" ===========
" === Org ===
" ===========

" state keywords
let g:org_state_keywords = ['TODO', 'NEXT', 'PROG', 'BLKD', 'DONE']

" ==============
" === Rooter ===
" ==============

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

" ====================
" === Speed Dating ===
" ====================

" add org date format
augroup org_date_format
  au!
  au VimEnter * SpeedDatingFormat %Y-%m-%d %a
augroup END

" ==================
" === Unimpaired ===
" ==================

" switch tabs
nnoremap [t gT
nnoremap ]t gt

" ================
" === Vim Plug ===
" ================

" disable line numbers
augroup plug_no_numbers
  au!
  au FileType vim-plug setlocal nonumber
augroup END

" =================
" === Wikigraph ===
" =================

" focus file in graph
augroup wikigraph_focus
  au!
  au BufEnter *.md call wikigraph#focus_file()
augroup END
