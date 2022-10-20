call plug#begin('~/.vim/plugged')

" Vim-Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Shorthand notation => fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" COC
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" AFTERWARDS!!!!
" RUN IN VIM----
" :CocInstall coc-tsserver coc-json coc-html coc-css
" :CocInstall coc-eslint coc-prettier

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Git worktree plugin
Plug 'ThePrimeagen/git-worktree.nvim'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" handles syntax for most languages
Plug 'sheerun/vim-polyglot'

" Color themes
Plug 'VDuchauffour/neodark.nvim'

" cursor line
Plug 'yamatsum/nvim-cursorline'

" Auto-pairs for brackets and quotes
Plug 'jiangmiao/auto-pairs'


" Surround use cs (change surrounding) to change 
" quotes or tags surrounding a word or line
Plug 'tpope/vim-surround'

" Repeat.vim remaps . in a way that plugins can tap into it.
Plug 'tpope/vim-repeat'

" Vim-fugitive git plugin
Plug 'tpope/vim-fugitive'

" git gutter/ see changes in current file
Plug 'airblade/vim-gitgutter'

" statusline
Plug 'nvim-lualine/lualine.nvim'

" NERD commenter
Plug 'preservim/nerdcommenter'

" close html-jsx tags
Plug 'alvan/vim-closetag'

" displaying thin vertical lines where code indented with spaces
Plug 'yggdroot/indentline'

" closure-vim
Plug 'tpope/vim-dispatch'
Plug 'clojure-vim/vim-jack-in'
" Only in Neovim:
Plug 'radenling/vim-dispatch-neovim'

"Initialize plugin system
call plug#end()

" ------------------------------------------------------
" ------------------------------------------------------
" ------------------------------------------------------
" ---------------- START PLUGIN RELATED SECTION --------

syntax on

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif


set termguicolors
set background=dark

colorscheme neodark

" does what it says :D
highlight Comment cterm=italic gui=italic

" --- start --- NerdTree Settings
map <C-n> :NERDTreeToggle<CR>
" --- END --- NerdTree


" change the leader to [Space],
let mapleader=" "

" --- start --- Vim Fugitive
" vim fugitive settings below
" remap :G to leader(space)gs
nmap <leader>gs :G<CR>
" Commands below used when merging conflicts
" remap :diffget 2(left) -> leader-gf
nmap <leader>gf :diffget //2<CR>

" remap :diffget 3(left) -> leader-gj
nmap <leader>gj :diffget //3<CR>
nnoremap <leader>k :wincmd k<CR>
" --- end --- Vim Fugitive

" --- start --- Nerd Commenter
let g:NERDCustomDelimiters = { 'js': { 'left': '/*------------','right': '*/------------' }, 
      \  'jsx': { 'left': '/*------------','right': '*/------------' } ,
      \'ts': { 'left': '/*------------','right': '*/------------' }, 
      \'tsx': { 'left': '/*------------','right': '*/------------' } }

filetype plugin on
" --- end --- Nerd Commenter

" --- start --- Tabs vs Spaces
set expandtab       "Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=2    "Indent by 2 spaces when using >>, <<, == etc.
set softtabstop=2   "Indent by 2 spaces when pressing <TAB>

set autoindent      "Keep indentation from previous line
set smartindent     "Automatically inserts indentation in some cases
set cindent         "Like smartindent, but stricter and more customisable
" --- end --- Tabs vs spaces

" --- start --- vim closetag
let g:closetag_filenames = '*.html,*.tsx,*.jsx,*.vue,*.edge, *.gohtml, *.go'

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" --- end --- Tabs vs spaces

" Telescope remaps
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pj :lua require('telescope.builtin').jumplist()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>gc :lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>

" --- start --- Harpoon
nnoremap <leader>m :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <leader>f :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>r :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>t :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>g :lua require("harpoon.ui").nav_file(4)<CR>
" --- end --- Harpoon


" vimwiki settings
let g:vimwiki_list = [{
  \ 'automatic_nested_syntaxes':1,
  \ 'path': '$HOME/vimwiki/content',
  \ 'syntax': 'markdown',
  \ 'ext':'.md',
  \ 'template_default':'markdown',
\}]

" --- start --- COC Settings
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" --- end --- COC Settings

" ---------------- END PLUGIN RELATED SECTION ------------
" ------------------------------------------------------
" ------------------------------------------------------
" ------------------------------------------------------


" Change cursor type based on mode
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif


" Source - https://vim.fandom.com/wiki/Switch_between_Vim_window_splits_easily
set wmw=0           " do not display current line of each minimized file
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k

" No swap files 
set noswapfile     

" enable incremental search in vim
set incsearch
set hlsearch " Highlight all search results

" relative linenumbers
set relativenumber

" Show linenumber
set number

" to work better with kitty
let &t_ut=''

" start scrolling 8 lines before bottom of file
set scrolloff=12

" hide statusline line
set noshowmode

" set mouse so as to scroll error pop-ups
set mouse=a

" save undo trees in files
set undofile
set undodir=~/.vim/undodir

" number of saved undo
set undolevels=10000

" required for vimwiki
set nocompatible

" use space instead of tab for indentline, as conflicts with vim-go
" there is a [space] at the end, this is intentional
set list lcs=tab:\¦\ 

" vsplit
nmap <leader>w :vsplit<CR>

" vnew and close other tab
nmap <leader>n :vnew \| on<CR>

" add missing imports on save (Go)
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" go template highlight
au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl

" map leader y to save register plus ( clipboard )
vnoremap <leader>y "+y<ESC>

" go lint
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim

" set column line at 80 characters
:hi ColorColumn guibg=#3b3d3f ctermbg=246
set textwidth=80
set colorcolumn=+1
