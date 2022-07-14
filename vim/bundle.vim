" ==================
" === Vim Bundle ===
" ==================

" enable plugin on condition
func! Cond(cond, ...)
    let opts = get(a:000, 0, {})

    return a:cond
        \ ? opts
        \ : extend(opts, { 'on': [], 'for': [] })
endfunc

call plug#begin('~/.vim/bundle')

" [alt-mappings] fix meta key bindings
Plug 'vim-utils/vim-alt-mappings', Cond(!has('nvim'), { 'as': 'alt-mappings' })

" [bbye] better :bd and :bw
Plug 'moll/vim-bbye', { 'as': 'bbye' }

" [cmp] completion
Plug 'hrsh7th/nvim-cmp', Cond(has('nvim'), { 'as': 'cmp' })

" [cmp-buffer] completion using buffer words
Plug 'hrsh7th/cmp-buffer', Cond(has('nvim'))

" [cmp-cmdline] completion for command line
Plug 'hrsh7th/cmp-cmdline', Cond(has('nvim'))

" [cmp-nvim-lsp] completion using nvim lsp
Plug 'hrsh7th/cmp-nvim-lsp', Cond(has('nvim'))

" [cmp-path] completion for paths
Plug 'hrsh7th/cmp-path', Cond(has('nvim'))

" [cmp-ultisnips] completion using ultisnips
Plug 'quangnguyen30192/cmp-nvim-ultisnips', Cond(has('nvim'), { 'as': 'cmp-ultisnips' })

" [commentary] comment text
Plug 'tpope/vim-commentary', { 'as': 'commentary' }

" [devicons] icons for various plugins
Plug 'ryanoasis/vim-devicons', { 'as': 'devicons' }

" [dressing] better ui for lsp
Plug 'stevearc/dressing.nvim', Cond(has('nvim'), { 'as': 'dressing' })

" [easymotion] motions on speed
Plug 'easymotion/vim-easymotion', { 'as': 'easymotion' }

" [editorconfig] editorconfig support
Plug 'editorconfig/editorconfig-vim', { 'as': 'editorconfig' }

" [expand-region] expand select region
Plug 'terryma/vim-expand-region', { 'as': 'expand-region' }

" [fidget] lsp status ui
Plug 'j-hui/fidget.nvim', Cond(has('nvim'), { 'as': 'fidget' })

" [fix-cursor-hold] fix updatetime for neovim
Plug 'antoinemadec/FixCursorHold.nvim', Cond(has('nvim'), { 'as': 'fix-cursor-hold' })

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

" [indent-line] show indent lines
Plug 'Yggdroot/indentLine', { 'as': 'indent-line' }

" [lightline] enhanced statusline
Plug 'itchyny/lightline.vim', { 'as': 'lightline' }

" [lightline-bufferline] bufferline for lightline
Plug 'mengelbrecht/lightline-bufferline'

" [lspconfig] configs for neovim lsp
Plug 'neovim/nvim-lspconfig', Cond(has('nvim'), { 'as': 'lspconfig' })

" [nerdtree] file tree in sidebar
Plug 'preservim/nerdtree'

" [nerdtree-colors] file colors for nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'as': 'nerdtree-colors' }

" [null-ls] use neovim as a language server
Plug 'jose-elias-alvarez/null-ls.nvim', { 'as': 'null-ls' }

" [lsp-installer] installer for lsp servers
Plug 'williamboman/nvim-lsp-installer', Cond(has('nvim'), { 'as': 'lsp-installer' })

" [onedark] one dark theme
Plug 'joshdick/onedark.vim', { 'as': 'onedark' }

" [plenary] utils for neovim lua
Plug 'nvim-lua/plenary.nvim', { 'as': 'plenary' }

" [polyglot] language syntax pack
Plug 'sheerun/vim-polyglot', { 'as': 'polyglot' }

" [smoothie] smooth scrolling
Plug 'psliwka/vim-smoothie', { 'as': 'smoothie' }

" [snippets] snippets for ultisnips
Plug 'honza/vim-snippets', Cond(has('nvim'), { 'as': 'snippets' })

" [startify] start screen
Plug 'mhinz/vim-startify', { 'as': 'startify' }

" [surround] edit surroundings
Plug 'tpope/vim-surround', { 'as': 'surround' }

" [tabular] easy text alignment
Plug 'godlygeek/tabular'

" [trouble] neovim lsp ui
Plug 'folke/trouble.nvim', Cond(has('nvim'), { 'as': 'trouble' })

" [snippets] snippets for ultisnips
Plug 'honza/vim-snippets', Cond(has('nvim'), { 'as': 'snippets' })

" [ultisnips] snippets manager
Plug 'SirVer/ultisnips', Cond(has('nvim'))

" [vimux] tmux interactions from vim
Plug 'preservim/vimux'

" [visual-multi] multiple cursors
Plug 'mg979/vim-visual-multi', { 'as': 'visual-multi' }

call plug#end()
