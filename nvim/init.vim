" ===================
" === Neovim Init ===
" ===================

set runtimepath^=~/.vim
set runtimepath+=~/.vim/after

let &packpath = &runtimepath

source ~/.cfg/vim/vimrc.vim
source ~/.cfg/nvim/colorscheme.vim
source ~/.cfg/nvim/plugins.vim
source ~/.cfg/nvim/lsp.vim
