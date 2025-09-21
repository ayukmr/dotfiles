" ==================
" === Vim Bundle ===
" ==================

" neovim exclusive
func! Nvim(...) abort
  let opts = get(a:000, 0, {})

  return has('nvim')
    \ ? opts
    \ : extend(opts, { 'on': [], 'for': [] })
endfunc

" vim exclusive
func! Vim(...) abort
  let opts = get(a:000, 0, {})

  return !has('nvim')
    \ ? opts
    \ : extend(opts, { 'on': [], 'for': [] })
endfunc

call plug#begin('~/.vim/bundle')

" [sneak] quicker movement
Plug 'justinmk/vim-sneak', { 'as': 'sneak' }

" [bbye] better buffer delete and wipeout
Plug 'moll/vim-bbye', { 'as': 'bbye' }

" [better-escape] insert mode escaping
Plug 'jdhao/better-escape.vim', { 'as': 'better-escape' }

" [blink-cmp] fast completion
Plug 'saghen/blink.cmp', Nvim({ 'as': 'blink-cmp', 'tag': '*' })

" [closetag] automatically close html tags
Plug 'alvan/vim-closetag', { 'as': 'closetag' }

" [commentary] comment text
Plug 'tpope/vim-commentary', { 'as': 'commentary' }

" [conjoin] remove join separators
Plug 'flwyd/vim-conjoin', { 'as': 'conjoin' }

" [devicons] icons for filetypes
Plug 'ryanoasis/vim-devicons', { 'as': 'devicons' }

" [dirvish] directory viewer
Plug 'justinmk/vim-dirvish', { 'as': 'dirvish' }

" [dressing] better ui interfaces
Plug 'stevearc/dressing.nvim', Nvim({ 'as': 'dressing' })

" [editorconfig] editorconfig support
Plug 'editorconfig/editorconfig-vim', { 'as': 'editorconfig' }

" [eunuch] unix commands
Plug 'tpope/vim-eunuch', { 'as': 'eunuch' }

" [friendly-snippets] snippets for blink
Plug 'rafamadriz/friendly-snippets', Nvim()

" [fugitive] git wrapper
Plug 'tpope/vim-fugitive', { 'as': 'fugitive' }

" [fzf] fuzzy finder
Plug 'junegunn/fzf'

" [fzf-vim] fzf commands
Plug 'junegunn/fzf.vim', { 'as': 'fzf-vim' }

" [gitgutter] show git status in gutter
Plug 'airblade/vim-gitgutter', { 'as': 'gitgutter' }

" [goyo] centered editing view
Plug 'junegunn/goyo.vim', { 'as': 'goyo' }

" [highlighted-yank] highlight yank commands
Plug 'machakann/vim-highlightedyank', { 'as': 'highlighted-yank' }

" [indent-object] text objects for indentation
Plug 'michaeljsmith/vim-indent-object', { 'as': 'indent-object' }

" [lexima] automatic delimiters
Plug 'cohama/lexima.vim', { 'as': 'lexima' }

" [lightline] enhanced statusline
Plug 'itchyny/lightline.vim', { 'as': 'lightline' }

" [lightline-bufferline] bufferline for lightline
Plug 'mengelbrecht/lightline-bufferline'

" [lion] alignment operator
Plug 'tommcdo/vim-lion', { 'as': 'lion' }

" [lspconfig] configs for neovim lsp
Plug 'neovim/nvim-lspconfig', Nvim({ 'as': 'lspconfig' })

" [lspfuzzy] fzf for lsp
Plug 'ojroques/nvim-lspfuzzy', { 'as': 'lspfuzzy' }

" [markdown] markdown support
Plug 'preservim/vim-markdown', { 'as': 'markdown' }

" [mason] installer for lsp and dap
Plug 'williamboman/mason.nvim', Nvim({ 'as': 'mason' })

" [mason-lspconfig] mason plugin for lspconfig
Plug 'williamboman/mason-lspconfig.nvim', Nvim({ 'as': 'mason-lspconfig' })

" [matchup] enhanced matchit
Plug 'andymass/vim-matchup', { 'as': 'matchup' }

" [none-ls] use neovim as a language server
Plug 'nvimtools/none-ls.nvim', { 'as': 'none-ls' }

" [none-ls-extras] extra sources for null ls
Plug 'nvimtools/none-ls-extras.nvim', { 'as': 'none-ls-extras' }

" [onedark] one dark theme
Plug 'joshdick/onedark.vim', Vim({ 'as': 'onedark' })

" [onedark-nvim] one dark theme for neovim
Plug 'navarasu/onedark.nvim', Nvim({ 'as': 'onedark-nvim' })

" [pasta] automatic paste indentation
Plug 'ku1ik/vim-pasta', { 'as': 'pasta' }

" [plenary] utils for neovim lua
Plug 'nvim-lua/plenary.nvim', { 'as': 'plenary' }

" [polyglot] language syntax pack
let g:polyglot_disabled = ['sensible']
Plug 'sheerun/vim-polyglot', { 'as': 'polyglot' }

" [repeat] better repetition for plugins
Plug 'tpope/vim-repeat', { 'as': 'repeat' }

" [rooter] project root based on files
Plug 'airblade/vim-rooter', { 'as': 'rooter' }

" [rsi] readline keybinds
Plug 'tpope/vim-rsi', { 'as': 'rsi' }

" [sexp] s-expression motions
Plug 'guns/vim-sexp', { 'as': 'sexp', 'for': 'clojure' }

" [sexp-mappings] better sexp mappings
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'as': 'sexp-mappings', 'for': 'clojure' }

" [splitjoin] split and join lines
Plug 'andrewradev/splitjoin.vim', Vim({ 'as': 'splitjoin' })

" [surround] edit surroundings
Plug 'tpope/vim-surround', { 'as': 'surround' }

" [targets] additional targets
Plug 'wellle/targets.vim', { 'as': 'targets' }

" [treesitter] enhanced syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', Nvim({ 'as': 'treesitter', 'do': ':TSUpdate' })

" [treesj] splitjoin using treesitter
Plug 'wansmer/treesj', Nvim()

" [typst] typst language support
Plug 'kaarmu/typst.vim', { 'as': 'typst' }

" [unimpaired] bracket keybinds
Plug 'tpope/vim-unimpaired', { 'as': 'unimpaired' }

call plug#end()
