" ==================
" === Vim Bundle ===
" ==================

" enable plugin on condition
func! Nvim(...)
  let opts = get(a:000, 0, {})

  return has('nvim')
    \ ? opts
    \ : extend(opts, { 'on': [], 'for': [] })
endfunc

if !exists('g:load_vimwiki') || !g:load_vimwiki
  " disable vimwiki
  let g:loaded_vimwiki = 1
endif

call plug#begin('~/.vim/bundle')

" [bbye] better :bd and :bw
Plug 'moll/vim-bbye', { 'as': 'bbye' }

" [cmp] completion
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

" [dressing] better ui for lsp
Plug 'stevearc/dressing.nvim', Nvim({ 'as': 'dressing' })

" [editorconfig] editorconfig support
Plug 'editorconfig/editorconfig-vim', { 'as': 'editorconfig' }

" [fidget] lsp status ui
Plug 'j-hui/fidget.nvim', Nvim({ 'as': 'fidget' })

" [fzf] fuzzy finder
Plug 'junegunn/fzf', { 'do': './install --all' }

" [fzf-vim] fzf support for vim
Plug 'junegunn/fzf.vim', { 'as': 'fzf-vim' }

" [gitbranch] get current git branch
Plug 'itchyny/vim-gitbranch', { 'as': 'gitbranch' }

" [gitgutter] show git status in gutter
Plug 'airblade/vim-gitgutter', { 'as': 'gitgutter' }

" [highlighted-yank] highlight yank commands
Plug 'machakann/vim-highlightedyank', { 'as': 'highlighted-yank' }

" [hy] hy syntax files
Plug 'hylang/vim-hy', { 'as': 'hy' }

" [lightline] enhanced statusline
Plug 'itchyny/lightline.vim', { 'as': 'lightline' }

" [lightline-bufferline] bufferline for lightline
Plug 'mengelbrecht/lightline-bufferline'

" [lion] alignment operator
Plug 'tommcdo/vim-lion', { 'as': 'lion' }

" [lspconfig] configs for neovim lsp
Plug 'neovim/nvim-lspconfig', Nvim({ 'as': 'lspconfig' })

" [lsp-installer] installer for lsp servers
Plug 'williamboman/nvim-lsp-installer', Nvim({ 'as': 'lsp-installer' })

" [null-ls] use neovim as a language server
Plug 'jose-elias-alvarez/null-ls.nvim', { 'as': 'null-ls' }

" [onedark] one dark theme
Plug 'joshdick/onedark.vim', { 'as': 'onedark' }

" [plenary] utils for neovim lua
Plug 'nvim-lua/plenary.nvim', { 'as': 'plenary' }

" [polyglot] language syntax pack
Plug 'sheerun/vim-polyglot', { 'as': 'polyglot', 'do': 'rm -r ./ftplugin' }

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
