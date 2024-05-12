set nocompatible

set ttyfast
let loaded_matchparen = 1

execute pathogen#infect()

set encoding=utf-8
set fileencoding=utf-8
set viminfo+=n~/.vim/viminfo
set backupdir=~/.vim/backup/
set backup
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile
set history=50
au BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \ exe "normal! g`\"" |
  \ endif

let g:conjure#filetype#scheme = "conjure.client.guile.socket"
let g:conjure#client#guile#socket#pipename = ".guile-repl.socket"

let g:airline_powerline_fonts=1
let g:airline_left_sep="\ue0bc"
let g:airline_left_alt_sep="\ue0bd"
let g:airline_right_sep="\ue0ba"
let g:airline_right_alt_sep="\ue0bb"
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#tabline#show_close_button=0
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#whitespace#enabled=0
if !exists('g:airline_symbols') 
  let g:airline_symbols = {} 
endif 
let g:airline_symbols.maxlinenr=''

let g:startify_custom_header=['']

nmap \\ :Startify<cr>
nmap \n :enew<cr>
nmap \l :bnext<cr>
nmap \h :bprevious<cr>
nmap \c :BD<cr>

nnoremap j gj
nnoremap k gk

cnoreabbrev W w

let g:rainbow_active = 1
let g:rainbow_conf = {
\   'ctermfgs': ([3,13,9,4,1,6,5,2])
\}

syntax on
set background=light
colorscheme solarized
highlight NormalFloat ctermbg=15
highlight FloatBorder ctermbg=7

call togglebg#map("<F5>")

filetype plugin indent on
set autoindent
set number
set expandtab
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
set hidden

set wildmenu
set showcmd
set incsearch

set ignorecase
set smartcase

set nostartofline
set cursorline
set laststatus=2
set confirm
set visualbell
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set mouse=""

map Y y$
map Q gq
nnoremap <C-L> :nohl<CR><C-L>
inoremap <C-U> <C-G>u<C-U>
set langnoremap

set updatetime=250
let g:boostmove=0
au CursorMoved * call BoostMoveON()
au CursorMovedI * call BoostMoveON()
au CursorHold * call BoostMoveOFF()
au CursorHoldI * call BoostMoveOFF()
function BoostMoveON()
  if (g:boostmove == 0)
    let g:boostmove=1
    setlocal nocursorline
  endif
endfunction
function BoostMoveOFF()
  if (g:boostmove == 1)
    let g:boostmove=0
    setlocal cursorline
  endif
endfunction
