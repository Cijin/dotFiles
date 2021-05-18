" Specify a directory for plugins

" - For Neovim: stdpath('data') . '/plugged'

" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Shorthand notation => fetches https://github.com/junegunn/vim-easy-align

Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" For JS Development
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'

" COC
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" AFTERWARDS!!!!
" RUN IN VIM----
" :CocInstall coc-tsserver coc-json coc-html coc-css
" :CocInstall coc-eslint coc-prettier

" Color themes
Plug 'sainnhe/everforest'

" Auto-pairs for brackets and quotes
Plug 'jiangmiao/auto-pairs'


" Surround use cs (change surrounding) to change 
" quotes or tags surrounding a word or line
Plug 'tpope/vim-surround'

" Vim-fugitive git plugin
Plug 'tpope/vim-fugitive'

" commit browser, works with fugitive
Plug 'junegunn/gv.vim'

" a tool to map through a files git history
Plug 'tpope/vim-unimpaired'

" plugin to repeat prev command even after plugin map
Plug 'tpope/vim-repeat'

" vim air line (statusline)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" rainbow brackets
Plug 'luochen1990/rainbow' 

" NERD commenter
Plug 'preservim/nerdcommenter'

" close html-jsx tags
Plug 'alvan/vim-closetag'

" displaying thin vertical lines where code indented with spaces
Plug 'yggdroot/indentline'

"Initialize plugin system
call plug#end()

" ------------------------------------------------------
" ------------------------------------------------------
" ------------------------------------------------------
" ---------------- START PLUGIN RELATED SECTION --------

syntax on

" enable color scheme
if has('termguicolors')
  set termguicolors
endif

colorscheme everforest
set background=dark    " Setting dark mode
let g:everforest_background = 'hard'

" --- start --- NerdTree Settings
map <C-n> :NERDTreeToggle<CR>
" --- END --- NerdTree

" --- start --- COC Settings
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources
" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" DEBUGGING -
" <tab> could be remapped by another plugin, use :verbose imap <tab> to check if it's mapped as expected.
" --- end --- COC Settings

" --- start --- ctrlp Settings to search for files using ripgrep if available
" https://github.com/BurntSushi/ripgrep
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden'
endif

" Files to ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
" --- end --- ctrlp Settings

" airline theme
let g:airline_powerline_fonts = 1
let g:airline_theme = 'everforest'


" change the mapleader from \ to [Space],
let mapleader=" "

" --- start --- Vim Fugitive
set statusline =
set statusline +=\ %{fugitive#statusline()}

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

" --- start --- Rainbow brackets
let g:rainbow_active = 1 
" --- end --- Rainbow brackets

" --- start --- Nerd Commenter
let g:NERDCustomDelimiters = { 'js': { 'left': '/*------------','right': '*/------------' } }
let g:NERDCustomDelimiters = { 'jsx': { 'left': '/*------------','right': '*/------------' } }
let g:NERDCustomDelimiters = { 'ts': { 'left': '/*------------','right': '*/------------' } }
let g:NERDCustomDelimiters = { 'tsx': { 'left': '/*------------','right': '*/------------' } }

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
let g:closetag_filenames = '*.html,*.tsx,*.jsx,*.vue'

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" --- end --- Tabs vs spaces

" indentline section --- start ---
let g:indentLine_color_gui = '#595959'
" indentline section --- end ---



" ---------------- END PLUGIN RELATED SECTION ------------
" ------------------------------------------------------
" ------------------------------------------------------
" ------------------------------------------------------


" Key for toggling paste
set pastetoggle=<c-z>

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

" to work better with kitty
let &t_ut=''

" Show linenumber
set number

" hide statusline line
set noshowmode

" open new tab
nmap <leader>t :tabe<CR>
