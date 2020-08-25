set nocompatible
syntax enable 
set number
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nowrap

set path+=**
set wildmenu

call plug#begin('~/.vim/plugged')
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'elzr/vim-json'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()
set t_Co=256
set background=light
colorscheme dracula
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

let g:vim_jsx_pretty_colorful_config = 1
