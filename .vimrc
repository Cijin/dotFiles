" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
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
" Plug 'arzg/vim-colors-xcode'
Plug 'morhetz/gruvbox'

"Auto-pairs for brackets and quotes
Plug 'jiangmiao/auto-pairs'

" For php development
Plug 'stephpy/vim-php-cs-fixer'

"Initialize plugin system
call plug#end()

" ------------------------------------------------------
" ------------------------------------------------------
" ------------------------------------------------------
" ---------------- START PLUGIN RELATED SECTION ------------
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
" enable color scheme
"colorscheme xcodedark
colorscheme gruvbox
set background=dark    " Setting dark mode
" --- END --- spaceduck color scheme

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
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never'
endif

" Files to ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
" --- end --- ctrlp Settings

" php-cs-fixer-config
let g:php_cs_fixer_path = "~/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_php_path = "php"


" ---------------- END PLUGIN RELATED SECTION ------------
" ------------------------------------------------------
" ------------------------------------------------------
" ------------------------------------------------------


" Show linenumber
set number

" --- start --- Tabs vs Spaces
set expandtab       "Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=2    "Indent by 2 spaces when using >>, <<, == etc.
set softtabstop=2   "Indent by 2 spaces when pressing <TAB>

set autoindent      "Keep indentation from previous line
set smartindent     "Automatically inserts indentation in some cases
set cindent         "Like smartindent, but stricter and more customisable
" --- end --- Tabs vs spaces

" change the mapleader from \ to ,
let mapleader=","

" Key for toggling paste
set pastetoggle=<c-z>

" Source - https://vim.fandom.com/wiki/Switch_between_Vim_window_splits_easily
set wmw=0           " do not display current line of each minimized file
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k

set noswapfile      " No swap files

" enable incremental search in vim
set incsearch
set hlsearch " Highlight all search results

" fix on-save for php-cs-fixer plugin
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

