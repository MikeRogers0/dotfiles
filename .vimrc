"
" vim-plug
" https://github.com/junegunn/vim-plug
" Managing plugins
" After running this, run:
" PlugUpdate
"

call plug#begin('~/.vim/plugged')

" Sensible Defaults
Plug 'tpope/vim-sensible'

" NERDTree
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Linting
Plug 'neomake/neomake'

" Comments
Plug 'preservim/nerdcommenter'

" Search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'matthewbdaly/vim-filetype-settings'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'terryma/vim-multiple-cursors'
" Plug 'godlygeek/tabular'

" Autocomplete
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer' }

" Ruby on Rails
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" Themes
" Plug 'nanotech/jellybeans.vim'
Plug 'altercation/vim-colors-solarized'
" Plug 'rakr/vim-one'
" Plug 'marcopaganini/termschool-vim-theme'
Plug 'vim-scripts/twilight256.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"
" Core bits
"

let mapleader=","
set number
set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=2
set autoindent
set linebreak
set linespace=1

" Add a vertical line at column 120
set colorcolumn=120
highlight ColorColumn guibg=#202020

"
" Colour Schemes
"

" set t_Co=256
syntax enable
filetype plugin indent on

" Use a high contrast solarized
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
set background=dark
colorscheme twilight256

" Add 'Source Code Pro' font via:
" brew tap caskroom/fonts && brew cask install font-source-code-pro
" set guifont=Source\ Code\ Pro:h11

"
" Disable temp files and swap
" 
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set noswapfile

"
" Encoding UTF-8
"

set encoding=utf-8

"
" Spellchecker - British English
"

set spell spelllang=en_gb
setlocal spell spelllang=en_gb

"
" Auto completion
"

au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType css,scss setl ofu=csscomplete#CompleteCSS
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

set completeopt=menu,preview

"
" Folding
"

set foldmethod=indent
set foldlevel=20

" 
" Autoupdate files when they're changed outside of vim
"

set autoread

"
" Other shortcuts I use sometimes.
"

" ,cfp copies current file path to clipboard.
nmap <Leader>cfp :let @*=expand("%")<CR>

" ,ffle Fix line endines in a file.
nmap <Leader>ffle :set fileformat=unix<CR>

" ,aff - Auto fix this file with rubocop
nmap <Leader>aff :silent ! docker-compose run --rm --no-deps web bundle exec rubocop % --safe-auto-correct<CR>

" ,s - Run current line RSpec
nmap <Leader>s :! run_ruby_tests <C-r>=system('echo ' . expand('%') . ':' . line('.'))<CR><CR>

" ,S - Run current file in RSpec
nmap <Leader>S :! run_ruby_tests %<CR>

"
" Plugin Configuration
"

" NERDTree
map <leader>N :NERDTreeToggle<CR>
map <leader>n :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1

" CtrlP
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <Leader>t :CtrlP<CR>
" Ignore files in git ignore. From https://github.com/kien/ctrlp.vim/issues/174#issuecomment-49747252
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Ack
" Also run:
" brew install the_silver_searcher
let g:ackprg = 'ag --path-to-ignore ~/.ignore --hidden --vimgrep'

" Airline
let g:airline_powerline_fonts = 1
set laststatus=2

"highlight error guifg=#fdf6e3 guibg=#af0000
"highlight todo guifg=#fdf6e3 guibg=#af005f
"highlight SignColumn guifg=#93A1A1 guibg=#EEE8D5
