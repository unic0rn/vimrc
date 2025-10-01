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

nnoremap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = "\uf054"
let g:NERDTreeDirArrowCollapsible = "\uf078"
let g:NERDTreeShowHidden = 1

autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

let g:startify_custom_header = ['']
let g:startify_session_dir = '~/.vim/session'
let g:startify_session_autoload = 0
let g:startify_session_persistence = 0
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir = 0
let g:startify_enable_special = 0

let g:startify_files_number = 3
let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

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

lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight-day',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
END

syntax on
set background=light
colorscheme tokyonight-day
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
"set pastetoggle=<F11>
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
