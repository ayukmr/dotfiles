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

" [bbye] better :bd and :bw
Plug 'moll/vim-bbye', { 'as': 'bbye' }

" [better-escape] insert mode escaping
Plug 'jdhao/better-escape.vim', { 'as': 'better-escape' }

" [cmp] lsp completion
Plug 'hrsh7th/nvim-cmp', Nvim({ 'as': 'cmp' })

" [cmp-buffer] completion using buffer words
Plug 'hrsh7th/cmp-buffer', Nvim()

" [cmp-cmdline] completion for command line
Plug 'hrsh7th/cmp-cmdline', Nvim()

" [cmp-nvim-lsp] completion using nvim lsp
Plug 'hrsh7th/cmp-nvim-lsp', Nvim()

" [cmp-path] completion for paths
Plug 'hrsh7th/cmp-path', Nvim()

" [cmp-ultisnips] completion using ultisnips
Plug 'quangnguyen30192/cmp-nvim-ultisnips', Nvim({ 'as': 'cmp-ultisnips' })

" [commentary] comment text
Plug 'tpope/vim-commentary', { 'as': 'commentary' }

" [devicons] icons for filetypes
Plug 'ryanoasis/vim-devicons', { 'as': 'devicons' }

" [dirvish] directory viewer
Plug 'justinmk/vim-dirvish', { 'as': 'dirvish' }

" [dressing] better ui interfaces
Plug 'stevearc/dressing.nvim', Nvim({ 'as': 'dressing' })

" [editorconfig] editorconfig support
Plug 'editorconfig/editorconfig-vim', { 'as': 'editorconfig' }

" [fzf] fuzzy finder
Plug 'junegunn/fzf'

" [fzf-vim] fzf support for vim
Plug 'junegunn/fzf.vim', { 'as': 'fzf-vim' }

" [gitgutter] show git status in gutter
Plug 'airblade/vim-gitgutter', { 'as': 'gitgutter' }

" [highlighted-yank] highlight yank commands
Plug 'machakann/vim-highlightedyank', { 'as': 'highlighted-yank' }

" [lightline] enhanced statusline
Plug 'itchyny/lightline.vim', { 'as': 'lightline' }

" [lightline-bufferline] bufferline for lightline
Plug 'mengelbrecht/lightline-bufferline'

" [lion] alignment operator
Plug 'tommcdo/vim-lion', { 'as': 'lion' }

" [lspconfig] configs for neovim lsp
Plug 'neovim/nvim-lspconfig', Nvim({ 'as': 'lspconfig' })

" [mason] installer for lsp and dap
Plug 'williamboman/mason.nvim', Nvim({ 'as': 'mason' })

" [mason-lspconfig] mason plugin for lspconfig
Plug 'williamboman/mason-lspconfig.nvim', Nvim({ 'as': 'mason-lspconfig' })

" [null-ls] use neovim as a language server
Plug 'jose-elias-alvarez/null-ls.nvim', { 'as': 'null-ls' }

" [onedark] one dark theme
Plug 'joshdick/onedark.vim', { 'as': 'onedark' }

" [plenary] utils for neovim lua
Plug 'nvim-lua/plenary.nvim', { 'as': 'plenary' }

" [polyglot] language syntax pack
Plug 'sheerun/vim-polyglot', { 'as': 'polyglot', 'do': 'rm -r ftplugin after/ftplugin' }

" [repeat] better repetition for plugins
Plug 'tpope/vim-repeat', { 'as': 'repeat' }

" [sneak] quicker movement
Plug 'justinmk/vim-sneak', { 'as': 'sneak' }

" [snippets] snippets for ultisnips
Plug 'honza/vim-snippets', Nvim({ 'as': 'snippets' })

" [startify] start screen
Plug 'mhinz/vim-startify', { 'as': 'startify' }

" [surround] edit surroundings
Plug 'tpope/vim-surround', { 'as': 'surround' }

" [targets] additional targets
Plug 'wellle/targets.vim', { 'as': 'targets' }

" [ultisnips] snippets manager
Plug 'SirVer/ultisnips', Nvim()

" [unimpaired] bracket mappings
Plug 'tpope/vim-unimpaired', { 'as': 'unimpaired' }

" [vimwiki] personal wiki in markdown
Plug 'vimwiki/vimwiki'

call plug#end()
