"
" vim-plug
" https://github.com/junegunn/vim-plug
" Managing plugins
" After running this, run:
" PlugUpdate
"

call plug#begin('~/.vim/plugged')
" NERDTree
Plug 'scrooloose/nerdtree'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Linting
Plug 'neomake/neomake'
Plug 'w0rp/ale'

" Comments
" Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'

" Search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'matthewbdaly/vim-filetype-settings'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'

" Autocomplete
" After install, run:
" cd ~/.vim/plugged/YouCompleteMe
" ./install.py --clang-completer
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" HTML5
" Plug 'othree/html5'

" CSS
" Plug 'csscomb/vim-csscomb'

" Ruby on Rails
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
" Plug 'thoughtbot/vim-rspec'

" Themes
" Plug 'nanotech/jellybeans.vim' , {'as': 'jellybeans'}
Plug 'altercation/vim-colors-solarized'
Plug 'rakr/vim-one'
Plug 'marcopaganini/termschool-vim-theme'

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

" Add a vertical line at column 81
set colorcolumn=81

"
" Colour Schemes
"

set t_Co=256
syntax enable
filetype plugin indent on

" Use a high contrast solarized
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Add 'Source Code Pro' font via:
" brew tap caskroom/fonts && brew cask install font-source-code-pro
set guifont=Source\ Code\ Pro:h11

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
au FileType css setl ofu=csscomplete#CompleteCSS

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
nmap <Leader>aff :silent ! docker-compose run --rm --no-deps web rubocop % --safe-auto-correct<CR>

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
let g:ackprg = 'ag --vimgrep'

" Airline
let g:airline_powerline_fonts = 0
set laststatus=2

" Vim Rails
let g:rails_default_file='config/database.yml'

"
" Asynchronous Lint Engine - https://github.com/w0rp/ale
" Also run:
" npm install -g eslinter
"
let g:airline#extensions#ale#enabled = 0
" Only Lint when I've changed a file.
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
" Other ale config.
let g:ale_set_balloons = 0
let g:ale_set_highlights = 1
let g:ale_set_signs = 1
let g:ale_scss_stylelint_use_global = 1
let g:ale_sign_column_always = 1
" Highlight the bad lines.
highlight link ALEErrorLine error
"highlight link ALEWarningLine todo
"highlight ALESignColumnWithoutErrors guibg=#EEE8D5
"highlight ALESignColumnWithErrors guibg=#EEE1D5
silent! helptags ALL

"highlight link ALEErrorLine error
"highlight link ALEWarningLine todo

highlight clear ALEErrorLine

" Don't lint .erb files, the linter is shit.
let g:ale_pattern_options = {'\.erb$': {'ale_enabled': 0}}

highlight error guifg=#fdf6e3 guibg=#af0000 
"highlight todo guifg=#fdf6e3 guibg=#af005f
highlight SignColumn guifg=#93A1A1 guibg=#EEE8D5

