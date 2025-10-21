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
" === Closetag ===
" ================

" additional filetypes
let g:closetag_filetypes = 'html,javascriptreact,svelte'
let g:closetag_regions = {}

" ================
" === DevIcons ===
" ================

" extension icons
let s:extension_icons = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = s:extension_icons

let s:extension_icons['cr'] = ''
let s:extension_icons['cs'] = ''
let s:extension_icons['js'] = ''
let s:extension_icons['ts'] = '󰛦'
let s:extension_icons['clj'] = ''
let s:extension_icons['erb'] = ''
let s:extension_icons['mjs'] = ''
let s:extension_icons['org'] = ''
let s:extension_icons['ttf'] = '󰛖'
let s:extension_icons['xml'] = ''
let s:extension_icons['cljs'] = ''
let s:extension_icons['lock'] = ''
let s:extension_icons['tmux'] = ''
let s:extension_icons['toml'] = '󰅪'
let s:extension_icons['wgsl'] = ''
let s:extension_icons['swift'] = '󰛥'
let s:extension_icons['svelte'] = ''
let s:extension_icons['gitconfig'] = '󰊢'
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
nnoremap \| <Plug>(dirvish_up)

" buffer parent keybind
augroup dirvish_parent_keybind
  au!
  au FileType dirvish nnoremap <buffer> - <Plug>(dirvish_up)
augroup END

" disable line numbers
augroup dirvish_no_numbers
  au!
  au FileType dirvish setlocal nonumber
augroup END

" ====================
" === EditorConfig ===
" ====================

" disable line length column
let g:EditorConfig_disable_rules = ['max_line_length']

" ==============
" === Eunuch ===
" ==============

" disable maps
let g:eunuch_no_maps = 1

" ===============
" === FZF Vim ===
" ===============

" float styling
let $FZF_DEFAULT_OPTS = $FZF_DEFAULT_OPTS . '--border sharp --padding 0,1,0,0'

" window size
let g:fzf_layout = {
  \ 'window': { 'width': 0.75, 'height': 0.6 }
\}

" ensure fast esc
inoremap <Esc> <Esc>

" select buffer
nnoremap <silent> - :Buffers<CR>

" find files
nnoremap <silent> _ :Files<CR>
nnoremap <silent> + :Files ~<CR>

" ripgrep search
nnoremap <silent> <Leader>- :RG<CR>
nnoremap <silent> <Leader>_ <C-w>v:RG<CR>

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
let g:goyo_width = '115'
let g:goyo_height = '100%'

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
  " enable wrapping
  call Wrap()

  " fix nontext highlight
  highlight NonText ctermfg=238 guifg=#303030

  " hide tabline
  call lightline#disable()

  " hide tabline background
  highlight! link TabLineFill Normal

  " clear tabline
  set showtabline=2
  set tabline=\ "
endfunc

" on goyo leave
func! s:goyo_leave() abort
  " disable wrapping
  call NoWrap()

  " show tabline
  call lightline#enable()
endfunc

" toggle goyo
nnoremap <silent> <Leader>G :Goyo<CR>

" ==============
" === Lexima ===
" ==============

" inline latex
call lexima#add_rule({'char': '$',    'input_after': '$',           'filetype': 'markdown'})
call lexima#add_rule({'char': '$',    'at': '\%#\$',   'leave': 1,  'filetype': 'markdown'})
call lexima#add_rule({'char': '<BS>', 'at': '\$\%#\$', 'delete': 1, 'filetype': 'markdown'})

" crystal
call lexima#add_rule(lexima#endwise_rule#make_rule('^\s*\%(module\|def\|class\|if\|unless\|for\|while\|until\|case\)\>\%(.*[^.:@$]\<end\>\)\@!.*\%#$', 'end', 'crystal', []))
call lexima#add_rule(lexima#endwise_rule#make_rule('^\s*\%(begin\)\s*\%#$', 'end', 'crystal', []))
call lexima#add_rule(lexima#endwise_rule#make_rule('\%(^\s*#.*\)\@<!do\%(\s*|.*|\)\?\s*\%#$', 'end', 'crystal', []))
call lexima#add_rule(lexima#endwise_rule#make_rule('\<\%(if\|unless\)\>.*\%#$', 'end', 'crystal', 'crystalConditionalExpression'))

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

" enable conceal
augroup markdown_conceal
  au!
  au FileType markdown setlocal conceallevel=2
augroup END

" ===============
" === MatchUp ===
" ===============

" hide offscreen matches
let g:matchup_matchparen_offscreen = {}

" ==============
" === Rooter ===
" ==============

" root patterns
let g:rooter_patterns = [
  \ '.git',
  \ 'Makefile', 'Gemfile', 'Cargo.toml', 'package.json', 'shard.yml',
  \ '=wiki',
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
