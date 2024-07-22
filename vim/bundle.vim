" ==================
" === Vim Bundle ===
" ==================

" enable plugin on condition
func! Nvim(...) abort
  let opts = get(a:000, 0, {})

  return has('nvim')
    \ ? opts
    \ : extend(opts, { 'on': [], 'for': [] })
endfunc

call plug#begin('~/.vim/bundle')

" [sneak] quicker movement
Plug 'justinmk/vim-sneak', { 'as': 'sneak' }

" [abolish] word variant commands
Plug 'tpope/vim-abolish', { 'as': 'abolish' }

" [asterisk] improved star motions
Plug 'haya14busa/vim-asterisk', { 'as': 'asterisk' }

" [auto-pairs] automatic delimiters
Plug 'jiangmiao/auto-pairs', { 'as': 'auto-pairs' }

" [bbye] better buffer delete and wipeout
Plug 'moll/vim-bbye', { 'as': 'bbye' }

" [better-escape] insert mode escaping
Plug 'jdhao/better-escape.vim', { 'as': 'better-escape' }

" [closetag] automatically close html tags
Plug 'alvan/vim-closetag', { 'as': 'closetag' }

" [cmp] extensible completion
Plug 'hrsh7th/nvim-cmp', Nvim({ 'as': 'cmp' })

" [cmp-buffer] completion using buffer words
Plug 'hrsh7th/cmp-buffer', Nvim()

" [cmp-cmdline] completion for command line
Plug 'hrsh7th/cmp-cmdline', Nvim()

" [cmp-luasnip] completion using luasnip
Plug 'saadparwaiz1/cmp_luasnip', Nvim({ 'as': 'cmp-luasnip' })

" [cmp-nvim-lsp] completion using nvim lsp
Plug 'hrsh7th/cmp-nvim-lsp', Nvim()

" [cmp-path] completion for paths
Plug 'hrsh7th/cmp-path', Nvim()

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

" [exchange] exchange text
Plug 'tommcdo/vim-exchange', { 'as': 'exchange' }

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

" [luasnip] snippets manager
Plug 'L3MON4D3/LuaSnip', Nvim({ 'as': 'luasnip' })

" [mason] installer for lsp and dap
Plug 'williamboman/mason.nvim', Nvim({ 'as': 'mason' })

" [mason-lspconfig] mason plugin for lspconfig
Plug 'williamboman/mason-lspconfig.nvim', Nvim({ 'as': 'mason-lspconfig' })

" [matchup] enhanced matchit
Plug 'andymass/vim-matchup', { 'as': 'matchup' }

" [none-ls] use neovim as a language server
Plug 'nvimtools/none-ls.nvim', { 'as': 'none-ls' }

" [onedark] one dark theme
Plug 'joshdick/onedark.vim', { 'as': 'onedark' }

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

" [snippets] snippets for luasnip
Plug 'honza/vim-snippets', Nvim({ 'as': 'snippets' })

" [speeddating] better dating
Plug 'tpope/vim-speeddating', { 'as': 'speeddating' }

" [splitjoin] split and join lines
Plug 'andrewradev/splitjoin.vim', { 'as': 'splitjoin' }

" [staff] minimal task format
Plug 'ayukmr/staff'

" [surround] edit surroundings
Plug 'tpope/vim-surround', { 'as': 'surround' }

" [targets] additional targets
Plug 'wellle/targets.vim', { 'as': 'targets' }

" [treesitter] enhanced syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', Nvim({ 'as': 'treesitter', 'do': ':TSUpdate' })

" [unimpaired] bracket keybinds
Plug 'tpope/vim-unimpaired', { 'as': 'unimpaired' }

" [wikigraph] personal wiki graph
Plug 'ayukmr/wikigraph'

call plug#end()
