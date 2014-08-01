execute pathogen#infect()

" Reload with :source ~/.vimrc

"Basic
let mapleader=","
set nocompatible
set nocursorline
set number


syntax on
filetype plugin indent on

set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=2
set autoindent
set linebreak

" Temp Files
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" Switch off Swap Files for now
set noswapfile

set encoding=utf-8

" When spliting, focus on the new pane
map <C-\> :vsplit<CR>
map <C-_> :split<CR>
set splitbelow
set splitright

" NERDTree Config
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1


" Use silver surfer for Acking.
let g:ackprg = 'ag --nogroup --nocolor --column'

syntax enable
colorscheme solarized
let g:solarized_termcolors=256

if has('gui_running')
	set background=light
else
	set background=dark
endif

map <Leader>S :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
map <Leader>r :call RunAllSpecs()<CR>
"let g:rspec_command = "Rrunner {spec}"
"let g:rspec_command = "Dispatch zeus rspec {spec}"
let g:rspec_command = "compiler rspec | set makeprg=spring | Make rspec {spec}"

" Don't start new tabs in insert mode
" au BufWinEnter * set noinsertmode
" au BufWinEnter *.php,*.js,*.inc,*.css,*.html,*.htm set insertmode | imap <buffer> <Esc> <C-l>

" ,cs copies current file path to clipboard.
nmap <Leader>cs :let @*=expand("%")<CR>
