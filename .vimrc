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
" ctrl+\ and ctrl+- also make new splits.
map <C-\> :vsplit<CR>
map <C-_> :split<CR>
set splitbelow
set splitright

" NERDTree Config
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1

" Faster Pane switching
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" CtrlP
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <Leader>t :CtrlP<CR>
" Ignore files in git ignore. From https://github.com/kien/ctrlp.vim/issues/174#issuecomment-49747252
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Use silver surfer for Acking.
let g:ackprg = 'ag --nogroup --nocolor --column'

syntax enable
colorscheme solarized
let g:solarized_termcolors=256

if has('gui_running')
  set background=light
else
  set background=light
endif

map <Leader>S :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
map <Leader>r :call RunAllSpecs()<CR>

" In MVim run specs in a new buffer.
if has('gui_running')
  let g:rspec_command = "Dispatch echo 'Warming up' && foreman run rspec {spec}"
else
  let g:rspec_command = "Dispatch clear && foreman run rspec {spec}"
endif

" Don't start new tabs in insert mode
" au BufWinEnter * set noinsertmode
" au BufWinEnter *.php,*.js,*.inc,*.css,*.html,*.htm set insertmode | imap <buffer> <Esc> <C-l>

" ,cfp copies current file path to clipboard.
nmap <Leader>cfp :let @*=expand("%")<CR>

" ,ffle Fix line endines in a file.
nmap <Leader>ffle :set fileformat=unix<CR>

"" It's ctrl+p then F5 to refresh ctrlp's file list.
