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
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'elzr/vim-json'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'prettier/vim-prettier', { 'do': 'npm install'  }
call plug#end()

"somehow makes dracula work as intended (do not delete)
set t_Co=256
set background=light
colorscheme dracula
highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE

"Don't really know what this does? hmm...
let g:vim_jsx_pretty_colorful_config = 1
let g:vim_jsx_pretty_highlight_close_tag = 0

"Tells NERDTree to ignore node_modules
let g:NERDTreeIgnore = ['^node_modules$']
"maps NERDTree to open when ctrl + n is pressed :)
map <C-n> :NERDTreeToggle<CR>

"sets Prettier to run on save (or pre save)
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

