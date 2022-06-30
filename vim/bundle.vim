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

" [bbye] better :bd and :bw
Plug 'moll/vim-bbye', { 'as': 'bbye' }

" [cmp] completion
Plug 'hrsh7th/nvim-cmp', Cond(has('nvim'), { 'as': 'cmp' })

" [cmp-lsp] completion using lsp
Plug 'hrsh7th/cmp-nvim-lsp', Cond(has('nvim'), { 'as': 'cmp-lsp' })

" [cmp-buffer] completion using buffer
Plug 'hrsh7th/cmp-buffer', Cond(has('nvim'))

" [cmp-cmdline] completion for command line
Plug 'hrsh7th/cmp-cmdline', Cond(has('nvim'))

" [cmp-path] completion for paths
Plug 'hrsh7th/cmp-path', Cond(has('nvim'))

" [cmp-ultisnips] completion using ultisnips
Plug 'quangnguyen30192/cmp-nvim-ultisnips', Cond(has('nvim'), { 'as': 'cmp-ultisnips' })

" [commentary] comment text
Plug 'tpope/vim-commentary', { 'as': 'commentary' }

" [devicons] icons for various plugins
Plug 'ryanoasis/vim-devicons', { 'as': 'devicons' }

" [easymotion] motions on speed
Plug 'easymotion/vim-easymotion', { 'as': 'easymotion' }

" [editorconfig] editorconfig support
Plug 'editorconfig/editorconfig-vim', { 'as': 'editorconfig' }

" [expand-region] expand select region
Plug 'terryma/vim-expand-region', { 'as': 'expand-region' }

" [emmet] emmet completions
Plug 'mattn/emmet-vim', { 'as': 'emmet' }

" [fix-cursor-hold] fix updatetime for neovim
Plug 'antoinemadec/FixCursorHold.nvim', Cond(has('nvim'), { 'as': 'fix-cursor-hold' })

" [fzf] fuzzy finder
Plug 'junegunn/fzf', { 'do': {-> fzf#install() } }

" [fzf-vim] fzf support for vim
Plug 'junegunn/fzf.vim', { 'as': 'fzf-vim' }

" [gitbranch] gitbranch name
Plug 'itchyny/vim-gitbranch', { 'as': 'gitbranch' }

" [gitgutter] show git status in gutter
Plug 'airblade/vim-gitgutter', { 'as': 'gitgutter' }

" [highlighted-yank] highlight yank commands
Plug 'machakann/vim-highlightedyank', { 'as': 'highlighted-yank' }

" [indent-line] indent lines
Plug 'Yggdroot/indentLine', { 'as': 'indent-line' }

" [lightline] enhanced statusline
Plug 'itchyny/lightline.vim', { 'as': 'lightline' }

" [lightline-bufferline] bufferline for lightline
Plug 'mengelbrecht/lightline-bufferline'

" [lspconfig] config for nvim lsp
Plug 'neovim/nvim-lspconfig', Cond(has('nvim'), { 'as': 'lspconfig' })

" [lspkind] lsp icons
Plug 'onsails/lspkind.nvim', Cond(has('nvim'), { 'as': 'lspkind' })

" [nerdtree] file browser
Plug 'preservim/nerdtree'

" [nerdtree-colors] file colors in nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'as': 'nerdtree-colors' }

" [onedark] one dark theme
Plug 'joshdick/onedark.vim', { 'as': 'onedark' }

" [polyglot] language syntax pack
Plug 'sheerun/vim-polyglot', { 'as': 'polyglot' }

" [rsi] readline keybinds in command mode
Plug 'tpope/vim-rsi', { 'as': 'rsi' }

" [smoothie] smooth scrolling
Plug 'psliwka/vim-smoothie', { 'as': 'smoothie' }

" [snippets] snippets for ultisnips
Plug 'honza/vim-snippets', Cond(has('nvim'), { 'as': 'snippets' })

" [startify] start screen
Plug 'mhinz/vim-startify', { 'as': 'startify' }

" [tabular] easy text alignment
Plug 'godlygeek/tabular'

" [trouble] neovim lsp ui
Plug 'folke/trouble.nvim', Cond(has('nvim'), { 'as': 'trouble' })

" [snippets] snippets for ultisnips
Plug 'honza/vim-snippets', Cond(has('nvim'), { 'as': 'snippets' })

" [ultisnips] snippets manager
Plug 'SirVer/ultisnips', Cond(has('nvim'))

" [vimspector] debugger for vim
Plug 'puremourning/vimspector'

" [vimux] tmux interactions from vim
Plug 'preservim/vimux'

" [visual-multi] multiple cursors
Plug 'mg979/vim-visual-multi', { 'as': 'visual-multi' }

call plug#end()
